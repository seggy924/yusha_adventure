# 1. 경과 시간 계산
scoreboard players set #max_sec doom_math 14400
scoreboard players operation #elapsed_sec doom_math = #max_sec doom_math
scoreboard players operation #elapsed_sec doom_math -= left_time doom_timer

# 2. 게임 틱으로 변환 (14400초 동안 7500틱이 흐르는 25/48 비율)
scoreboard players set #const_25 doom_math 25
scoreboard players set #const_48 doom_math 48

# (경과초 * 25) / 48
scoreboard players operation #elapsed_sec doom_math *= #const_25 doom_math
scoreboard players operation #elapsed_sec doom_math /= #const_48 doom_math

# 3. 시작 지점 더하기 (정오 6000틱부터 시작)
scoreboard players set #start_tick doom_math 6000
scoreboard players operation #elapsed_sec doom_math += #start_tick doom_math

# 4. 데이터 저장 및 적용
execute store result storage yusha:data time_val int 1 run scoreboard players get #elapsed_sec doom_math
function yusha:timer/sync_time_apply with storage yusha:data