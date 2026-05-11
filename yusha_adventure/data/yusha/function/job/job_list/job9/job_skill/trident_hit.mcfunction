# 1. 점수 상승 및 타격 효과 (1, 2타)
execute as @e[type=trident, tag=!checked, nbt={DealtDamage:1b, item:{components:{"minecraft:custom_data":{trident:1b}}},inGround:0b}] on origin run scoreboard players add @s trident_hit 1
execute as @e[type=trident, tag=!checked, nbt={DealtDamage:1b,inGround:0b}] on origin at @s if entity @s[scores={trident_hit=1..2}] run playsound block.bubble_column.whirlpool_inside master @a ~ ~ ~ 1 2

# 2. 3타 적중 시 (강화): 발광 + 이동 속도 증가 + 강화 소리
execute as @a[scores={trident_hit=3}] run item modify entity @s weapon.mainhand yusha:glint_on
execute as @a[scores={trident_hit=3}] run attribute @s minecraft:movement_speed modifier add yusha:trident_speed 0.2 add_value
execute as @e[type=trident, tag=!checked, nbt={DealtDamage:1b}] on origin at @s if entity @s[scores={trident_hit=3}] run playsound minecraft:block.beacon.activate master @a ~ ~ ~ 1 2

# 3. 강화된 삼지창의 대미지 수정 (기존 로직 유지)
execute as @e[type=trident, tag=!checked] at @s on origin if entity @s[scores={trident_hit=3}] run data merge entity @e[type=trident, distance=..0.1, limit=1, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}] {damage:40.0d}

# 4. 처리 완료 태그 부여
tag @e[type=trident, tag=!checked, nbt={DealtDamage:1b}] add checked

# 5. 초기화 (4타째: 대폭발 사운드 및 이펙트, 어트리뷰트 제거)
# 4타 소리
execute as @a[scores={trident_hit=4..}] at @s run playsound block.lava.extinguish master @a ~ ~ ~ 1 0

execute as @a[scores={trident_hit=4..}] at @e[type=trident, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}] run particle dust{color:[0.000,0.600,1.000],scale:3} ~ ~ ~ 1 1 1 10 40
execute as @a[scores={trident_hit=4..}] at @e[type=trident, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}] run particle cloud ~ ~ ~ 1 1 1 1 100

# 이동 속도 어트리뷰트 제거
execute as @a[scores={trident_hit=4..}] run attribute @s minecraft:movement_speed modifier remove yusha:trident_speed

execute as @a[scores={trident_hit=4..}] run item modify entity @s weapon.mainhand yusha:glint_off
scoreboard players set @a[scores={trident_hit=4..}] trident_hit 0