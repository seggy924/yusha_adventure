#직업 초기화 (공통)
team leave @s
function yusha:job/job_item_clear
scoreboard players set @s select_job 0

#직업 설정(공유)
team add job9 '기상술사'
team modify job9 suffix [" ",{"text":"[","color":"white"},{"text":"기상술사","color":"dark_red"},{"text":"]","color":"white"}]
team join job9
scoreboard players set @s job 9
attribute @s minecraft:max_health base set 12

#직업 특수 명령어(개인)
function yusha:job/job_list/job9/job_item/trident
#...

#직업 선택 멘트 (공유)
tellraw @a ["",{"text":"폭풍우와 비를 다루는 기상술사","color":"dark_red"},{"text":" "},{"selector":"@s"}]

#직업 선택후 이팩트(공통)
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1
function yusha:job/job_selected