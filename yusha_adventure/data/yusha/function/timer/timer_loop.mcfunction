# 1. 1초마다 1점(1초) 차감 (job=1 플레이어가 있을 때만)
execute if entity @a[scores={job=1}] run scoreboard players remove left_time doom_timer 1

# 2. 시간 계산 (시/분/초)
execute store result score #total_sec doom_math run scoreboard players get left_time doom_timer
execute store result score #display_sec doom_math run scoreboard players get #total_sec doom_math
scoreboard players operation #display_sec doom_math %= #60 doom_math

execute store result score #total_min doom_math run scoreboard players get #total_sec doom_math
scoreboard players operation #total_min doom_math /= #60 doom_math
execute store result score #display_min doom_math run scoreboard players get #total_min doom_math
scoreboard players operation #display_min doom_math %= #60 doom_math

execute store result score #display_hour doom_math run scoreboard players get #total_min doom_math
scoreboard players operation #display_hour doom_math /= #60 doom_math

# 3. 보스바 이름 업데이트 (1시간 기준 숫자 색상 변경)
# 1시간 초과 시 흰색 1시간 이하 시 빨간색으로 숫자 강조
execute if score left_time doom_timer matches 3601.. run bossbar set minecraft:doom_timer name ["",{"text":"멸망까지: ","color":"white"},{"score":{"name":"#display_hour","objective":"doom_math"},"color":"white"},{"text":"시간 ","color":"white"},{"score":{"name":"#display_min","objective":"doom_math"},"color":"white"},{"text":"분 ","color":"white"},{"score":{"name":"#display_sec","objective":"doom_math"},"color":"white"},{"text":"초","color":"white"}]
execute if score left_time doom_timer matches ..3600 run bossbar set minecraft:doom_timer name ["",{"text":"멸망까지: ","color":"white"},{"score":{"name":"#display_min","objective":"doom_math"},"color":"red"},{"text":"분 ","color":"white"},{"score":{"name":"#display_sec","objective":"doom_math"},"color":"red"},{"text":"초","color":"white"}]

# 1. 틱 카운터 스코어보드 생성 (최초 1회 실행 필요) [cite: 8]
# scoreboard objectives add time_tick dummy

# 정각 종소리 재생 (0분 0초)
execute if score #display_min doom_math matches 0 if score #display_sec doom_math matches 0 at @a run playsound minecraft:block.bell.use master @a ^ ^5 ^ 1 0.5

# 3시간(18000초) 이하일 때만 매 분 정각 번개 소리 재생 (1~59분 0초)
execute if score left_time doom_timer matches 7200..10800 if score #display_min doom_math matches 1..59 if score #display_sec doom_math matches 0 at @a run playsound weather.end_flash master @a ^ ^5 ^ 1 0

# 3시간(18000초) 이하일 때만 매 분 정각 번개 소리 재생 (1~59분 0초)
execute if score left_time doom_timer matches 601..7200 if score #display_min doom_math matches 1..59 if score #display_sec doom_math matches 0 at @a run playsound weather.end_flash master @a ^ ^2 ^ 1 0

# 2시간(7200초) 이하일 때만 매 초 심장 박동 소리 재생
execute if score left_time doom_timer matches 601..7200 if score #display_sec doom_math matches 0..59 at @a run playsound entity.warden.heartbeat master @a ^ ^ ^ 0.2 0

# 2시간(7200초) 이하일 때만 매 초 심장 박동 소리 재생
execute if score left_time doom_timer matches ..600 if score #display_sec doom_math matches 0..59 at @a run playsound entity.warden.heartbeat master @a ^ ^ ^ 0.2 2

# 10분(600초) 이하일 때만 매 분 정각 종 소리 재생 (1~59분 0초)
execute if score left_time doom_timer matches 10..600 if score #display_min doom_math matches 1..59 if score #display_sec doom_math matches 0 at @a run playsound block.bell.use master @a ^ ^ ^ 1 0

# 2시간(7200초) 이하일 때만 매 초 심장 박동 소리 재생
execute if score left_time doom_timer matches ..5 if score #display_sec doom_math matches 0..59 at @a run playsound block.bell.use master @a ^ ^ ^ 1 0

# 1시간 경과: Normal로 변경 (남은 시간 3시간)
execute if score left_time doom_timer matches 10800 run difficulty normal
execute if score left_time doom_timer matches 10800 run title @a actionbar {"text":"난이도가 '보통'으로 상승했습니다.","color":"yellow"}

# 2시간 경과: Hard로 변경 (남은 시간 2시간)
execute if score left_time doom_timer matches 7200 run difficulty hard
execute if score left_time doom_timer matches 7200 run title @a actionbar {"text":"난이도가 '어려움'으로 상승했습니다!","color":"red"}

# 3시간 경과: 최후의 밤 (난이도는 Hard 유지 + 시각적 압박)
execute if score left_time doom_timer matches 3600 run title @a title {"text":"최후의 시련","color":"dark_red"}

# 7. 보스바 게이지 업데이트 
execute store result bossbar minecraft:doom_timer value run scoreboard players get left_time doom_timer

# 8. 시간 동기화 함수 호출 (1초에 한 번만 실행되도록 함)
function yusha:timer/world_time

# 9. 멸망 체크 및 재귀 호출 
execute if score left_time doom_timer matches 1..3 run effect give @a minecraft:darkness 2 0 true
execute if score left_time doom_timer matches ..0 run function yusha:timer/doom_effect
execute if score left_time doom_timer matches 1.. run schedule function yusha:timer/timer_loop 20t