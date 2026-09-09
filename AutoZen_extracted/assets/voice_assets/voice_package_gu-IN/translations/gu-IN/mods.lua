local mods = require('translations.mods')

function mods.apply_language_specific_mods(sentence)
    sentence = sentence:gsub("{ORIENTATION} પર", "")
    sentence = sentence:gsub(", {SIGNPOST} તરફ", " તરફ")

    return sentence
end

return mods

