#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job2 '원소술사'
team modify job2 suffix [" ",{"text":"[","color":"white"},{"text":"원소술사","color":"aqua"},{"text":"]","color":"white"}]
team join job2
scoreboard players set @s job 2
attribute @s minecraft:max_health base set 40
attribute @s movement_speed base set 0.13
attribute @s block_break_speed base set 4

#직업 특수 명령어
scoreboard objectives add spell dummy
scoreboard players set @s spell 1
function yusha:job/job_list/job2/job_item/scroll
function yusha:job/job_list/job2/job_item/spell
#...

#직업 선택 멘트
tellraw @a ["",{"text":"원소를 다루는 원소술사","color":"aqua"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected