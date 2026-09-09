local templates = {
    ['nav.-.follow.-.-'] = '{DIRECTION}ને અનુસરો',
    ['nav.-.follow.-.distance'] = '{DISTANCE} સુધી {DIRECTION}ને અનુસરો',
    ['nav.-.follow.-.distance-highway'] = '{DISTANCE} સુધી {HIGHWAY}ને અનુસરો',
    ['nav.-.follow.-.distance-road'] = '{DISTANCE} સુધી રસ્તાને અનુસરો',
    ['nav.-.follow.-.highway'] = '{HIGHWAY}ને અનુસરો',
    ['nav.-.follow.-.road'] = 'રસ્તા પર આગળ વધો',

    ['nav.-.head.-.-'] = '{DIRECTION} {ORIENTATION} પર જાઓ',

    ['nav.landmark.makeuturn.-.-'] = '{LANDMARK} યુ-ટર્ન લો {SECOND}',
    ['nav.landmark.takeferry.-.-'] = '{LANDMARK} {DIRECTION} ફેરી લો {SECOND}',
    ['nav.landmark.turnkeep.-.-'] = '{LANDMARK} {TURN_KEEP} {DIRECTION} {SECOND}',
    ['nav.landmark.turnkeep.tojoin.-'] = '{LANDMARK} {DIRECTION} સાથે જોડાવા {TURN_KEEP} {SECOND}',
    ['nav.landmark.turnkeep.tojoin.highway'] = '{LANDMARK} {DIRECTION} {HIGHWAY} સાથે જોડાવા {TURN_KEEP} {SECOND}',

    -- First maneuver
    ['nav.interval.arrive.-.side'] = '{INTERVAL} {DIRECTION} તમે તમારા {GOAL} પર પહોંચી જશો. {GOAL} {SIDE} પર હશે',
    ['nav.interval.arrive.-.-'] = '{INTERVAL} {DIRECTION} તમે તમારા {GOAL} પર પહોંચી જશો',
    ['nav.interval.enterroundabout.-.-'] = '{INTERVAL} ટ્રાફિક સર્કલમાં પ્રવેશો {SECOND}',
    ['nav.interval.exitroundabout.-.-'] = '{INTERVAL} {DIRECTION} ટ્રાફિક સર્કલ પર {TAKE_NTH_EXIT} {SECOND}',
    ['nav.interval.join.-.highway'] = '{INTERVAL} {HIGHWAY} સાથે જોડાઓ {SECOND}',
    ['nav.interval.makeuturn.-.-'] = '{INTERVAL} {LANDMARK} યુ-ટર્ન લો {SECOND}',
    ['nav.interval.takeexit.-.-'] = '{INTERVAL} {DIRECTION} બહાર નીકળો {SECOND}',
    ['nav.interval.takeferry.-.-'] = '{INTERVAL} {DIRECTION} {LANDMARK} ફેરી લો {SECOND}',
    ['nav.interval.turnkeep.-.-'] = '{INTERVAL} {LANDMARK} {TURN_KEEP} {DIRECTION} {SECOND}',
    ['nav.interval.turnkeep.tocontinue.-'] = '{INTERVAL} {DIRECTION} આગળ વધવા માટે {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.tocontinue-toexit.-'] = '{INTERVAL} બહાર નીકળવા માટે {TURN_KEEP} અને {DIRECTION} આગળ વધો',
    ['nav.interval.turnkeep.tocontinue-toexit.exit'] = '{INTERVAL} {EXIT} માંથી બહાર નીકળવા માટે {TURN_KEEP} અને {DIRECTION} આગળ વધો',
    ['nav.interval.turnkeep.toexit.-'] = '{INTERVAL} {DIRECTION} બહાર નીકળવા માટે {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.toexit.exit'] = '{INTERVAL} {EXIT} માંથી બહાર નીકળવા માટે {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.tojoin.-'] = '{INTERVAL} {DIRECTION} સાથે જોડાવા માટે {LANDMARK} {TURN_KEEP} {SECOND}',
    ['nav.interval.turnkeep.tojoin.highway'] = '{INTERVAL} {DIRECTION} {HIGHWAY} સાથે જોડાવા માટે {LANDMARK} {TURN_KEEP} {SECOND}',

    -- Second maneuver
    ['nav.second.arrive.-.-'] = 'અને પછી તમે તમારા {NEXT_GOAL} પર પહોંચી જશો',
    ['nav.second.enterroundabout.-.-'] = 'અને પછી ટ્રાફિક સર્કલમાં પ્રવેશો',
    ['nav.second.exitroundabout.-.-'] = 'અને પછી ટ્રાફિક સર્કલ {NEXT_DIRECTION} {NEXT_TAKE_NTH_EXIT}',
    ['nav.second.join.-.highway'] = 'અને પછી {NEXT_HIGHWAY} સાથે જોડાઓ',
    ['nav.second.makeuturn.-.-'] = 'અને પછી {IMMEDIATELY} {NEXT_LANDMARK} યુ-ટર્ન લો',
    ['nav.second.takeexit.-.-'] = 'અને પછી બહાર નીકળો',
    ['nav.second.takeferry.-.-'] = 'અને પછી {NEXT_DIRECTION} {NEXT_LANDMARK} ફેરી લો',
    ['nav.second.turnkeep.-.-'] = 'અને પછી {IMMEDIATELY} {NEXT_LANDMARK} {NEXT_TURN_KEEP} {NEXT_DIRECTION}',
    ['nav.second.turnkeep.tocontinue.-'] = 'અને પછી {IMMEDIATELY} {NEXT_DIRECTION} પર આગળ વધવા માટે {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.toexit.-'] = 'અને પછી {IMMEDIATELY} {NEXT_DIRECTION} બહાર નીકળવા માટે {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.toexit.exit'] = 'અને પછી {IMMEDIATELY} {NEXT_DIRECTION} {NEXT_EXIT} માંથી નીકળવા માટે {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.tojoin.-'] = 'અને પછી {IMMEDIATELY} {NEXT_DIRECTION} સાથે જોડાવા માટે {NEXT_LANDMARK} {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.tojoin.highway'] = 'અને પછી {IMMEDIATELY} {NEXT_DIRECTION} {NEXT_HIGHWAY} સાથે જોડાવા માટે {NEXT_LANDMARK} {NEXT_TURN_KEEP}',

    ['nav.arrival'] = 'તમે તમારા {GOAL} પર પહોંચી ગયા છો',
    ['nav.arrival-side'] = 'તમે તમારા {GOAL} પર પહોંચી ગયા છો. તે {SIDE} છે',
    ['nav.gpslost'] = 'GPS સિગ્નલ જતું રહ્યું',
    ['nav.gpsrestored'] = 'GPS સિગ્નલ પાછું આવી ગયું છે',
    ['nav.newroute'] = 'નવો રુટ શોધવો',
    ['nav.speedcamera'] = 'આગળ સ્પીડ કૅમેરા છે',
    ['nav.trafficmerge'] = 'આગળથી {FROM_SIDE} ટ્રાફિક મર્જ થઈ રહ્યો છે',
}

return templates
