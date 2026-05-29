execute if entity @e[tag=marker] run tellraw @s {"color":"red","text":"이미 마커가 설치 되어 있습니다"}
execute if entity @e[tag=marker] run playsound block.note_block.bit master @s ~ ~ ~ 2 0

execute unless entity @e[tag=marker] run playsound entity.item.pickup master @s ~ ~ ~ 3 0
execute unless entity @e[tag=marker] run tellraw @s {"color":"green","text":"마커 설치됨"}
execute unless entity @e[tag=marker] run summon item_display ~ ~ ~ {Tags:["marker"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.4f,0f],scale:[2f,1.2f,2f]},item:{id:"minecraft:oxidized_lightning_rod",count:1}}
execute unless entity @e[tag=marker] at @e[tag=marker] run forceload add ~ ~