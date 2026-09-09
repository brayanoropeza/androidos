local mods = require('translations.mods')

function mods.apply_language_specific_mods(sentence)
    sentence = sentence:gsub(", {SIGNPOST}", "" )
    sentence = sentence:gsub("{DIRECTION} নিন", "")
    sentence = sentence:gsub("{NEXT_DIRECTION} নিন", "")
    sentence = sentence:gsub("{DIRECTION} এ যান", "")
    sentence = sentence:gsub("{NEXT_DIRECTION} এ যান", "")
    sentence = sentence:gsub("{DIRECTION} এ", "")
    sentence = sentence:gsub("{NEXT_DIRECTION} এ", "")
    sentence = sentence:gsub("{LANDMARK} এ আসুন", "")
    sentence = sentence:gsub("{NEXT_LANDMARK} এ আসুন", "")
    sentence = sentence:gsub("{LANDMARK} এ", "")
    sentence = sentence:gsub("{NEXT_LANDMARK} এ", "")
    sentence = sentence:gsub("%s*,+%s*{SECOND}", "")
    sentence = sentence:gsub("%s*%.$", "।")

    return sentence
end

return mods
