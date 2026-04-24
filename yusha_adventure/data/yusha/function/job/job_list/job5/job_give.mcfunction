#직업 초기화 (공통)
team leave @s
function yusha:job/job_item_clear
scoreboard players set @s select_job 0

#직업 설정(공유)
team add job5 '탐험가'
team modify job5 suffix [" ",{"text":"[","color":"white"},{"text":"탐험가","color":"aqua"},{"text":"]","color":"white"}]
team join job5
scoreboard players set @s job 5
attribute @s minecraft:max_health base set 12

#직업 특수 명령어(개인)
scoreboard objectives add kill_count totalKillCount
scoreboard objectives add clue dummy "단서 획득 수"
function yusha:job/job_list/job5/job_item/spyglass
function yusha:job/job_list/job5/job_item/note
#...

#직업 선택 멘트 (공유)
tellraw @a ["",{"text":"맵핵쓰는 탐험가","color":"aqua"},{"text":" "},{"selector":"@s"}]

#직업 선택후 이팩트(공통)
effect give @s minecraft:resistance 3 255 true
effect give @s minecraft:instant_health 1 100 true
execute at @s run summon minecraft:lightning_bolt ~ ~2 ~
execute at @a run playsound minecraft:ui.cartography_table.take_result master @a ~ ~ ~ 1 1
function yusha:job/job_selected