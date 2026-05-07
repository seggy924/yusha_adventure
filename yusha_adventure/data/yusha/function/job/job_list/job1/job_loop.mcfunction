#용사
execute as @a[scores={job=1}] run function yusha:job/job_list/job1/job_item/flag
execute as @a[scores={job=1}] run function yusha:job/job_list/job1/job_item/sword
execute as @a[scores={job=1,flag=2}] at @s run function yusha:job/job_list/job1/job_skill/distance_bar_0
execute if entity @a[scores={job=1,flag=1}] at @e[tag=flag] run function yusha:job/job_list/job1/job_skill/distance_bar_1
execute as @a[tag=out_of_range] at @s run function yusha:job/job_list/job1/job_skill/out_of_range

execute as @a[scores={job=1,hit=1..}] run scoreboard players add @s combo 1
execute as @a[scores={job=1,hit=1..}] run scoreboard players set @s hit 0
execute as @a[scores={job=1,combo=4}] run attribute @s minecraft:attack_damage base set 30
execute as @a[scores={job=1,combo=5..}] run attribute @s minecraft:attack_damage base reset
execute as @a[scores={job=1,combo=5..}] run scoreboard players set @s combo 0