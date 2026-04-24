# 1. 기상술사 무적 (번개/불 대미지 방지)
execute as @a[scores={job=9}] run effect give @s minecraft:fire_resistance 1 0 true

# 2. 타이머 증가 (기상술사가 삼지창을 들고 있을 때만)
execute as @a[scores={job=9},nbt={SelectedItem:{components:{"minecraft:custom_data":{nami:1b}}}}] run scoreboard players add #strike timer 1

# 3. 상시 구름 파티클 연출 (cloud.mcfunction 호출)
function yusha:job/job_list/job9/job_skill/cloud

# 4. 5초(100틱)마다 번개 스킬 실행
execute as @a[scores={job=9},nbt={SelectedItem:{components:{"minecraft:custom_data":{nami:1b}}}}] if score #strike timer matches 100.. at @s run function yusha:job/job_list/job9/job_skill/thunder_storm

# 5. 삼지창 던지기 번개 로직 (기본 유지)
execute at @e[type=trident,tag=!struck,nbt={DealtDamage:1b,item:{components:{"minecraft:custom_data":{nami:1b}}}}] run summon area_effect_cloud ~ ~1 ~ {Tags:[lightning],Duration:1,Radius:0}
tag @e[type=trident,tag=!struck,nbt={DealtDamage:1b}] add struck
execute at @e[type=minecraft:area_effect_cloud,tag=lightning] run summon lightning_bolt ~ ~ ~