execute at @e[tag=flag] run forceload remove ~ ~
advancement grant @a[scores={job=1}] only yusha:main/teleport

execute at @a run playsound minecraft:entity.item.pickup ambient @a ~ ~ ~ 1 0
execute at @a run playsound minecraft:block.trial_spawner.detect_player ambient @a ~ ~ ~ 1 0

kill @e[tag=flag]

scoreboard players set @a[scores={job=1}] flag 2