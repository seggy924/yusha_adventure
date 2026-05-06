#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job3 '수호자'
team modify job3 suffix [" ",{"text":"[","color":"white"},{"text":"수호자","color":"green"},{"text":"]","color":"white"}]
team join job3
scoreboard players set @s job 3
attribute @s minecraft:max_health base set 40
attribute @s movement_speed base set 0.13

#직업 특수 명령어
function yusha:job/job_list/job3/job_item/shield
#...

#직업 선택 멘트
tellraw @a ["",{"text":"아군을 위한 든든한 방패가 되어줄 수호자","color":"green"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected