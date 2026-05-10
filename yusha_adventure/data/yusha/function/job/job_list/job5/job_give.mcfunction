#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job5 '탐험가'
team modify job5 suffix [" ",{"text":"[","color":"white"},{"text":"탐험가","color":"aqua"},{"text":"]","color":"white"}]
team join job5
scoreboard players set @s job 5
attribute @s minecraft:max_health base set 12
attribute @s movement_speed base set 0.13
attribute @s block_break_speed base set 4

#직업 특수 명령어
scoreboard objectives add kill_count2 totalKillCount
scoreboard objectives add clue dummy "단서 획득 수"
scoreboard players set @s clue 0
function yusha:job/job_list/job5/job_item/spyglass
function yusha:job/job_list/job5/job_item/note
#...

#직업 선택 멘트 (공유)
tellraw @a ["",{"text":"뛰어난 비전으로 사람들을 인도하는 탐험가","color":"aqua"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected