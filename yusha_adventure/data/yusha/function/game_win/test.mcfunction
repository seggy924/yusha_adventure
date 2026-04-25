# 1. 상수 및 초기값 설정 (필요 시)
scoreboard players set #c20 oracle 20
scoreboard players set #c60 oracle 60
scoreboard players set #c3600 oracle 3600

# 2. 전체 소요 틱 계산 (#start_time - left_time)
scoreboard players operation #elapsed_tick oracle = #start_time oracle
scoreboard players operation #elapsed_tick oracle -= left_time doom_timer

# 3. 전체 초 단위 환산 (틱 / 20)
scoreboard players operation #total_sec oracle = #elapsed_tick oracle
scoreboard players operation #total_sec oracle /= #c20 oracle

# 4. 시간(Hour) 계산: 전체 초 / 3600
scoreboard players operation #clear_hr oracle = #total_sec oracle
scoreboard players operation #clear_hr oracle /= #c3600 oracle

# 5. 분(Min) 계산: (전체 초 % 3600) / 60
scoreboard players operation #clear_min oracle = #total_sec oracle
scoreboard players operation #clear_min oracle %= #c3600 oracle
scoreboard players operation #clear_min oracle /= #c60 oracle

# 6. 초(Sec) 계산: 전체 초 % 60
scoreboard players operation #clear_sec oracle = #total_sec oracle
scoreboard players operation #clear_sec oracle %= #c60 oracle

# 7. 기록 출력 (시:분:초)
tellraw @a [{"text":"[기록] ","color":"gold"},{"text":"소요 시간: ","color":"white"},{"score":{"name":"#clear_hr","objective":"oracle"},"color":"yellow"},{"text":"시간 ","color":"white"},{"score":{"name":"#clear_min","objective":"oracle"},"color":"yellow"},{"text":"분 ","color":"white"},{"score":{"name":"#clear_sec","objective":"oracle"},"color":"yellow"},{"text":"초","color":"white"}]

execute at @a run summon firework_rocket ~ ~ ~ {LifeTime:5,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"small_ball",has_twinkle:true,colors:[16777215,65527,6225664]}]}}}}

function yusha:timer/timer_stop