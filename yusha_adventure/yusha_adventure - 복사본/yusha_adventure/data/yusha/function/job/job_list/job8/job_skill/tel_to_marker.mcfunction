execute if entity @e[tag=marker] at @e[tag=marker,limit=1] run tp @s ~ ~ ~
execute if entity @e[tag=marker] run tellraw @s {"color":"aqua","text":"슝!"}
execute if entity @e[tag=marker] at @e[tag=marker] run function yusha:job/job_list/job1/job_skill/out_of_range

execute unless entity @e[tag=marker] run playsound block.note_block.bit master @s ~ ~ ~ 2 0
execute unless entity @e[tag=marker] run tellraw @s {"color":"red","text":"마커가 없습니다."}