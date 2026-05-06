
advancement revoke @a[scores={job=1}] only yusha:job_skill/flag_off

execute at @a run playsound minecraft:item.trident.hit_ground player @a ~ ~ ~ 1 0
execute at @a run playsound minecraft:item.trident.return player @a ~ ~ ~ 1 0.5
execute at @a run playsound minecraft:entity.generic.explode player @a ~ ~ ~ 1 2

summon item_display ~ ~ ~ {NoGravity:1b,CustomNameVisible:0b,Tags:["flag"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.7f,0f],scale:[1.5f,1.7f,1.5f]},item:{id:"minecraft:white_banner",count:1,components:{"minecraft:banner_patterns":[{"pattern":"minecraft:straight_cross","color":"black"},{"pattern":"minecraft:border","color":"white"},{"pattern":"minecraft:stripe_top","color":"white"},{"pattern":"minecraft:gradient","color":"white"}]}}}

scoreboard players set @a[scores={job=1}] flag 1
execute at @e[tag=flag] run forceload add ~ ~