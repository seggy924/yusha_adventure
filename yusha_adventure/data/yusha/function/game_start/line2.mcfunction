execute at @a run playsound minecraft:item.bottle.fill_dragonbreath master @a ~ ~ ~ 1 2
tellraw @a "평화로운 세상에 위협이 닥쳤기 때문이죠..."
execute at @a run playsound minecraft:entity.ender_dragon.growl master @a ~ ~ ~ 0.6 1
function yusha:timer/timer_start

schedule function yusha:game_start/line3 40t
