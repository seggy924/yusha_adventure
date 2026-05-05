execute at @a run playsound minecraft:item.bottle.fill_dragonbreath master @a ~ ~ ~ 1 2
# 인원수 계산 및 저장
execute store result score #total count run list
scoreboard players remove #total count 1

# 동료 여부 분기
execute if score #total count matches 1.. run tellraw @a "용사에게는 함께 싸울 든든한 동료가 있었는데요,"
execute if score #total count matches 0 run tellraw @a "그렇게 용사는 고독한 길을 걷기로 했습니다..."
execute if score #total count matches 0 run execute at @a run playsound minecraft:item.goat_horn.sound.0 master @a ~ ~ ~ 1 0.8

# 동료가 있다면 line5 호출
execute if score #total count matches 1.. run schedule function yusha:game_start/line5 40t