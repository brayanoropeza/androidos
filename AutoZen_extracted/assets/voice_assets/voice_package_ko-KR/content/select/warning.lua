local warning = {}


function warning.select_common_content()
    local content = {}
    content.prompt_class = 'notification'
    return content
end


function warning.get_merge_side(merge_side)
    if merge_side == 'left' or merge_side == 'right' then
        return 'nav.variable.FROMSIDE.'..string.lower(merge_side)
    else
        return ''
    end
end


function warning.get_lane_decrease_merge(message_table)
    local has_left = message_table.lanes_decreased_from_left ~= nil
    local has_right = message_table.lanes_decreased_from_right ~= nil
    if has_left and not has_right then
        return 'nav.variable.MOVE.mergeleft'
    elseif has_right and not has_left then
        return 'nav.variable.MOVE.mergeright'
    else
        return ''
    end
end


function warning.select_warning(message_table)
    local content = warning.select_common_content()
    if message_table.trigger == 'gps_signal_lost' then content.action = 'gpslost'
    elseif message_table.trigger == 'gps_signal_restored' then content.action = 'gpsrestored'
    elseif message_table.trigger == 'route_recalculation' then content.action = 'newroute'
    elseif message_table.trigger == 'safety_camera' then content.action = 'speedcamera'
    elseif message_table.trigger == 'traffic_merge' then
        content.action = 'trafficmerge'
        content.merge_side = warning.get_merge_side(message_table.merge_side)
    elseif message_table.trigger == 'lane_decrease' then
        content.action = 'laneend'
        content.merge_direction = warning.get_lane_decrease_merge(message_table)
    end
    return content
end


return warning
