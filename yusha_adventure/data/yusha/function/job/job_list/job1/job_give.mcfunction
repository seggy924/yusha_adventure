#직업 초기화 (공통)
team leave @s
function yusha:job/job_item_clear

#직업 설정(공유)
team add job1 '용사'
team modify job1 suffix [" ",{"text":"[","color":"white"},{"text":"용사","color":"gold"},{"text":"]","color":"white"}]
team join job1
scoreboard players set @s job 1
attribute @s minecraft:max_health base set 30
attribute @s movement_speed base set 0.15
attribute @s attack_speed base reset

#직업 특수 명령어(개인)
kill @e[tag=job1_click]
scoreboard objectives add flag dummy
scoreboard players set @s flag 2
scoreboard objectives add lockon dummy
advancement revoke @s only yusha:flag_on
advancement revoke @s only yusha:flag_off

#직업 선택 멘트 (공유)
tellraw @a ["",{"selector":"@s"},{"text":" "},{"text":"에게 신의 계시가 내려졌습니다!","color":"gold"}]

#직업 선택후 이팩트(공통)
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1