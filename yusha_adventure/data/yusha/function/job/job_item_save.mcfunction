execute as @e[type=item, nbt={Item:{components:{"minecraft:custom_data":{job:1b}}}}] at @s on origin run data modify entity @e[type=item, distance=..0.1, limit=1] Owner set from entity @s UUID
execute as @e[type=item, nbt={Item:{components:{"minecraft:custom_data":{job:1b}}}}] run data merge entity @s {PickupDelay:0s}
execute as @e[type=item, nbt={Item:{components:{"minecraft:custom_data":{job:1b}}}}] at @s on origin run tp @s @s



kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{job:2b}}}}]
execute as @a if items entity @s player.cursor *[custom_data~{job:2b}] run item replace entity @s player.cursor with minecraft:air
execute as @a if items entity @s weapon.offhand *[custom_data~{job:2b}] run item replace entity @s weapon.offhand with minecraft:air