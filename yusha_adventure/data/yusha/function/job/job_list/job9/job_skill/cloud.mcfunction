# 1. 기상술사 본인 주변 효과
execute at @a[scores={job=9},nbt={SelectedItem:{components:{"minecraft:custom_data":{nami:1b}}}}] run particle campfire_cosy_smoke ~ ~0.3 ~ 0.3 0.05 0.3 0 1

# 2. 먹구름 추적 파티클 (적 머리 위 10블록 지점)
# 5초 동안 적을 졸졸 따라다니는 높은 구름입니다.
execute at @e[tag=cloud_target] run particle campfire_cosy_smoke ~ ~10 ~ 0.5 0.1 0.5 0.01 4
execute at @e[tag=cloud_target] run particle minecraft:rain ~ ~10 ~ 0.3 0.05 0.3 0.01 3