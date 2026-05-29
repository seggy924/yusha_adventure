execute at @e[type=marker,tag=campfire] run tp @s ~ ~ ~1.5
#execute at @e[type=allay,tag=campfire_mob] run tp @s ~ ~ ~1.5
#kill @e[limit=1,tag=campfire_mob]
execute unless entity @e[type=marker,tag=campfire] run tellraw @s "활성화 된 모닥불이 없습니다."
#execute unless entity @e[type=allay,tag=campfire_mob] run tellraw @s "알레이가 없습니다."
advancement revoke @s only yusha:job_skill/ward