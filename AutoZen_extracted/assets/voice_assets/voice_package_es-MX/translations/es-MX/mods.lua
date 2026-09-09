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
    local modified_sentence = sentence

    -- Handling Spanish "and" word
    modified_sentence = string.gsub(modified_sentence, "%s+y%s+(%w+)", handle_spanish_and_word)

    -- add a space between leading letter and digits of a highway number
    -- also, in order to avoid extension from "L-3" into "Local-3", "N-23" into "Numero23", "S10" into "Sur10", etc
    modified_sentence = string.gsub( modified_sentence, "([A-Z])(%d+)", "%1 %2" )

    -- don't pronounce B as "be grande" when followed by digits - this is a rule specific for Latin American Spanish
    modified_sentence = string.gsub( modified_sentence, "B(%s*)(%d+)", "Be %2" )

    modified_sentence = string.gsub( modified_sentence, "al {ORIENTATION} ", "" )
    modified_sentence = string.gsub( modified_sentence, ", {SIGNPOST}", "" )

    return modified_sentence
end

return mods
