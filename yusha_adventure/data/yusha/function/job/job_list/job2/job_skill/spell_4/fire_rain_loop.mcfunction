# 기존 레이캐스트 및 포인터 추적 로직 유지
execute at @a[scores={job=2,spell=4}] run tp @e[tag=pointer,distance=30..] ~ ~ ~
execute as @a[scores={job=2,spell=4},tag=raycast,nbt={SelectedItem:{components:{"minecraft:custom_data":{spell:1b}}}}] at @s at @e[type=marker, tag=pointer] run particle flame ~ ~ ~ 0 0 0 0.05 10
execute as @a[scores={job=2,spell=4}] at @s at @e[type=marker, tag=pointer,distance=1..30] run tag @s add raycast
execute as @a[scores={job=2,spell=4}] at @s at @e[type=marker, tag=pointer,distance=..1] run tag @s remove raycast
execute as @a[scores={job=2,spell=4}] at @s at @e[type=marker, tag=pointer,distance=30..] run tag @s remove raycast

# ==================== [ 제자리 고정형 10초 지속 화살비 시스템 ] ====================

# 1. 타이머가 작동 중인 고정 마커(구역) 위치에 매 틱마다 임시 마커 소환 (틱당 5발)
execute at @e[type=marker,tag=fire_rain_cloud,scores={display_age=1..}] run summon marker ~ ~ ~ {Tags:["arrow_rain_target"]}

# 2. 임시 마커들을 고정 마커 주변 4블록 반경으로 무작위 분산
execute as @e[type=marker,tag=fire_rain_cloud,scores={display_age=1..}] at @s run spreadplayers ~ ~ 0 4 false @e[type=marker,tag=arrow_rain_target,distance=..1]

# 3. 분산된 위치 상공 15블록 위에서 '아래를 바라보는 불붙은 화살' 소환 (Rotation 추가)
execute as @e[type=marker,tag=arrow_rain_target] at @s run summon arrow ~ ~15 ~ {Motion:[0.0, -4, 0.0], damage:5.0d, Fire:100s, Tags:["arrow_rain"]}

# 4. 사용한 임시 마커 즉시 제거
kill @e[type=marker,tag=arrow_rain_target]

# 5. 고정 마커들의 타이머 점수(display_age)를 매 틱마다 1씩 감소
scoreboard players remove @e[type=marker,tag=fire_rain_cloud,scores={display_age=1..}] display_age 1

# 6. 10초가 지나 타이머가 0이 된 고정 마커 제거
kill @e[type=marker,tag=fire_rain_cloud,scores={display_age=0}]

# ==================== [사운드] ====================

# ==================== [ 초호화 파티클 및 화살 정리 ] ====================

# 7. 공중 추적 꼬리 이펙트 (진한 화염 코어 + 불꽃 파편 + 용암 불똥)
execute at @e[type=marker,tag=fire_rain_cloud,scores={display_age=1..}] run particle minecraft:large_smoke ~ ~15 ~ 4 0.5 4 0.01 40 force
execute at @e[type=marker,tag=fire_rain_cloud,scores={display_age=1..}] run particle minecraft:flame ~ ~14.5 ~ 3 0.2 3 0.02 3 force
execute as @e[type=arrow,tag=arrow_rain,nbt={inGround:0b}] at @s run particle minecraft:small_flame ~ ~ ~ 0.1 0.3 0.1 0.05 3
execute as @e[type=arrow,tag=arrow_rain,nbt={inGround:0b}] at @s run particle minecraft:smoke ~ ~ ~ 0.05 0.1 0.05 0.01 2

# 8. 바닥 타격 충격파 이펙트 (미니 폭발 먼지 + 좌우 화염 잔상 + 그을음 연기)
execute as @e[type=arrow,tag=arrow_rain,nbt={inGround:1b}] at @s run particle minecraft:lava ~ ~0.1 ~ 0.3 0.1 0.3 0.1 8
execute as @e[type=arrow,tag=arrow_rain,nbt={inGround:1b}] at @s run particle minecraft:smoke ~ ~0.1 ~ 0.2 0.2 0.2 0.05 5

# 9. 바닥에 박힌 화살비 화살 즉시 제거 (순서 필수: 파티클 생성 직후 삭제)
kill @e[type=arrow,tag=arrow_rain,nbt={inGround:1b}]