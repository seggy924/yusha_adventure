execute as @a[scores={job=9}] run function yusha:job/job_list/job9/job_item/wave_menu

execute as @a[scores={job=9,wave=1}] run function yusha:job/job_list/job9/job_skill/wave

# 1. 파도술사 기본 효과 (돌고래의 가속) 
execute as @a[scores={job=9}] run effect give @s dolphins_grace 1 5 true