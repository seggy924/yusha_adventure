execute at @a run playsound minecraft:item.bottle.fill_dragonbreath master @a ~ ~ ~ 1 2
schedule clear yusha:game_start/notice
schedule clear yusha:game_start/wait_notice
scoreboard players set #sys_wait wait_count 0
# 1. 인원수 차감
scoreboard players remove #total count 1

# 2. 남은 인원수에 따른 분기 처리
# 아직 남았다면 다시 목록 보여주기
execute if score #total count matches 1.. run tellraw @a "그리고..,"
execute if score #total count matches 1.. run function yusha:job/job_list

# 다 끝났다면 마무리
execute if score #total count matches 0 run tellraw @a "(이)였어요."
execute if score #total count matches 0 run schedule function yusha:game_start/line6 40t