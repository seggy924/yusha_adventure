effect give @s[tag=formchange] invisibility 1 1 true
effect give @s[tag=formchange] darkness 2 1 true
execute as @s[tag=formchange] at @e[type=marker,tag=pointer] run tp @s ~ ~ ~
execute at @s[tag=formchange] run particle large_smoke ~ ~ ~ 0.5 0 0.5 0.1 20
execute at @s[tag=formchange] run effect give @e[type=!player,type=!#not_live,distance=1..5] wither 2 5
execute at @s[tag=!formchange] run function yusha:job/job_list/job2/job_skill/spell_5/formchange