#말
execute as @a[scores={job=6,ride=1..}] unless entity @s[nbt={RootVehicle:{}}] unless entity @s[tag=is_riding] at @s run summon zombie_horse ~ ~ ~ {Tame:1b,Tags:["lancer_horse"],equipment:{body:{id:"minecraft:netherite_horse_armor",count:1},saddle:{id:"minecraft:saddle",count:1}}}
execute as @a[scores={job=6,ride=1..}] run tag @s add is_riding
execute as @e[tag=lancer_horse] run data merge entity @s {DeathLootTable:""}
execute as @a[scores={job=6,ride=1..}] at @s run ride @s mount @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest]
execute as @a[scores={job=6,ride=1..}] run scoreboard players set @s ride 0

execute as @a[scores={job=6,speed=0}] at @s run kill @e[tag=lancer_horse,type=zombie_horse,limit=1,sort=nearest]
execute as @a[tag=is_riding,nbt={RootVehicle:{}}] run tag @s remove is_riding
execute as @a[scores={job=6,move_tag=0}] run tag @s remove is_riding
