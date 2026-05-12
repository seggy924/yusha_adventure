clear @s *[custom_data~{job:1b}]
function yusha:job/job_list/job3/job_item/mace
function yusha:job/job_list/job3/job_item/shield
execute at @a run particle glow ~ ~ ~ 0.5 1 0.5 1 20
# [다크소울풍 마법 인챈트 사운드]
# 2. 신비로운 마법 입자 (일루전너 주문음)
playsound minecraft:entity.illusioner.prepare_mirror player @a ~ ~ ~ 0.7 1.3
# 3. 영롱한 금속 공명 (자수정 소리)
playsound minecraft:block.amethyst_block.chime player @a ~ ~ ~ 1.0 1.3
# 4. 바람이 감기는 소리 (휘두르기 소리 변조)
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 0.6 0.8
effect give @a regeneration 10 2 true
effect give @a glowing 1 1 true
advancement revoke @s only yusha:job_skill/pray