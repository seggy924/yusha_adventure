#직업 초기화 (공통)
team leave @s

#직업 설정(공유)
team add job0 '무직'
team modify job0 suffix [" ",{"text":"[","color":"white"},{"text":"무직","color":"gray"},{"text":"]","color":"white"}]
team join job0
scoreboard players set @s job 0

#직업 특수 명령어(개인)
function yusha:job/job_item_clear
attribute @s minecraft:max_health base reset
attribute @s minecraft:movement_speed base reset
attribute @s minecraft:attack_speed base reset
attribute @s attack_damage base reset
attribute @s gravity base reset
tellraw @a {"color":"gray","text":"무직된!"}
#...

#직업 선택후 이팩트
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1