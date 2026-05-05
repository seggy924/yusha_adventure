#직업 초기화 (공통)
team leave @s
function yusha:job/job_item_clear
scoreboard players set @s select_job 0

#직업 설정(공유)
team add job8 '상인'
team modify job8 suffix [" ",{"text":"[","color":"white"},{"text":"상인","color":"green"},{"text":"]","color":"white"}]
team join job8
scoreboard players set @s job 8
attribute @s minecraft:max_health base set 16
attribute @s movement_speed base set 0.13

#직업 특수 명령어(개인)
function yusha:job/job_list/job8/job_item/emerald
#...

#직업 선택 멘트 (공유)
tellraw @a ["",{"text":"팀원들의 보급을 책임지는 상인 ","color":"green"},{"text":" "},{"selector":"@s"}]

#직업 선택후 이팩트(공통)
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1
function yusha:job/job_selected