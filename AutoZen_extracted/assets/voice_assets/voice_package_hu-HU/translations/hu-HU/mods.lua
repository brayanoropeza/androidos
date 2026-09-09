local mods = require('translations.mods')

function mods.apply_language_specific_mods(sentence)
    local modified_sentence = sentence

    -- add '-en' at the unit's end for 'follow distance' prompts with 'keresztül' word
    -- e.g.: "6 kilométer keresztül" becomes "6 kilométeren keresztül"
    modified_sentence = string.gsub(modified_sentence, '(%d+%.?%d*)%s+([^%s%p]+)%s+(keresztül)', '%1 %2en %3')

    -- add '.' at the end of pure digit exit number to make it sound ordinal
    -- e.g.: "a 8 kijáraton" becomes "a 8. kijáraton"
    modified_sentence = string.gsub(modified_sentence, '(a)%s+(%d+)%s+(kijáraton)', '%1 %2. %3')

    modified_sentence = string.gsub(modified_sentence, '{ORIENTATION} irányába ', '')
    modified_sentence = string.gsub(modified_sentence, ", {SIGNPOST}", "" )

    return modified_sentence
end

function mods.get_distance_phrase(distance, distance_unit, variables)
    -- handle dot as "," (e.g.: '0.5 mérföld' becomes '0,5 mérföld')
    distance = string.gsub(distance, '(%d+)%.(%d+)', '%1,%2')
    return distance .. ' ' .. variables[distance_unit]
end

function mods.adjust_direction_phrase(original_direction_phrase, template_id, prompt_table, segment_order)
    local direction_phrase = original_direction_phrase

    direction_phrase = string.gsub(direction_phrase, 'utca utcá', 'utcá')
    direction_phrase = string.gsub(direction_phrase, 'út utcán$', 'úton')
    direction_phrase = string.gsub(direction_phrase, 'út utcára$', 'útra')
    direction_phrase = string.gsub(direction_phrase, 'útja utcá', 'útjá')
    direction_phrase = string.gsub(direction_phrase, 'utcája utcá', 'utcájá')
    direction_phrase = string.gsub(direction_phrase, 'köz utcán$', 'közön')
    direction_phrase = string.gsub(direction_phrase, 'köz utcára$', 'közre')
    direction_phrase = string.gsub(direction_phrase, 'tér utcán$', 'téren')
    direction_phrase = string.gsub(direction_phrase, 'tér utcára$', 'térre')
    direction_phrase = string.gsub(direction_phrase, 'tere utcán$', 'terén')
    direction_phrase = string.gsub(direction_phrase, 'tere utcára$', 'terére')
    direction_phrase = string.gsub(direction_phrase, 'sor utcán$', 'soron')
    direction_phrase = string.gsub(direction_phrase, 'sor utcára$', 'sorra')
    direction_phrase = string.gsub(direction_phrase, 'dűlő utcán$', 'dűlőn')
    direction_phrase = string.gsub(direction_phrase, 'dűlő utcára$', 'dűlőre')
    direction_phrase = string.gsub(direction_phrase, 'híd utcán$', 'hídon')
    direction_phrase = string.gsub(direction_phrase, 'híd utcára$', 'hídra')
    direction_phrase = string.gsub(direction_phrase, 'sétány utcán$', 'sétányon')
    direction_phrase = string.gsub(direction_phrase, 'sétány utcára$', 'sétányra')

    -- If street name begins with a vowel, use `az` instead of `a`
    direction_phrase = string.gsub(direction_phrase, '^a ([AÁEÉIÍOÓÖŐUÚÜŰaáeéiíoóöőuúüű])(.+)', 'az %1%2')

    return direction_phrase
end

return mods
