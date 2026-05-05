execute store result bossbar minecraft:doom_timer value run scoreboard players get left_time doom_timer

execute if entity @a[scores={job=1}] run scoreboard players remove left_time doom_timer 1

execute if score left_time doom_timer matches 0 run tag @a[scores={job=1..}] add end