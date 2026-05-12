#용사
execute as @a[scores={job=1}] run function yusha:job/job_list/job1/job_item/flag
execute as @a[scores={job=1,flag=2}] at @s run function yusha:job/job_list/job1/job_skill/distance_bar_0
execute if entity @a[scores={job=1,flag=1}] at @e[tag=flag] run function yusha:job/job_list/job1/job_skill/distance_bar_1
execute as @a[tag=out_of_range] at @s run function yusha:job/job_list/job1/job_skill/out_of_range