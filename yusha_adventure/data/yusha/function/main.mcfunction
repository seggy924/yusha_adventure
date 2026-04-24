execute if entity @a[scores={deaths=1..}] run function yusha:death
# 4. 부활 프로세스 실행 (분리된 함수 호출)
execute as @a[scores={respawn_timer=1..}] run function yusha:respawn

execute if entity @a[scores={job=1..}] run function yusha:timer/timer_loop

function yusha:job/job_loop

execute as @e[type=item, nbt={Item:{components:{"minecraft:custom_data":{job:1b}}}}] run data merge entity @s {PickupDelay:0s}
execute as @e[type=item, nbt={Item:{components:{"minecraft:custom_data":{job:1b}}}}] at @s run tp @s @p
kill @e[nbt={Item:{components:{"minecraft:custom_data":{job:2b}}}}]
execute as @a if items entity @s player.cursor *[custom_data~{job:2b}] run item replace entity @s player.cursor with minecraft:air
