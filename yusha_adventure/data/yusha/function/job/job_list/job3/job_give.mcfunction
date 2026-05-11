#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job3 '원소술사'
team modify job3 suffix [" ",{"text":"[","color":"white"},{"text":"원소술사","color":"aqua"},{"text":"]","color":"white"}]
team join job3
scoreboard players set @s job 3
attribute @s minecraft:max_health base set 40
attribute @s movement_speed base set 0.13
attribute @s block_break_speed base set 4

#직업 특수 명령어
function yusha:job/job_list/job3/job_item/orb
#...

#직업 선택 멘트
tellraw @a ["",{"text":"원소를 다루는 원소술사","color":"aqua"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected