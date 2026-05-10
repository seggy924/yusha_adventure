#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job9 '파도술사'
team modify job9 suffix [" ",{"text":"[","color":"white"},{"text":"파도술사","color":"dark_red"},{"text":"]","color":"white"}]
team join job9
scoreboard players set @s job 9
attribute @s minecraft:max_health base set 12
attribute @s movement_speed base set 0.13
attribute @s block_break_speed base set 4
attribute @s block_break_speed base set 4
attribute @s submerged_mining_speed base set 2

#직업 특수 명령어
function yusha:job/job_list/job9/job_item/trident
scoreboard objectives add wave dummy
scoreboard players set @s wave 1
#...

#직업 선택 멘트
tellraw @a ["",{"text":"파도를 자유자재로 부리는 파도술사","color":"dark_red"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected