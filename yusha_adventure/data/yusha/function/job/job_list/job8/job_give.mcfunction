#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job8 '상인'
team modify job8 suffix [" ",{"text":"[","color":"white"},{"text":"상인","color":"aqua"},{"text":"]","color":"white"}]
team join job8
scoreboard players set @s job 8
attribute @s minecraft:max_health base set 16
attribute @s movement_speed base set 0.13
attribute @s block_break_speed base set 4

#직업 특수 명령어
function yusha:job/job_list/job8/job_item/emerald
#...

#직업 선택 멘트
tellraw @a ["",{"text":"팀원들의 보급을 책임지는 상인 ","color":"aqua"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected