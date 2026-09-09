local templates = {
    ['nav.-.follow.-.-'] = '{DIRECTION} 주행하세요',
    ['nav.-.follow.-.distance'] = '{DIRECTION} {DISTANCE}를 주행하세요',
    ['nav.-.follow.-.distance-highway'] = '{HIGHWAY}를 따라 {DISTANCE}를 주행하세요',
    ['nav.-.follow.-.distance-road'] = '도로를 따라 {DISTANCE}를 주행하세요',
    ['nav.-.follow.-.highway'] = '{HIGHWAY}를 따라 주행하세요',
    ['nav.-.follow.-.road'] = '도로를 따라 주행하세요',

    ['nav.-.head.-.-'] = '{DIRECTION} {ORIENTATION} 주행하세요',

    ['nav.landmark.makeuturn.-.-'] = '{LANDMARK} U턴하세요 {SECOND}',
    ['nav.landmark.takeferry.-.-'] = '{LANDMARK} {DIRECTION} 페리를 타세요 {SECOND}',
    ['nav.landmark.turnkeep.-.-'] = '{DIRECTION} {LANDMARK} {TURN_KEEP}. {SECOND}',
    ['nav.landmark.turnkeep.tojoin.-'] = '{LANDMARK} {TURN_KEEP}. 그리고 {DIRECTION} 진입하세요 {SECOND}',
    ['nav.landmark.turnkeep.tojoin.highway'] = '{LANDMARK} {TURN_KEEP}. 그리고 {DIRECTION} {HIGHWAY}에 진입하세요 {SECOND}',

    -- First maneuver
    ['nav.interval.arrive.-.side'] = '{INTERVAL} {DIRECTION} {GOAL} 부근입니다. {GOAL}는 {SIDE} 있습니다',
    ['nav.interval.arrive.-.-'] = '{INTERVAL} {DIRECTION} {GOAL} 부근입니다',
    ['nav.interval.enterroundabout.-.-'] = '{INTERVAL} 회전교차로에 진입하세요 {SECOND}',
    ['nav.interval.exitroundabout.-.-'] = '{INTERVAL} 회전교차로에서 {DIRECTION} {TAKE_NTH_EXIT} {SECOND}',
    ['nav.interval.join.-.highway'] = '{INTERVAL} {HIGHWAY}에 진입하세요 {SECOND}',
    ['nav.interval.makeuturn.-.-'] = '{INTERVAL} {LANDMARK} U턴하세요 {SECOND}',
    ['nav.interval.takeexit.-.-'] = '{INTERVAL} {DIRECTION} 출구로 나가세요 {SECOND}',
    ['nav.interval.takeferry.-.-'] = '{INTERVAL} {LANDMARK} {DIRECTION} 페리를 타세요 {SECOND}',
    ['nav.interval.turnkeep.-.-'] = '{INTERVAL} {LANDMARK} {DIRECTION} {TURN_KEEP}. {SECOND}',
    ['nav.interval.turnkeep.tocontinue.-'] = '{INTERVAL} {TURN_KEEP} {DIRECTION} 계속 주행하세요. {SECOND}',
    ['nav.interval.turnkeep.tocontinue-toexit.-'] = '{INTERVAL} {TURN_KEEP} 출구로 나간 다음, {DIRECTION} 계속 주행하세요.',
    ['nav.interval.turnkeep.tocontinue-toexit.exit'] = '{INTERVAL} {TURN_KEEP}. 그리고 {EXIT} 출구로 나간 다음, {DIRECTION} 계속 주행하세요.',
    ['nav.interval.turnkeep.toexit.-'] = '{INTERVAL} {TURN_KEEP}. 그리고 {DIRECTION} 출구로 나가세요 {SECOND}',
    ['nav.interval.turnkeep.toexit.exit'] = '{INTERVAL} {TURN_KEEP}. 그리고 {DIRECTION} {EXIT} 출구로 나가세요 {SECOND}',
    ['nav.interval.turnkeep.tojoin.-'] = '{INTERVAL} {LANDMARK} {TURN_KEEP}. 그리고 {DIRECTION} 진입하세요 {SECOND}',
    ['nav.interval.turnkeep.tojoin.highway'] = '{INTERVAL} {LANDMARK} {TURN_KEEP}. 그리고 {DIRECTION} {HIGHWAY}에 진입하세요 {SECOND}',

    -- Second maneuver
    ['nav.second.arrive.-.-'] = '그러면 {NEXT_DIRECTION} {NEXT_GOAL} 부근입니다',
    ['nav.second.enterroundabout.-.-'] = '그다음 회전교차로로 진입하세요',
    ['nav.second.exitroundabout.-.-'] = '그다음 회전교차로에서 {NEXT_DIRECTION} {NEXT_TAKE_NTH_EXIT} 입니다',
    ['nav.second.join.-.highway'] = '그다음 {NEXT_HIGHWAY}에 진입하세요',
    ['nav.second.makeuturn.-.-'] = '그다음 {NEXT_LANDMARK} {IMMEDIATELY} U턴하세요',
    ['nav.second.takeexit.-.-'] = '그다음 출구로 나가세요',
    ['nav.second.takeferry.-.-'] = '그다음 {NEXT_DIRECTION} 페리를 타세요',
    ['nav.second.turnkeep.-.-'] = '그다음 {NEXT_DIRECTION} {NEXT_LANDMARK} {IMMEDIATELY} {NEXT_TURN_KEEP}',
    ['nav.second.turnkeep.tocontinue.-'] = '그다음 {IMMEDIATELY} {NEXT_DIRECTION} 계속 {NEXT_TURN_KEEP} 입니다',
    ['nav.second.turnkeep.toexit.-'] = '그다음 {IMMEDIATELY} {NEXT_TURN_KEEP}. 그리고 {NEXT_DIRECTION} 출구로 나가세요.',
    ['nav.second.turnkeep.toexit.exit'] = '그다음 {IMMEDIATELY} {NEXT_TURN_KEEP}. 그리고 {NEXT_DIRECTION} {NEXT_EXIT} 출구로 나가세요',
    ['nav.second.turnkeep.tojoin.-'] = '그다음 {NEXT_LANDMARK} {IMMEDIATELY} {NEXT_TURN_KEEP}. 그리고 {NEXT_DIRECTION} 진입하세요',
    ['nav.second.turnkeep.tojoin.highway'] = '그다음 {NEXT_LANDMARK} {IMMEDIATELY} {NEXT_TURN_KEEP}. 그리고 {NEXT_DIRECTION} {NEXT_HIGHWAY}에 진입하세요',

    ['nav.arrival'] = '{GOAL}에 도착했습니다',
    ['nav.arrival-side'] = '{GOAL}에 도착했습니다. {GOAL}는 {SIDE} 있습니다',
    ['nav.gpslost'] = 'GPS 신호가 끊겼습니다',
    ['nav.gpsrestored'] = 'GPS 신호를 수신하였습니다',
    ['nav.newroute'] = '새 경로를 찾는 중입니다',
    ['nav.speedcamera'] = '전방에 과속 단속 구간입니다',
    ['nav.trafficmerge'] = '전방 {FROM_SIDE} 차량 합류입니다',
}

return templates
