execute at @a run playsound minecraft:item.bottle.fill_dragonbreath master @a ~ ~ ~ 1 2
execute if score #total count matches 0 run tellraw @a "그렇게 용사 일행의 위대한 여정이 시작되었습니다!"
execute if score #total count matches 0 run execute at @a run playsound minecraft:item.goat_horn.sound.0 master @a ~ ~ ~ 1 0.8