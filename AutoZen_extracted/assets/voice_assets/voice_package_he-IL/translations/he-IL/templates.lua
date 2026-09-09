local templates = {
    ['nav.-.follow.-.-'] = 'סַע ב-{DIRECTION}',
    ['nav.-.follow.-.distance'] = 'סַע ב-{DIRECTION} מֶרְחָק שֶׁל {DISTANCE}',
    ['nav.-.follow.-.distance-highway'] = 'סַע ב-{HIGHWAY} מֶרְחָק שֶׁל {DISTANCE}',
    ['nav.-.follow.-.distance-road'] = 'הֶמְשֵׁךְ בַּכְּבִישׁ לְמֶשֶׁךְ {DISTANCE}',
    ['nav.-.follow.-.highway'] = 'סַע ב-{HIGHWAY}',
    ['nav.-.follow.-.road'] = 'סַע בַּכְּבִישׁ',

    ['nav.-.head.-.-'] = 'סַע {ORIENTATION} {DIRECTION}',

    ['nav.landmark.makeuturn.-.-'] = '{LANDMARK} פְּנֵה פְּנִיַּת פַּרְסָה {SECOND}',
    ['nav.landmark.takeferry.-.-'] = '{LANDMARK} עָלֶה עַל הַמַּעְבֹּרֶת {DIRECTION} {SECOND}',
    ['nav.landmark.turnkeep.-.-'] = '{LANDMARK} {TURN_KEEP} {DIRECTION} {SECOND}',
    ['nav.landmark.turnkeep.tojoin.-'] = '{LANDMARK} {TURN_KEEP} כְּדֵי לַעֲלוֹת עַל {DIRECTION} {SECOND}',
    ['nav.landmark.turnkeep.tojoin.highway'] = '{LANDMARK} {TURN_KEEP} כְּדֵי לַעֲלוֹת עַל {HIGHWAY} {DIRECTION} {SECOND}',

    -- First maneuver
    ['nav.interval.arrive.-.side'] = '{INTERVAL} תַּגִּיעַ אֶל {GOAL} {DIRECTION}. {GOAL} יִהְיֶה {SIDE}',
    ['nav.interval.arrive.-.-'] = '{INTERVAL} תַּגִּיעַ אֶל {GOAL} {DIRECTION}',
    ['nav.interval.enterroundabout.-.-'] = '{INTERVAL} הִכָּנֵס לַכִּיכָּר {SECOND}',
    ['nav.interval.exitroundabout.-.-'] = '{INTERVAL} {TAKE_NTH_EXIT} בַּכִּיכָּר {DIRECTION} {SECOND}',
    ['nav.interval.join.-.highway'] = '{INTERVAL} עָלֶה עַל {HIGHWAY}',
    ['nav.interval.makeuturn.-.-'] = '{INTERVAL} פְּנֵה פְּנִיַּת פַּרְסָה {LANDMARK} {SECOND}',
    ['nav.interval.takeexit.-.-'] = '{INTERVAL} צֵא בַּיְּצִיאָה {DIRECTION} {SECOND}',
    ['nav.interval.takeferry.-.-'] = '{INTERVAL} עָלֶה עַל הַמַּעְבֹּרֶת {LANDMARK} {DIRECTION} {SECOND}',
    ['nav.interval.turnkeep.-.-'] = '{INTERVAL} {TURN_KEEP} {LANDMARK} {DIRECTION} {SECOND}',
    ['nav.interval.turnkeep.tocontinue.-'] = '{INTERVAL} {TURN_KEEP} כְּדֵי לְהַמְשִׁיךְ {DIRECTION} {SECOND}',
    ['nav.interval.turnkeep.tocontinue-toexit.-'] = '{INTERVAL} {TURN_KEEP} כְּדֵי לָצֵאת בַּיְּצִיאָה וְהֶמְשֵׁךְ {DIRECTION}',
    ['nav.interval.turnkeep.tocontinue-toexit.exit'] = '{INTERVAL} {TURN_KEEP} כְּדֵי לָצֵאת בַּיְּצִיאָה {EXIT} וְהֶמְשֵׁךְ {DIRECTION}',
    ['nav.interval.turnkeep.toexit.-'] = '{INTERVAL} {TURN_KEEP} כְּדֵי לָצֵאת בַּיְּצִיאָה {DIRECTION} {SECOND}',
    ['nav.interval.turnkeep.toexit.exit'] = '{INTERVAL} {TURN_KEEP} כְּדֵי לָצֵאת בַּיְּצִיאָה {EXIT} {DIRECTION} {SECOND}',
    ['nav.interval.turnkeep.tojoin.-'] = '{INTERVAL} {TURN_KEEP} {LANDMARK} כְּדֵי לַעֲלוֹת עַל {DIRECTION} {SECOND}',
    ['nav.interval.turnkeep.tojoin.highway'] = '{INTERVAL} {TURN_KEEP} {LANDMARK} כְּדֵי לַעֲלוֹת עַל {HIGHWAY} {DIRECTION} {SECOND}',

    -- Second maneuver
    ['nav.second.arrive.-.-'] = 'וְאָז תַּגִּיעַ אֶל {NEXT_GOAL} {NEXT_DIRECTION}',
    ['nav.second.enterroundabout.-.-'] = 'וְאָז הִכָּנֵס לַכִּיכָּר',
    ['nav.second.exitroundabout.-.-'] = 'וְאָז {NEXT_TAKE_NTH_EXIT} בַּכִּיכָּר {NEXT_DIRECTION}',
    ['nav.second.join.-.highway'] = 'וְאָז עָלֶה עַל {NEXT_HIGHWAY}',
    ['nav.second.makeuturn.-.-'] = 'וְאָז פְּנֵה פְּנִיַּת פַּרְסָה {NEXT_LANDMARK}',
    ['nav.second.takeexit.-.-'] = 'וְאָז צֵא בַּיְּצִיאָה',
    ['nav.second.takeferry.-.-'] = 'וְאָז עָלֶה עַל הַמַּעְבֹּרֶת {NEXT_LANDMARK} {NEXT_DIRECTION}',
    ['nav.second.turnkeep.-.-'] = 'וְאָז {NEXT_TURN_KEEP} {IMMEDIATELY} {NEXT_LANDMARK} {NEXT_DIRECTION}',
    ['nav.second.turnkeep.tocontinue.-'] = 'וְאָז {NEXT_TURN_KEEP} {IMMEDIATELY} כְּדֵי לְהַמְשִׁיךְ {NEXT_DIRECTION}',
    ['nav.second.turnkeep.toexit.-'] = 'וְאָז {NEXT_TURN_KEEP} {IMMEDIATELY} כְּדֵי לָצֵאת בַּיְּצִיאָה {NEXT_DIRECTION}',
    ['nav.second.turnkeep.toexit.exit'] = 'וְאָז {NEXT_TURN_KEEP} {IMMEDIATELY} כְּדֵי לָצֵאת בַּיְּצִיאָה {NEXT_EXIT} {NEXT_DIRECTION}',
    ['nav.second.turnkeep.tojoin.-'] = 'וְאָז {NEXT_TURN_KEEP} {IMMEDIATELY} {NEXT_LANDMARK} כְּדֵי לַעֲלוֹת עַל {NEXT_DIRECTION}',
    ['nav.second.turnkeep.tojoin.highway'] = 'וְאָז {NEXT_TURN_KEEP} {IMMEDIATELY} {NEXT_LANDMARK} כְּדֵי לַעֲלוֹת עַל {NEXT_HIGHWAY} {NEXT_DIRECTION}',

    ['nav.arrival'] = 'הִגַּעְתָּ אֶל {GOAL}',
    ['nav.arrival-side'] = 'הִגַּעְתָּ אֶל {GOAL}. הוּא {SIDE}',
    ['nav.gpslost'] = 'אֵין אוֹת GPS',
    ['nav.gpsrestored'] = 'אוֹת GPS חָזַר',
    ['nav.newroute'] = 'מוֹצֵא מַסְלוּל חָדָשׁ',
    ['nav.speedcamera'] = 'מִכְמֹנֶת מְהִירוּת לְפָנֶיךָ',
    ['nav.trafficmerge'] = 'תְּנוּעָה מִתְמַזֶּגֶת {FROM_SIDE} בַּהֶמְשֵׁךְ',
}

return templates
