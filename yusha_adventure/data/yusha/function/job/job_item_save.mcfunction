execute as @e[type=item, nbt={Item:{components:{"minecraft:custom_data":{job:1b}}}}] run data merge entity @s {PickupDelay:0s}
execute as @e[type=item, nbt={Item:{components:{"minecraft:custom_data":{job:1b}}}}] at @s run tp @s @p
kill @e[type=item,nbt={Item:{components:{"minecraft:custom_data":{job:2b}}}}]
execute as @a if items entity @s player.cursor *[custom_data~{job:2b}] run item replace entity @s player.cursor with minecraft:air
execute as @a if items entity @s weapon.offhand *[custom_data~{job:2b}] run item replace entity @s weapon.offhand with minecraft:air