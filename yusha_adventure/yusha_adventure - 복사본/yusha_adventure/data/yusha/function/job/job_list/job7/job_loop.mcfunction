#아처
execute as @a[scores={job=7}] run function yusha:job/job_list/job7/job_item/quiver
# 1. 아처의 특수 화살 판정 및 대미지 로직
# 화살 아이템 데이터에 {archer_arrow:1b}가 있는 경우에만 air_time 점수를 올립니다.
execute as @e[type=arrow, nbt={inGround:0b, item:{components:{"minecraft:custom_data":{archer_arrow:1b}}}}] run scoreboard players add @s air_time 1

# 2. 누적된 air_time에 비례하여 대미지 설정 (비행 거리에 따른 위력 강화)
execute as @e[type=arrow, nbt={item:{components:{"minecraft:custom_data":{archer_arrow:1b}}}}] store result entity @s damage double 2.0 run scoreboard players get @s air_time

# 3. 땅에 닿은 아처 화살 즉시 삭제 (회수 방지)
# 일반 화살은 데이터가 없으므로 이 로직을 통과해 땅에 남습니다.
execute as @e[type=arrow, nbt={inGround:1b, item:{components:{"minecraft:custom_data":{archer_arrow:1b}}}}] run kill @s

# 4. [시각 효과] 아처의 화살에만 전용 파티클 출력
execute at @e[type=arrow, nbt={inGround:0b, item:{components:{"minecraft:custom_data":{archer_arrow:1b}}}}] run particle minecraft:electric_spark ~ ~ ~ 1 1 1 0.3 10