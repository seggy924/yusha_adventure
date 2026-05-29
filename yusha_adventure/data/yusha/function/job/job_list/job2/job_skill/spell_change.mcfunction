scoreboard players add @s spell 1
execute as @s[scores={spell=6..}] run scoreboard players set @s spell 1
execute as @s[scores={spell=1..4}] run tag @s remove formchange
execute as @s[scores={spell=1}] run attribute @s movement_speed modifier remove black_fire
execute as @s[scores={spell=1}] run attribute @s max_health modifier remove black_fire
execute as @s[scores={spell=1}] run attribute @s step_height modifier remove black_fire
function yusha:job/job_list/job2/job_item/spell
function yusha:job/job_list/job2/job_item/scroll
advancement revoke @s only yusha:job_skill/spell_change