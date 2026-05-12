scoreboard players add @s spell 1
execute as @s[scores={spell=5..}] run scoreboard players set @s spell 1
function yusha:job/job_list/job2/job_item/spell
advancement revoke @s only yusha:job_skill/spell_change