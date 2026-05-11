clear @s *[custom_data~{job:1b}]
function yusha:job/job_list/job2/job_item/mace
function yusha:job/job_list/job2/job_item/shield
execute at @a run particle glow ~ ~ ~ 0.5 1 0.5 1 20
effect give @a regeneration 5 2 true
advancement revoke @s only yusha:job_skill/pray