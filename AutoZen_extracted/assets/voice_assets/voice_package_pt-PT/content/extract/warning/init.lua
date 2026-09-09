local common = require 'content.extract.common.init'

local warning = {}


function warning.extract_warning(input)
    local message_content = common.extract_common_content(input)
    if (message_content.trigger == "traffic_merge") then
        message_content.merge_side = common.attributes.get_merge_side(input)
    end
    if (message_content.trigger == "lane_decrease") then
        if input.lanes_decreased_from_left then
            message_content.lanes_decreased_from_left = input.lanes_decreased_from_left
        end
        if input.lanes_decreased_from_right then
            message_content.lanes_decreased_from_right = input.lanes_decreased_from_right
        end
    end
    return message_content
end


return warning
