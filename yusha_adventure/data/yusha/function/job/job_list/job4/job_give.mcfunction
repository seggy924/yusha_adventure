#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job4 '광전사'
team modify job4 suffix [" ",{"text":"[","color":"white"},{"text":"광전사","color":"dark_red"},{"text":"]","color":"white"}]
team join job4
scoreboard players set @s job 4
attribute @s minecraft:max_health base set 10
attribute @s movement_speed base set 0.13
attribute @s block_break_speed base set 4

#직업 특수 명령어
scoreboard objectives add kill_timer dummy
scoreboard objectives add kill_stack dummy
scoreboard objectives add dummy_temp dummy
scoreboard objectives add blood_count dummy
scoreboard objectives add kill_count totalKillCount
scoreboard players set @s kill_count 0
scoreboard players set @s kill_stack 0
function yusha:job/job_list/job4/job_item/axe

#직업 선택 멘트
tellraw @a ["",{"text":"위기의 상황에서 더욱 강력해지는 광전사","color":"dark_red"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected