#직업 초기화
function yusha:job/job_list/job0/job_give

#직업 설정
team add job7 '아처'
team modify job7 suffix [" ",{"text":"[","color":"white"},{"text":"아처","color":"dark_red"},{"text":"]","color":"white"}]
team join job7
scoreboard players set @s job 7
attribute @s minecraft:max_health base set 12
attribute @s movement_speed base set 0.13
attribute @s block_break_speed base set 4

#직업 특수 명령어
scoreboard objectives add air_time dummy
function yusha:job/job_list/job7/job_item/bow

#직업 선택 멘트
tellraw @a ["",{"text":"멀리 있는 적의 심장을 꿰뚫는 아처","color":"dark_red"},{"text":" "},{"selector":"@s"}]

#직업 선택 완료
function yusha:job/job_selected