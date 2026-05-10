#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job6 '랜서'
team modify job6 suffix [" ",{"text":"[","color":"white"},{"text":"랜서","color":"dark_red"},{"text":"]","color":"white"}]
team join job6
scoreboard players set @s job 6
attribute @s minecraft:max_health base set 16
attribute @s movement_speed base set 0.17
attribute @s block_break_speed base set 4


#직업 특수 명령어
scoreboard objectives add speed dummy
scoreboard objectives add ride minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add x_now dummy
scoreboard objectives add x_old dummy
scoreboard objectives add z_now dummy
scoreboard objectives add z_old dummy
scoreboard objectives add move_tag dummy
scoreboard objectives add stay dummy
scoreboard objectives add horse dummy
scoreboard players set @s horse 1
scoreboard players set @s speed 0
scoreboard players set @s stay 10
function yusha:job/job_list/job6/job_item/spear
#...

#직업 선택 멘트
tellraw @a ["",{"text":"번개같은 속도로 상대를 찌르는 랜서","color":"dark_red"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected