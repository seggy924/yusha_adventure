execute at @s[scores={spell=1}] run function yusha:job/job_list/job2/job_skill/spell_1/heal
execute at @s[scores={spell=2},tag=raycast] run function yusha:job/job_list/job2/job_skill/spell_2/fire_pillar
execute at @s[scores={spell=4},tag=raycast] run function yusha:job/job_list/job2/job_skill/spell_4/fire_rain
execute at @s[scores={spell=5},tag=raycast] run function yusha:job/job_list/job2/job_skill/spell_5/black_fire
execute at @s[tag=!formchange] run playsound item.firecharge.use player @a ~ ~ ~ 1 0.8
execute at @s[tag=formchange] run playsound particle.soul_escape player @a ~ ~ ~ 10 0
execute at @s[tag=!formchange] run particle minecraft:flame ~ ~1 ~ 0.5 1.0 0.5 0 10
execute at @s[tag=formchange] run particle minecraft:soul ~ ~1 ~ 0.5 1.0 0.5 0 10
advancement revoke @s only yusha:job_skill/spell_use