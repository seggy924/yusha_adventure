# 1. 기존 타겟(5초 동안 추적당한 적)에게 파도 대미지
execute at @e[tag=cloud_target] run playsound block.bubble_column.upwards_inside master @a ~ ~ ~ 0.5 1.2
execute as @e[tag=cloud_target] run damage @s 1 player_attack
execute as @e[tag=cloud_target] run effect give @s levitation 1 3 true
execute as @e[tag=cloud_target] run effect give @s slowness 5 10 true
execute at @e[tag=cloud_target] run particle poof ~ ~ ~ 0 0 0 0.1 300

# 2. 기존 타겟 태그 제거
tag @e[tag=cloud_target] remove cloud_target

# 3. 새로운 적 3명 선정 (파도술사 위치 기준 10블록 이내)
execute as @a[scores={job=9}] at @s run tag @e[limit=3,type=!player,type=!item,type=!experience_orb,type=!villager,type=!creeper,type=!#arrows,type=!#impact_projectiles,distance=..10] add cloud_target

execute as @a[scores={job=9}] at @s run tag @e[limit=3,type=!player,type=!item,type=!experience_orb,type=!villager,type=!creeper,type=!#arrows,type=!#impact_projectiles,distance=..10] add cloud_target
# 4. 마무리 효과 및 타이머 초기화
scoreboard players set #strike timer 0