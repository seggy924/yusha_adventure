#직업 초기화 (공통)
team leave @s
function yusha:job/job_item_clear
scoreboard players set @s select_job 0

#직업 설정(공유)
team add job4 '광전사'
team modify job4 suffix [" ",{"text":"[","color":"white"},{"text":"광전사","color":"dark_red"},{"text":"]","color":"white"}]
team join job4
scoreboard players set @s job 4
attribute @s minecraft:max_health base set 10

#직업 특수 명령어(개인)
scoreboard objectives add kill_timer dummy
scoreboard objectives add kill_stack dummy
scoreboard objectives add dummy_temp dummy
scoreboard objectives add blood_count dummy
scoreboard objectives add kill_count totalKillCount
scoreboard players set @s kill_count 0
scoreboard players set @s kill_stack 0
function yusha:job/job_list/job4/job_item/axe

#직업 선택 멘트 (공유)
tellraw @a ["",{"text":"위기의 상황에서 더욱 강력해지는 광전사","color":"dark_red"},{"text":" "},{"selector":"@s"}]

#직업 선택후 이팩트(공통)
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1
function yusha:job/job_selected