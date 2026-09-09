local mods = require('translations.mods')

mods.number_to_string = {
    [2] = 'שְׁנֵי',
    [3] = 'שְׁלוֹשָׁה',
    [4] = 'אַרְבָּעָה',
    [5] = 'חֲמִשָּׁה',
    [6] = 'שִׁשָּׁה',
    [7] = 'שִׁבְעָה',
    [8] = 'שְׁמוֹנָה',
    [9] = 'תִּשְׁעָה',
    [10] = 'עֲשָׂרָה'
}

function mods.apply_language_specific_mods(sentence)
    -- adjust article for waypoint to feminine
    sentence = sentence:gsub('נְקֻדַּת הַצִּיּוּן יִהְיֶה', 'נְקֻדַּת הַצִּיּוּן תהיה')
    sentence = sentence:gsub('נְקֻדַּת הַצִּיּוּן. הוּא ', 'נְקֻדַּת הַצִּיּוּן. היא ')

    -- adjust word when destination/waypoint is combibed with preposition `to`
    sentence = sentence:gsub('אֶל הַיַּעַד', 'לַיַּעַד')
    sentence = sentence:gsub('אֶל נְקֻדַּת', 'לִנְקֻדַּת')

    -- adjust immediately word to be put in between verd and turn direction
    sentence = sentence:gsub('שְׂמֹאלָה מִיָּד', 'מִיָּד שְׂמֹאלָה')
    sentence = sentence:gsub('יָמִינָה מִיָּד', 'מִיָּד יָמִינָה')
    sentence = sentence:gsub('יָשָׁר מִיָּד', 'מִיָּד יָשָׁר')

    sentence = sentence:gsub(", {SIGNPOST}", "" )

    return sentence
end

function mods.get_distance_phrase(distance, distance_unit, variables)
    local distance_number = tonumber(distance)

    -- number one is spokenly unnecessary in distance phrase
    if distance_number == 1 then
        return variables[distance_unit]
    -- round numbers between 1 and 10 should be declined based on the distance unit
    elseif distance_number > 1 and distance_number <= 10
        and mods.number_to_string[distance_number] ~= nil then
        return mods.number_to_string[distance_number] .. ' ' .. variables[distance_unit]
    else
        return distance .. ' ' .. variables[distance_unit]
    end
end

function mods.adjust_direction_phrase(phrase, template_id, prompt_table, segment_order)
    if _G['imperative_mode'] == nil then
        -- spell route name with more than two digits with spaces between digits
        phrase = phrase:gsub("([0-9])([0-9])([0-9])([0-9])", "%1 %2 %3 %4" )
        phrase = phrase:gsub("([0-9])([0-9])([0-9])", "%1 %2 %3" )
    end

    return phrase
end

return mods
