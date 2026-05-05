execute if items entity @a[scores={job=6}] weapon.mainhand *[custom_data~{spear:1b}] run function yusha:job/job_list/job6/job_skill/horse_spwan
execute if entity @a[scores={job=6},nbt={RootVehicle:{}}] run function yusha:job/job_list/job6/job_skill/horse_ride

# 1. 현재 좌표를 새롭게 가져옵니다.
execute as @a[scores={job=6}] store result score @s x_now run data get entity @s Pos[0] 100
execute as @a[scores={job=6}] store result score @s z_now run data get entity @s Pos[2] 100

# 2. [비교] 현재 좌표(now)와 이전 틱에서 저장했던 좌표(old)를 비교합니다.
scoreboard players set @a[scores={job=6}] move_tag 0
execute as @a[scores={job=6}] unless score @s x_now = @s x_old run scoreboard players set @s move_tag 1
execute as @a[scores={job=6}] unless score @s z_now = @s z_old run scoreboard players set @s move_tag 1

# 3. [판단] 움직였으면 speed를 올리고, 안 움직였으면(old랑 같으면) 0으로 깎습니다.
execute as @a[scores={job=6,move_tag=1}] run scoreboard players add @s sprint 1
execute as @a[scores={job=6,move_tag=0}] run scoreboard players set @s sprint 0

# 4. [갱신] 비교가 다 끝났으니, 다음 틱을 위해 현재 좌표를 '이전 좌표' 칸에 옮겨둡니다.
execute as @a[scores={job=6}] run scoreboard players operation @s x_old = @s x_now
execute as @a[scores={job=6}] run scoreboard players operation @s z_old = @s z_now
