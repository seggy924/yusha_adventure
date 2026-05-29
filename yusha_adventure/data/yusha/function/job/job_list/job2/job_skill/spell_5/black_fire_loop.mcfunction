execute at @a[scores={job=2,spell=5}] run tp @e[tag=pointer,distance=120..] ~ ~ ~
execute as @a[scores={job=2,spell=5},tag=raycast,nbt={SelectedItem:{components:{"minecraft:custom_data":{spell:1b}}}}] at @s at @e[type=marker, tag=pointer] run particle smoke ~ ~ ~ 0 0 0 0.01 10 force
execute as @a[scores={job=2,spell=5}] at @s at @e[type=marker, tag=pointer,distance=1..120] run tag @s add raycast
execute as @a[scores={job=2,spell=5}] at @s at @e[type=marker, tag=pointer,distance=..1] run tag @s remove raycast
execute as @a[scores={job=2,spell=5}] at @s at @e[type=marker, tag=pointer,distance=120..] run tag @s remove raycast
execute as @a[tag=formchange] at @s run particle smoke ~ ~ ~ 0.5 0 0.5 0.01 20 force
execute as @a[tag=formchange] at @s run particle white_smoke ~ ~ ~ 0.5 0 0.5 0.01 1 force