# 1. 활성화 (뼛가루가 모닥불 위에 있고, 아직 마커가 없을 때만 실행)
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run execute as @e[type=marker,tag=campfire] run tag @s remove bone_meal

execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run execute at @e[type=marker,tag=campfire] run setblock ~ ~ ~ campfire[lit=false] replace

execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run execute at @e[type=marker,tag=campfire] run kill @e[type=allay,tag=campfire_mob]

execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["campfire"]}

execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] align xyz run advancement grant @a only yusha:main/campfire

#알레이 소환
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] align xyz run summon allay ~ ~ ~2 {Invulnerable:1b,Tags:["campfire_mob"],DeathLootTable:""}

execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run playsound block.bell.use block @a ~ ~ ~ 1 1.6
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run particle flame ~ ~ ~ 0.2 0.5 0.2 0.03 10
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal] if block ~ ~ ~ campfire[lit=true] run tellraw @a {"color":"gold","text":"모닥불이 활성화 되었습니다."}

execute at @e[type=marker,tag=campfire] unless entity @e[type=marker,tag=bone_meal] run kill @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}},distance=..1]
execute as @e[type=marker,tag=campfire] run tag @s add bone_meal
execute at @e[type=marker,tag=campfire] run tp @e[type=allay,tag=campfire_mob,distance=5..] ~ ~1 ~1

#모닥불 수리 명령어
execute at @e[type=marker,tag=campfire] run scoreboard players remove @a[distance=..5] campfire_timer 1
execute at @e[type=marker,tag=campfire] as @a[distance=..10,scores={campfire_timer=0}] run item modify entity @s armor.head yusha:repair
execute at @e[type=marker,tag=campfire] as @a[distance=..10,scores={campfire_timer=0}] run item modify entity @s armor.chest yusha:repair
execute at @e[type=marker,tag=campfire] as @a[distance=..10,scores={campfire_timer=0}] run item modify entity @s armor.legs yusha:repair
execute at @e[type=marker,tag=campfire] as @a[distance=..10,scores={campfire_timer=0}] run item modify entity @s armor.feet yusha:repair
execute at @e[type=marker,tag=campfire] as @a[distance=..10,scores={campfire_timer=0}] run item modify entity @s weapon.mainhand yusha:repair
execute at @e[type=marker,tag=campfire] as @a[distance=..10,scores={campfire_timer=0}] run item modify entity @s weapon.offhand yusha:repair
scoreboard players set @a[scores={campfire_timer=..0}] campfire_timer 120

# 3. 비활성화 (모닥불 블록이 사라지면 마커 제거 및 알림)
execute as @e[type=marker,tag=campfire] at @s unless block ~ ~ ~ campfire[lit=true] run tellraw @a[distance=..5] {"color":"dark_gray","text":"모닥불이 비활성화 되었습니다."}
execute as @e[type=marker,tag=campfire] at @s unless block ~ ~ ~ campfire[lit=true] run kill @s
execute as @e[type=allay,tag=campfire_mob] at @s unless entity @e[type=marker,tag=campfire] run kill @s

# 4. 상시 효과 부여
execute at @e[type=marker,tag=campfire] run effect give @a[distance=..10] minecraft:darkness 2 0 true
execute at @e[type=marker,tag=campfire] run effect give @a[distance=..10] minecraft:regeneration 2 0 true
execute at @e[type=marker,tag=campfire] run effect give @a[distance=..10] weakness 2 100 true
execute at @e[type=marker,tag=campfire] run effect clear @a[distance=10..]