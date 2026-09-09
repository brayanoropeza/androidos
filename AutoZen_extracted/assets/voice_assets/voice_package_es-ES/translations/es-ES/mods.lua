local mods = require('translations.mods')

local function handle_spanish_and_word(following_word)
    --[["and" is in Spanish "y" or "e".
    "e" is used only in following cases:
        1. " e i_REST_OF_THE_WORD", e.g. "e inmediatamente"
        2. " e hi_REST_OF_THE_WORD", e.g. "e hijas"

    In other cases, "y" is used.]]
    local and_word = "y"

    if following_word:find("^i") == 1 or
       following_word:find("^hi") == 1 then
        and_word = "e"
    end

    return string.format(" %s %s", and_word, following_word)
end

function mods.apply_language_specific_mods(sentence)
    -- Handling Spanish "and" word
    sentence = string.gsub(sentence, "%s+y%s+(%w+)", handle_spanish_and_word)

    sentence = string.gsub(sentence, "al {ORIENTATION} ", "")
    sentence = string.gsub(sentence, ", {SIGNPOST}", "" )

    return sentence
end

function mods.get_distance_phrase(distance, distance_unit, variables)
    -- handle dot as "," (e.g.: 'After 0.5 miles' becomes 'A 0,5 millas')
    distance = string.gsub(distance, '(%d+)%.(%d+)', '%1,%2')
    return distance .. ' ' .. variables[distance_unit]
end

return mods
