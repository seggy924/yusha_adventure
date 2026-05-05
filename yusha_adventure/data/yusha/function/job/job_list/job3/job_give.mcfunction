#직업 초기화 (공통)
team leave @s
function yusha:job/job_item_clear
scoreboard players set @s select_job 0

#직업 설정(공유)
team add job3 '수호자'
team modify job3 suffix [" ",{"text":"[","color":"white"},{"text":"수호자","color":"green"},{"text":"]","color":"white"}]
team join job3
scoreboard players set @s job 3
attribute @s minecraft:max_health base set 40
attribute @s movement_speed base set 0.13
attribute @s attack_speed base reset

#직업 특수 명령어(개인)
function yusha:job/job_list/job3/job_item/shield
#...

#직업 선택 멘트 (공유)
tellraw @a ["",{"text":"아군을 위한 든든한 방패가 되어줄 수호자","color":"green"},{"text":" "},{"selector":"@s"}]

#직업 선택후 이팩트(공통)
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1
function yusha:job/job_selected