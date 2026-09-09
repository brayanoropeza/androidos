local mods = require('translations.mods')


local distance_accusative_mapping = { ['1'] = 'yhden',
                                      ['2'] = 'kahden',
                                      ['3'] = 'kolmen',
                                      ['4'] = 'neljän',
                                      ['5'] = 'viiden',
                                      ['6'] = 'kuuden',
                                      ['7'] = 'seitsemän',
                                      ['8'] = 'kahdeksan',
                                      ['9'] = 'yhdeksän',
                                      ['10'] = 'kymmenen',
                                      ['100'] = 'sadan',
                                      ['150'] = 'sadanviidenkymmenen',
                                      ['200'] = 'kahdensadan',
                                      ['250'] = 'kahdensadanviidenkymmenen',
                                      ['300'] = 'kolmensadan',
                                      ['350'] = 'kolmensadanviidenkymmenen',
                                      ['400'] = 'neljänsadan',
                                      ['450'] = 'neljänsadanviidenkymmenen',
                                      ['500'] = 'viidensadan',
                                      ['600'] = 'kuudensadan',
                                      ['700'] = 'seitsemänsadan',
                                      ['800'] = 'kahdeksansadan',
                                      ['900'] = 'yhdeksänsadan' }

function mods.get_distance_phrase(distance, distance_unit, variables)
    -- Handle dot as "," (e.g.: 'Kun 0.5 mailia' becomes 'Kun 0,5 mailia')
    distance = string.gsub(distance, '(%d+)%.(%d+)', '%1,%2')
    return distance .. ' ' .. variables[distance_unit]
end

function mods.apply_language_specific_mods(original_sentence)
    -- Handling "destination" and "waypoint" Finnish words in different (irregular) form
    local sentence = original_sentence:gsub("|([Mm])ääränpää|", "%1ääränpäähän")
    sentence = sentence:gsub("|[Rr]eittipiste|", "%1eittipisteeseen")
    sentence = sentence:gsub("^nyt aja", "aja nyt")
    sentence = sentence:gsub("^nyt tee", "tee nyt")
    sentence = sentence:gsub("^nyt jatka", "jatka nyt")
    sentence = sentence:gsub("^aja (.+) ja %(sitten%) aja", "%1 jälkeen aja")
    sentence = sentence:gsub("ja %(sitten%)%s+(.+)%s+ja", "ja %1 ja")
    sentence = sentence:gsub("ja %(sitten%)%s+([^%s]+)%s+", "ja %1 sitten ")
    sentence = sentence:gsub("metri jälkeen", "metrin jälkeen")
    sentence = sentence:gsub("metriä jälkeen", "metrin jälkeen")
    sentence = sentence:gsub("maili jälkeen", "mailin jälkeen")
    sentence = sentence:gsub("mailia jälkeen", "mailin jälkeen")
    sentence = sentence:gsub("jalkaa jälkeen", "jalan jälkeen")
    sentence = sentence:gsub("jaardia jälkeen", "jaardin jälkeen")
    sentence = sentence:gsub(", {SIGNPOST}", "" )

    -- Handling numbers in accusative form
    local i, j = string.find(sentence, "^[0-9]+%s+[^%s]+%s+jälkeen")
    if i ~= nil and j ~= nil then
        local distance_phrase = string.sub(sentence, i, j)
        i, j = string.find(distance_phrase, "[0-9]+")
        local distance_number = string.sub(distance_phrase, i, j)
        if distance_accusative_mapping[distance_number] ~= nil then
            local adjusted_distance_phrase = distance_phrase:gsub(distance_number, distance_accusative_mapping[distance_number])
            sentence = sentence:gsub(distance_phrase, adjusted_distance_phrase)
        end
    end

    return sentence
end

function mods.adjust_direction_phrase(original_direction_phrase, template_id, prompt_table, segment_order)
    local direction_phrase = original_direction_phrase

    if template_id:find('street') then
        local direction_language
        if segment_order == 'next' then
            direction_language = prompt_table.next_street.orthographic_language
        else
            direction_language = prompt_table.street.orthographic_language
        end
        if direction_language == 'fi' then
            direction_phrase = direction_phrase:gsub('tielle ([^%s]+)', '%1lle')
        end
    end

    return direction_phrase
end

return mods
