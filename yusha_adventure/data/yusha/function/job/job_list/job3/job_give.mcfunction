#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job3 '크루세이더'
team modify job3 suffix [" ",{"text":"[","color":"white"},{"text":"크루세이더","color":"aqua"},{"text":"]","color":"white"}]
team join job3
scoreboard players set @s job 3
attribute @s minecraft:max_health base set 16
attribute @s movement_speed base set 0.13
attribute @s block_break_speed base set 4

#직업 특수 명령어
execute as @a[scores={job=3}] run function yusha:job/job_list/job3/job_item/mace
execute as @a[scores={job=3}] run function yusha:job/job_list/job3/job_item/shield
#...

#직업 선택 멘트
tellraw @a ["",{"text":"전장의 최전선에서 아군을 보호하고 성스러운 빛으로 치유하는 크루세이더","color":"aqua"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected