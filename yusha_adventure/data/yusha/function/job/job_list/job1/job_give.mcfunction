#직업 초기화
function yusha:job/job_list/job0/job_give
#직업 설정
team add job1 '용사'
team modify job1 suffix [" ",{"text":"[","color":"white"},{"text":"용사","color":"gold"},{"text":"]","color":"white"}]
team join job1
scoreboard players set @s job 1
attribute @s minecraft:max_health base set 30
attribute @s movement_speed base set 0.15
attribute @s luck base set 500
attribute @s attack_damage base set 5

#직업 특수 명령어
kill @e[tag=job1_click]
scoreboard objectives add flag dummy
scoreboard objectives add hit minecraft.custom:minecraft.damage_dealt
scoreboard objectives add combo dummy
scoreboard players set @s flag 2
advancement revoke @s only yusha:job_skill/flag_on
advancement revoke @s only yusha:job_skill/flag_off
advancement grant @a only yusha:main/yusha

#직업 선택 멘트
tellraw @a ["",{"selector":"@s"},{"text":" "},{"text":"에게 신의 계시가 내려졌습니다!","color":"gold"}]

#직업 선택 완료
function yusha:job/job_selected