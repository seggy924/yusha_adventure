#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job2 '성직자'
team modify job2 suffix [" ",{"text":"[","color":"white"},{"text":"성직자","color":"red"},{"text":"]","color":"white"}]
team join job2
scoreboard players set @s job 2
attribute @s minecraft:max_health base set 12
attribute @s movement_speed base set 0.13

#직업 특수 명령어
#...

#직업 선택 멘트
tellraw @a ["",{"text":"팀의 체력을 책임지는 살아있는 기적, 성직자","color":"red"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected