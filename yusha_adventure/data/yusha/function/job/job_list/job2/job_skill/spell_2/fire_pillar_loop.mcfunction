execute at @a[scores={job=2,spell=2}] run tp @e[tag=pointer,distance=30..] ~ ~ ~
execute as @a[scores={job=2,spell=2},tag=raycast,nbt={SelectedItem:{components:{"minecraft:custom_data":{spell:1b}}}}] at @s at @e[type=marker, tag=pointer] run particle flame ~ ~ ~ 0 0 0 0.05 10
execute as @a[scores={job=2,spell=2}] at @s at @e[type=marker, tag=pointer,distance=1..30] run tag @s add raycast
execute as @a[scores={job=2,spell=2}] at @s at @e[type=marker, tag=pointer,distance=..1] run tag @s remove raycast
execute as @a[scores={job=2,spell=2}] at @s at @e[type=marker, tag=pointer,distance=30..] run tag @s remove raycast

execute as @e[type=block_display,tag=fire_pillar] run scoreboard players add @s display_age 1
execute as @e[type=marker,tag=fire_pillar] run scoreboard players add @s display_age 1

kill @e[type=marker,scores={display_age=30..},tag=fire_pillar]
kill @e[type=block_display,scores={display_age=30..},tag=fire_pillar]