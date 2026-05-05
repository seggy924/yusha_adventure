execute unless entity @e[tag=marker] run playsound block.note_block.bit master @s ~ ~ ~ 2 0
execute unless entity @e[tag=marker] run tellraw @s {"color":"green","text":"마커가 없습니다."}

execute if entity @e[tag=marker] at @e[tag=marker] run forceload remove ~ ~
execute if entity @e[tag=marker] run tellraw @s {"color":"red","text":"마커 삭제됨"}
execute if entity @e[tag=marker] run playsound minecraft:entity.item.break master @s ~ ~ ~ 1 1.8
execute if entity @e[tag=marker] run kill @e[tag=marker]