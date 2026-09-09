local mods = require('translations.mods')

function mods.apply_language_specific_mods(sentence)
    sentence = sentence:gsub("{ORIENTATION} நோக்கிச்", "")
    sentence = sentence:gsub(", {INTERVAL}", "")
    sentence = sentence:gsub(", {SIGNPOST} நோக்கி", " நோக்கி")

    return sentence
end

return mods

