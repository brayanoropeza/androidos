local utils = require 'content.utils'
local common = require 'content.select.common'


local direction = {}

function direction.get_direction_information(order, trigger, instruction_class, road_class,
                                             street, route, signpost, intersection, marc_code,
                                             direction_information_rules, action, purpose,
                                             country_code, use_road_information_for_action_notification,
                                             use_signpost_direction_for_action_notification, continue_road_change)
    if common.is_enabled_japan_direction_for_japanese(country_code, marc_code, trigger, intersection) then
        return _create_jpn_direction_info_with_intersection(intersection)
    end

    if trigger == 'action' and (order == 'single' or order == 'first') then
        if use_road_information_for_action_notification ~= nil and use_road_information_for_action_notification == true then
            trigger = 'distance'
            if use_signpost_direction_for_action_notification == false then
                signpost = nil
            end
        end
    end

    local adjusted_route = _adjust_route_name_for_japan(street, route, country_code, instruction_class, road_class)

    local direction_information_key = direction.get_direction_information_key(street, adjusted_route, signpost)
    if not direction_information_key then return {} end

    local attributes = {instruction_order = order, trigger = trigger, instruction_class = instruction_class, road_class = road_class, direction_info = direction_information_key}
    local selected_direction_element_names = common.get_config_value(direction_information_rules, attributes)
    if not selected_direction_element_names then return nil end

    local direction_information = {}
    local direction_information_list = {['street'] = street, ['route'] = adjusted_route, ['signpost'] = signpost}
    for _, element_name in ipairs(selected_direction_element_names) do
        local expected_element_name = element_name
        if action == 'head' then expected_element_name = 'signpost' end

        if element_name == 'signpost' then
            direction_information[expected_element_name] = _get_filtered_signpost(signpost)
        else
            direction_information[expected_element_name] = utils.copy_table(direction_information_list[element_name])
        end
        direction_information[expected_element_name].preposition_id = _get_preposition_id(expected_element_name, action, purpose, continue_road_change)
    end
    return direction_information
end

function direction.get_skip_direction_information(trigger, road_class, distance_in_meters, direction_information_limit)
    local direction_information_threshold = common.get_config_value(direction_information_limit, {['trigger'] = trigger, ['road_class'] = road_class})
    if direction_information_threshold ~= nil and
       distance_in_meters > direction_information_threshold  then
        return true
    end
    return false
end

function direction.use_direction_information(trigger, road_class, distance_in_meters, direction_information_limit)
    return not direction.get_skip_direction_information(trigger, road_class, distance_in_meters, direction_information_limit)
end


function direction.get_direction_information_key(street, route, signpost)
    local direction_array = {}
    if street then direction_array[#direction_array + 1] = 'street' end
    if route then direction_array[#direction_array + 1] = 'route' end
    if signpost then direction_array[#direction_array + 1] = 'signpost' end
    if #direction_array == 0 then return nil end
    return '{' .. table.concat(direction_array, ',') .. '}'
end


function direction.get_highway_exit_information(order, trigger, exit_name, road_class, distance_in_meters, direction_information_limit, highway_exit_rules)
    if not highway_exit_rules or not direction_information_limit then return nil end

    local use_exit_information = direction.use_direction_information(trigger, road_class, distance_in_meters, direction_information_limit)
    if use_exit_information == nil then return nil end
    if use_exit_information == false then return {} end

    local exit_information = {['exit_name'] = exit_name}
    local exit_key = direction.get_exit_key(exit_name)
    if not exit_key then return nil end

    local attributes = {instruction_order = order, trigger = trigger, exit_info = exit_key}
    local selected_exit = common.get_config_value(highway_exit_rules, attributes)
    if not selected_exit then return nil end

    local selected_exit_information = {}
    for _, exit in ipairs(selected_exit) do
        selected_exit_information[exit] = utils.copy_table(exit_information[exit])
    end
    if utils.length(selected_exit_information) == 0 then return nil end
    return selected_exit_information
end


function direction.get_exit_key(exit_name)
    local exit_array = {}
    if exit_name then exit_array[#exit_array + 1] = 'exit_name' end
    if #exit_array == 0 then return nil end
    return '{' .. table.concat(exit_array, ',') .. '}'
end


function _create_jpn_direction_info_with_intersection(intersection)
    local direction_information = {}
    direction_information.intersection = utils.copy_table(intersection)
    direction_information.intersection.preposition_id = 'at'
    return direction_information
end


function _get_preposition_id(direction_element_name, action, purpose, continue_road_change)
    -- towards 'signpost'
    if direction_element_name == 'signpost' then return 'towards' end
    -- (follow|join) the 'route'
    if direction_element_name == 'route' and
       (action == 'follow' or
        (purpose ~= nil and purpose:find('tojoin'))) then
            return 'the'
    end
    -- on[to] ('street'|the 'route')
    local preposition_id = nil
    if action == 'arrive' then preposition_id = 'on'
    elseif action == 'exitroundabout' then preposition_id = 'onto'
    elseif action == 'takeexit' then preposition_id = 'onto'
    elseif action == 'turnkeep' then
        if purpose ~= nil and purpose:find('tocontinue') and continue_road_change == false then
            preposition_id = 'on'
        else
            preposition_id = 'onto'
        end
    end
    if preposition_id ~= nil then
        if direction_element_name == 'street' then return preposition_id
        elseif direction_element_name == 'route' then return preposition_id .. 'the' end
    end
    return nil
end


function _get_filtered_signpost(signpost)
    local filtered_signpost = utils.copy_table(signpost)
    filtered_signpost.name = _get_first_segment(signpost.name, ',')
    filtered_signpost.phonetic_form = _get_first_segment(signpost.phonetic_form, '<break>')
    return filtered_signpost
end


function _get_first_segment(text, separator)
    if text ~= nil and separator ~= nil then
        local separator_index = text:find(separator)
        if separator_index ~= nil then
            return text:sub(1, separator_index - 1)
        else
            return text
        end
    end
end


-- For Japan, on highways, the highway name should be used instead of highway number
function _adjust_route_name_for_japan(street, route, country_code, instruction_class, road_class)
    local adjusted_route = route
    if (country_code == 'jpn') and ((road_class == 'highway') or
       (road_class == 'street' and instruction_class == 'enter_highway')) then
        if street ~= nil then
            adjusted_route = street
        end
    end

    return adjusted_route
end


return direction
