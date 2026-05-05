execute at @a[limit=1,scores={job=1}] run tp @s ~ ~ ~
tellraw @s {"color":"gold","text":"슝!"}
execute at @a[limit=1,scores={job=1}] run function yusha:job/job_list/job1/job_skill/out_of_range