local mods = require('translations.mods')

function mods.apply_language_specific_mods(sentence)
    sentence = sentence:gsub("{DIRECTION} ನಲ್ಲಿ", "")
    sentence = sentence:gsub("{NEXT_DIRECTION} ನಲ್ಲಿ", "")
    sentence = sentence:gsub(", {SIGNPOST}", "" )

    return sentence
end

return mods

