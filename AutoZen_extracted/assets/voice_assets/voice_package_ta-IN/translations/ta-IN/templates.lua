local templates = {
    ['nav.-.follow.-.-'] = '{DIRECTION} பின்தொடரவும்',
    ['nav.-.follow.-.distance'] = '{DISTANCE} {DIRECTION} பின்தொடரவும்',
    ['nav.-.follow.-.distance-highway'] = '{DISTANCE} {HIGHWAY} பின்தொடரவும்',
    ['nav.-.follow.-.distance-road'] = '{DISTANCE} சாலையைப் பின்தொடரவும்',
    ['nav.-.follow.-.highway'] = '{HIGHWAY} பின்தொடரவும்',
    ['nav.-.follow.-.road'] = 'சாலையைப் பின்தொடரவும்',

    ['nav.-.head.-.-'] = '{DIRECTION} {ORIENTATION} நோக்கிச் செல்லவும்',

    ['nav.landmark.makeuturn.-.-'] = '{LANDMARK} யு-டர்ன் எடுக்கவும் {SECOND}',
    ['nav.landmark.takeferry.-.-'] = '{LANDMARK} {DIRECTION} படகில் செல்லவும் {SECOND}',
    ['nav.landmark.turnkeep.-.-'] = '{DIRECTION} {LANDMARK} {TURN_KEEP} {SECOND}',
    ['nav.landmark.turnkeep.tojoin.-'] = '{DIRECTION} சேர, {LANDMARK} {TURN_KEEP} {SECOND}',
    ['nav.landmark.turnkeep.tojoin.highway'] = '{HIGHWAY} {DIRECTION} சேர, {LANDMARK} {TURN_KEEP} {SECOND}',

    -- First maneuver
    ['nav.interval.arrive.-.side'] = '{INTERVAL} உங்கள் {GOAL} {DIRECTION} அடைவீர்கள். உங்கள் {GOAL} {SIDE} உள்ளது',
    ['nav.interval.arrive.-.-'] = '{INTERVAL} உங்கள் {GOAL} {DIRECTION} அடைவீர்கள்',
    ['nav.interval.enterroundabout.-.-'] = '{INTERVAL} ரவுண்டானாவில் நுழையவும் {SECOND}',
    ['nav.interval.exitroundabout.-.-'] = '{DIRECTION} {INTERVAL} ரவுண்டானாவில் {TAKE_NTH_EXIT} {SECOND}',
    ['nav.interval.join.-.highway'] = '{INTERVAL} {HIGHWAY} சேரவும் {SECOND}',
    ['nav.interval.makeuturn.-.-'] = '{INTERVAL} {LANDMARK} யு-டர்ன் எடுக்கவும் {SECOND}',
    ['nav.interval.takeexit.-.-'] = '{INTERVAL} {DIRECTION} வெளியேறவும் {SECOND}',
    ['nav.interval.takeferry.-.-'] = '{INTERVAL} {LANDMARK} {DIRECTION} படகில் செல்லவும் {SECOND}',
    ['nav.interval.turnkeep.-.-'] = '{INTERVAL} {DIRECTION} {LANDMARK} {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.tocontinue.-'] = '{DIRECTION} தொடர, {INTERVAL} {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.tocontinue-toexit.-'] = 'வெளியேறி {DIRECTION} தொடர, {INTERVAL} {TURN_KEEP}',
    ['nav.interval.turnkeep.tocontinue-toexit.exit'] = '{EXIT}-இல் வெளியேறி {DIRECTION} தொடர, {INTERVAL} {TURN_KEEP}',
    ['nav.interval.turnkeep.toexit.-'] = '{DIRECTION} வெளியேற, {INTERVAL} {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.toexit.exit'] = '{EXIT}-இல் {DIRECTION} வெளியேற, {INTERVAL} {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.tojoin.-'] = '{DIRECTION} சேர, {INTERVAL} {LANDMARK} {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.tojoin.highway'] = '{HIGHWAY} {DIRECTION} சேர, {INTERVAL} {LANDMARK} {TURN_KEEP} {SECOND}',

    -- Second maneuver
    ['nav.second.arrive.-.-'] = ', மற்றும் பின்னர் உங்கள் {NEXT_GOAL} {NEXT_DIRECTION} அடைவீர்கள்',
    ['nav.second.enterroundabout.-.-'] = ', மற்றும் பின்னர் ரவுண்டானாவில் நுழையவும்',
    ['nav.second.exitroundabout.-.-'] = ', மற்றும் பின்னர் {NEXT_DIRECTION} ரவுண்டானாவில் {NEXT_TAKE_NTH_EXIT}',
    ['nav.second.join.-.highway'] = ', மற்றும் பின்னர் {NEXT_HIGHWAY} சேரவும்',
    ['nav.second.makeuturn.-.-'] = ', மற்றும் பின்னர் {IMMEDIATELY} {NEXT_LANDMARK} யு-டர்ன் எடுக்கவும்',
    ['nav.second.takeexit.-.-'] = ', மற்றும் பின்னர் வெளியேறவும்',
    ['nav.second.takeferry.-.-'] = ', மற்றும் பின்னர் {NEXT_LANDMARK} {NEXT_DIRECTION} படகில் செல்லவும்',
    ['nav.second.turnkeep.-.-'] = ', மற்றும் பின்னர் {IMMEDIATELY} {NEXT_DIRECTION} {NEXT_LANDMARK} {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.tocontinue.-'] = ', மற்றும் பின்னர் {IMMEDIATELY} {NEXT_DIRECTION} தொடர {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.toexit.-'] = ', மற்றும் பின்னர் {IMMEDIATELY} {NEXT_DIRECTION} வெளியேற {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.toexit.exit'] = ', மற்றும் பின்னர் {IMMEDIATELY} {NEXT_EXIT}-இல் {NEXT_DIRECTION} வெளியேற {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.tojoin.-'] = ', மற்றும் பின்னர் {IMMEDIATELY} {NEXT_DIRECTION} சேர {NEXT_LANDMARK} {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.tojoin.highway'] = ', மற்றும் பின்னர் {IMMEDIATELY} {NEXT_HIGHWAY} {NEXT_DIRECTION} சேர {NEXT_LANDMARK} {NEXT_TURN_KEEP}',

    ['nav.arrival'] = 'உங்கள் {GOAL} அடைந்துவிட்டீர்கள்',
    ['nav.arrival-side'] = 'உங்கள் {GOAL} அடைந்துவிட்டீர்கள். உங்கள் {GOAL} {SIDE} உள்ளது',
    ['nav.gpslost'] = 'GPS சிக்னல் துண்டிக்கப்பட்டது',
    ['nav.gpsrestored'] = 'GPS சிக்னல் மீட்டெடுக்கப்பட்டுள்ளதுછે',
    ['nav.newroute'] = 'புதிய வழியைக் கண்டறிகிறது',
    ['nav.speedcamera'] = 'முன்னால் வேகக் கேமரா உள்ளது',
    ['nav.trafficmerge'] = 'டிராஃபிக் {FROM_SIDE} முன்னோக்கி இணைகிறது',
}

return templates
