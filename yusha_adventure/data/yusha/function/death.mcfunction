# 1. 용사 사망 체크 [cite: 2]
execute as @a[scores={job=1,deaths=1..}] run function yusha:game_over

# 2. 용사 외 직업 사망 시 초기 설정 [cite: 2]
execute as @a[scores={job=3..,deaths=1..}] run gamemode spectator @s
execute as @a[scores={job=3..,deaths=1..}] run scoreboard players set @s respawn_timer 200

# 3. 죽음 카운트 및 세대 점수 처리 [cite: 2]
scoreboard players set @a[scores={deaths=1..}] deaths 0
