#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job10 '광부'
team modify job10 suffix [" ",{"text":"[","color":"white"},{"text":"광부","color":"aqua"},{"text":"]","color":"white"}]
team join job10
scoreboard players set @s job 10
attribute @s minecraft:max_health base set 12
attribute @s movement_speed base set 0.13

#직업 특수 명령어
function yusha:job/job_list/job10/job_item/pickaxe
#...

#직업 선택 멘트
tellraw @a ["",{"text":"깊은 동굴의 탐험가, 광부","color":"aqua"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected