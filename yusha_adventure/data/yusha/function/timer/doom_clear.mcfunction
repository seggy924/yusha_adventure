# 1. 상수 및 초기값 설정
# 이제 틱 단위가 아니므로 #c20(20으로 나누기)은 필요 없습니다.
scoreboard players set #c60 oracle 60
scoreboard players set #c3600 oracle 3600

# 2. 전체 소요 시간(초) 계산 (#start_time - left_time)
# 시작할 때의 초에서 남은 초를 빼면 흐른 시간이 나옵니다.
scoreboard players operation #elapsed_sec oracle = #start_time oracle
scoreboard players operation #elapsed_sec oracle -= left_time doom_timer

# 3. 시간(Hour) 계산: 전체 초 / 3600
scoreboard players operation #clear_hr oracle = #elapsed_sec oracle
scoreboard players operation #clear_hr oracle /= #c3600 oracle

# 4. 분(Min) 계산: (전체 초 % 3600) / 60
scoreboard players operation #clear_min oracle = #elapsed_sec oracle
scoreboard players operation #clear_min oracle %= #c3600 oracle
scoreboard players operation #clear_min oracle /= #c60 oracle

# 5. 초(Sec) 계산: 전체 초 % 60
scoreboard players operation #clear_sec oracle = #elapsed_sec oracle
scoreboard players operation #clear_sec oracle %= #c60 oracle

# 6. 기록 출력 (시:분:초)
tellraw @a [{"text":"[기록] ","color":"gold"},{"text":"소요 시간: ","color":"white"},{"score":{"name":"#clear_hr","objective":"oracle"},"color":"yellow"},{"text":"시간 ","color":"white"},{"score":{"name":"#clear_min","objective":"oracle"},"color":"yellow"},{"text":"분 ","color":"white"},{"score":{"name":"#clear_sec","objective":"oracle"},"color":"yellow"},{"text":"초","color":"white"}]

# 7. 축하 폭죽 및 타이머 종료
execute at @a run summon firework_rocket ~ ~ ~ {LifeTime:5,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:true,colors:[16777215,65527,6225664]}]}}}}

function yusha:timer/timer_stop