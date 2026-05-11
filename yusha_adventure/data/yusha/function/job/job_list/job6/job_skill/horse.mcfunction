scoreboard players set @a[scores={job=6}] move_tag 0
# 1. 현재 좌표를 새롭게 가져옵니다.
execute as @a[scores={job=6}] at @s store result score @s x_now run data get entity @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest,distance=..3] Pos[0] 100
execute as @a[scores={job=6}] at @s store result score @s z_now run data get entity @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest,distance=..3] Pos[2] 100

#[보완] 만약 말이 소환되지 않았거나 내린 상태라면 좌표 비교를 건너뛰고 0으로 유지합니다.
execute as @a[scores={job=6}] unless entity @e[type=zombie_horse,tag=lancer_horse,distance=..5] run scoreboard players set @s move_tag 0

# 2. [비교] 현재 좌표(now)와 이전 틱에서 저장했던 좌표(old)를 비교합니다.
execute as @a[scores={job=6}] unless score @s x_now = @s x_old run scoreboard players set @s move_tag 1
execute as @a[scores={job=6}] unless score @s z_now = @s z_old run scoreboard players set @s move_tag 1

# 3. [판단] 움직였으면 speed를 올립니다
execute as @a[scores={job=6,move_tag=1,speed=..799}] run scoreboard players add @s speed 1

# 4. [갱신] 비교가 다 끝났으니, 다음 틱을 위해 현재 좌표를 '이전 좌표' 칸에 옮겨둡니다.
execute as @a[scores={job=6}] run scoreboard players operation @s x_old = @s x_now
execute as @a[scores={job=6}] run scoreboard players operation @s z_old = @s z_now

#말 소환
execute as @a[scores={job=6,ride=1..}] unless entity @s[nbt={RootVehicle:{}}] unless entity @s[tag=is_riding] at @s run summon zombie_horse ~ ~ ~ {Tame:1b,Tags:["lancer_horse"],equipment:{body:{id:"minecraft:netherite_horse_armor",count:1},saddle:{id:"minecraft:saddle",count:1}},DeathLootTable:"",NoAI:1b}
execute as @a[scores={job=6,ride=1..}] unless entity @s[nbt={RootVehicle:{}}] unless entity @s[tag=is_riding] at @s run scoreboard players set @s stay 5
execute as @a[scores={job=6,ride=1..}] run tag @s add is_riding

#말 강제 탑승및 초기화
execute as @a[scores={job=6}] at @s run ride @s mount @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest]
execute as @a[scores={job=6,ride=1..}] run scoreboard players set @s ride 0
execute as @a[tag=is_riding,nbt={RootVehicle:{}}] run tag @s remove is_riding
execute as @a[scores={job=6,move_tag=0}] run tag @s remove is_riding

# 말: 파티클
execute at @e[type=zombie_horse,tag=lancer_horse] run particle dust{color:[0.000,1.000,0.733],scale:1} ~ ~0.3 ~ 1 0.05 1 0.1 20
execute as @a[scores={job=6,speed=13..50}] at @s run particle copper_fire_flame ~ ~0.3 ~ 0.5 0.05 0.5 0.1 2
execute as @a[scores={job=6,speed=50..}] at @s run particle copper_fire_flame ~ ~0.3 ~ 0.5 0.05 0.5 1 3
execute as @a[scores={job=6,speed=650..}] at @s run particle sonic_boom ~ ~0.1 ~ 0.05 0.05 0.05 0.01 1

function yusha:job/job_list/job6/job_skill/horse_sound

# 말: 사운드 초기화
execute as @a[scores={job=6,speed=0}] run stopsound @s master minecraft:item.elytra.flying

#구간1
execute as @a[scores={job=6,speed=1..13}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.2
execute as @a[scores={job=6,speed=1..13}] run attribute @s attack_damage base set 0.15
#구간2
execute as @a[scores={job=6,speed=14..25}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.4
execute as @a[scores={job=6,speed=14..25}] run attribute @s attack_damage base set 0.65
#구간3
execute as @a[scores={job=6,speed=26..50}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.8
execute as @a[scores={job=6,speed=26..50}] run attribute @s attack_damage base set 1.85
#구간4
execute as @a[scores={job=6,speed=51..100}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 1.2
execute as @a[scores={job=6,speed=51..100}] run attribute @s attack_damage base set 3
#구간5
execute as @a[scores={job=6,speed=101..200}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 1.4
execute as @a[scores={job=6,speed=101..200}] run attribute @s attack_damage base set 5
#구간6
execute as @a[scores={job=6,speed=201..350}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 1.6
execute as @a[scores={job=6,speed=201..350}] run attribute @s attack_damage base set 10
#구간7
execute as @a[scores={job=6,speed=351..500}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 1.8
execute as @a[scores={job=6,speed=351..500}] run attribute @s attack_damage base set 25
#구간8
execute as @a[scores={job=6,speed=501..650}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 2.0
execute as @a[scores={job=6,speed=501..650}] run attribute @s attack_damage base set 50
#구간9
execute as @a[scores={job=6,speed=651..800}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 2.2
execute as @a[scores={job=6,speed=651..800}] run attribute @s attack_damage base set 100
execute as @a[scores={job=6,speed=800..}] run scoreboard players set @s speed 751

#속도가 0이면 말 삭제및 초기화
execute as @a[scores={job=6,move_tag=1}] run scoreboard players set @s stay 5
execute as @a[scores={job=6,move_tag=0,stay=1..}] run scoreboard players remove @s stay 1
execute as @a[scores={job=6,move_tag=0,stay=1}] run kill @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest]
execute as @a[scores={job=6,move_tag=0,stay=1}] run scoreboard players set @s speed 0
execute as @a[scores={job=6,move_tag=0,stay=1}] run attribute @s attack_damage base reset