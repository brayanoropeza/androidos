local mods = require('translations.mods')

function mods.apply_language_specific_mods(sentence)
    sentence = sentence:gsub("%s*%.$", "।")
    sentence = sentence:gsub("{LANDMARK} से", "")
    sentence = sentence:gsub("{NEXT_LANDMARK} से", "")
    sentence = sentence:gsub(", {SIGNPOST}", "" )

    return sentence
end

return mods
