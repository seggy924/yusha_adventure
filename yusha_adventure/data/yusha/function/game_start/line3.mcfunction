execute at @a run playsound minecraft:item.bottle.fill_dragonbreath master @a ~ ~ ~ 1 2
tellraw @a "그렇게 신탁을 받은 용사가 정해졌습니다."
execute as @r run function yusha:job/job_list/job1/job_give
schedule function yusha:game_start/line4 40t
