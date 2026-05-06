#직업 초기화 (공통)
team leave @s
function yusha:job/job_item_clear
scoreboard players set @s select_job 0

#직업 설정(공유)
team add job6 '랜서'
team modify job6 suffix [" ",{"text":"[","color":"white"},{"text":"랜서","color":"dark_red"},{"text":"]","color":"white"}]
team join job6
scoreboard players set @s job 6
attribute @s minecraft:max_health base set 12
attribute @s movement_speed base set 0.2
attribute @s attack_speed base reset


#직업 특수 명령어(개인)
scoreboard objectives add speed dummy
scoreboard objectives add ride minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add x_now dummy
scoreboard objectives add x_old dummy
scoreboard objectives add z_now dummy
scoreboard objectives add z_old dummy
scoreboard objectives add move_tag dummy
scoreboard objectives add stay dummy
scoreboard players set @s speed 0
scoreboard players set @s stay 10
function yusha:job/job_list/job6/job_item/spear
#...

#직업 선택 멘트 (공유)
tellraw @a ["",{"text":"번개같은 속도로 상대를 찌르는 랜서","color":"dark_red"},{"text":" "},{"selector":"@s"}]

#직업 선택후 이팩트(공통)
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1
function yusha:job/job_selected