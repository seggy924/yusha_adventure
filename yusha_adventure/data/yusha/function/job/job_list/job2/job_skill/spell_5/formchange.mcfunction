execute if entity @s[tag=!formchange] run tag @s add formchange
attribute @s movement_speed modifier add black_fire -0.05 add_value
attribute @s max_health modifier add black_fire -4 add_value
attribute @s step_height modifier add black_fire 1 add_value
effect give @s darkness 2 1 true
execute at @s run playsound entity.wither.shoot master @s ~ ~ ~ 0.4 0
execute at @s run playsound block.campfire.crackle master @s ~ ~ ~ 1 1
execute at @s run playsound block.fire.ambient master @s ~ ~ ~ 1 2
execute at @s run particle large_smoke ~ ~ ~ 5.0 0.0 5.0 1 500