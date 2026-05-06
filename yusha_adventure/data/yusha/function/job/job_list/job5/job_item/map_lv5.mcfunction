execute at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 1 2
clear @s *[custom_data~{clue_item:1b}] 16
scoreboard players remove @s clue 16
function yusha:job/job_list/job5/job_item/note
loot give @s loot yusha:job_5_lv5