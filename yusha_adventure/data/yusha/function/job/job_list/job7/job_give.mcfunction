#직업 초기화 (공통)
team leave @s
function yusha:job/job_item_clear
scoreboard players set @s select_job 0

#직업 설정(공유)
team add job7 '아처'
team modify job7 suffix [" ",{"text":"[","color":"white"},{"text":"아처","color":"dark_red"},{"text":"]","color":"white"}]
team join job7
scoreboard players set @s job 7
attribute @s minecraft:max_health base set 12
attribute @s movement_speed base set 0.13
attribute @s attack_speed base reset

#직업 특수 명령어(개인)
scoreboard objectives add air_time dummy
function yusha:job/job_list/job7/job_item/bow

#직업 선택 멘트 (공유)
tellraw @a ["",{"text":"멀리 있는 적의 심장을 꿰뚫는 아처","color":"dark_red"},{"text":" "},{"selector":"@s"}]

#직업 선택후 이팩트(공통)
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1
function yusha:job/job_selected