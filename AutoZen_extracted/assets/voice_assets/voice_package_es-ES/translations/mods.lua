local mods = {}

function mods.apply_language_specific_mods(sentence)
    return sentence
end

function mods.get_distance_phrase(distance, distance_unit, variables)
    return distance .. ' ' .. variables[distance_unit]
end

function mods.adjust_direction_phrase(original_direction_phrase, template_id, prompt_table, segment_order)
    return original_direction_phrase
end

function mods.define_highway_category(street)
    return 'regular'
end

return mods
