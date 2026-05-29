execute at @e[type=marker,tag=pointer] as @e[type=!#not_live,distance=..5] at @s run damage @s 8 in_fire by @s
execute at @e[type=marker,tag=pointer] run summon wind_charge ~ ~0.5 ~ {acceleration_power:50d,Motion:[0.0,-1.0,0.0]}
execute at @e[type=marker,tag=pointer] as @e[type=!#not_live,distance=..5] run data merge entity @s {Fire:100s}

# 1. 소리 효과 추가
# [중심 폭발음] 불기둥이 나타나는 지점에서 묵직한 폭발음 (피치 1.2로 살짝 높여서 화염 느낌 강조)
execute at @e[type=marker,tag=pointer] run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 5 1.2

# [화염 분출음] 슈욱 하는 화염 방사 소리 (피치 0.8로 낮춰서 더 굵은 소리로 연출)
execute at @e[type=marker,tag=pointer] run playsound minecraft:item.firecharge.use player @a ~ ~ ~ 5 0.8

# 2. 불기둥 소환

execute at @e[type=marker,tag=pointer] run particle minecraft:lava ~ ~0.1 ~ 2.5 0.1 2.5 0.05 100 force

# [안쪽 기둥] 2.0 두께 -> 1.2 두께 압축
execute as @s[scores={spell=2},tag=raycast] at @e[type=marker,tag=pointer] run summon marker ~ ~ ~ {Tags:[fire_pillar]}

execute as @s[scores={spell=2},tag=raycast] at @e[type=marker,tag=pointer] run summon block_display ~ ~ ~ {Tags:["fire_pillar","just_spawned"],block_state:{Name:"minecraft:fire"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1f,0f,-1f],scale:[2f,0.1f,2f]}}

# [바깥쪽 기둥] 3.0 두께 유지
execute as @s[scores={spell=2},tag=raycast] at @e[type=marker,tag=pointer] run summon block_display ~ ~ ~ {Tags:["fire_pillar","just_spawned2"],block_state:{Name:"minecraft:fire"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,0f,-1.5f],scale:[3f,0.3f,3f]}}

# 3. 애니메이션 부여
# [안쪽 기둥] 4틱 애니메이션 (정렬 -0.6, 너비 1.2, 높이 13)
execute as @e[tag=just_spawned] run data merge entity @s {start_interpolation:0,interpolation_duration:4,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.6f,0f,-0.6f],scale:[1.2f,13f,1.2f]}}

# [바깥쪽 기둥] 5틱 애니메이션 (정렬 -1.5, 너비 3, 높이 1)
execute as @e[tag=just_spawned2] run data merge entity @s {start_interpolation:0,interpolation_duration:5,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-1.5f,0f,-1.5f],scale:[3f,1f,3f]}}

# 4. 임시 태그 제거 및 진행도 초기화
tag @e[tag=just_spawned] remove just_spawned
tag @e[tag=just_spawned2] remove just_spawned2