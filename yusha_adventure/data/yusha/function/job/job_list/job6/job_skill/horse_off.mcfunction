advancement grant @s only yusha:job_skill/horse_off
scoreboard players set @s horse 0
advancement revoke @s only yusha:job_skill/horse_on

execute as @s run kill @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest,distance=..1]
execute as @s run scoreboard players set @s speed 0
execute as @s run attribute @s attack_damage base reset