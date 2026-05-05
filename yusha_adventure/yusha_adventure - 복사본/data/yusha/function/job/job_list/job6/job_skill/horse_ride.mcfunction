# 랜서: 파티클
execute at @e[type=zombie_horse,tag=lancer_horse] run particle dust{color:[0.000,1.000,0.733],scale:1} ~ ~0.3 ~ 1 0.05 1 0.1 20
execute as @a[scores={job=6,speed=20..49}] at @s run particle copper_fire_flame ~ ~0.3 ~ 0.5 0.05 0.5 0.1 2
execute as @a[scores={job=6,speed=50..}] at @s run particle copper_fire_flame ~ ~0.3 ~ 0.5 0.05 0.5 1 3
execute as @a[scores={job=6,speed=80..}] at @s run particle sonic_boom ~ ~0.1 ~ 0.05 0.05 0.05 0.01 1
#execute as @a[scores={job=6,speed=81}] at @s run particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1

# 랜서: 가속도 계산 (최대 100까지 상승)
execute as @a[scores={job=6,sprint=1..,speed=..99}] run scoreboard players add @s speed 1
execute as @a[scores={job=6,sprint=0}] run scoreboard players set @s speed 0

# 랜서: 정지 및 걷기 상태 처리 (초기화)
execute as @a[scores={job=6,sprint=0}] run attribute @s attack_damage base reset
# --- 가속 구간 수정: 초반은 길게, 후반은 짧게 ---
execute as @a[scores={job=6,sprint=1..}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] step_height base set 3
execute as @a[scores={job=6,sprint=1..}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] fall_damage_multiplier base set -1
execute as @a[scores={job=6,sprint=1..}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] gravity base set 0.15
# --- 가속도에 따른 바람 소리 고조 (Pitch 증가) ---

# 구간2 (낮은 바람 소리)
execute as @a[scores={job=6,speed=9}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 0.05
# 구간3
execute as @a[scores={job=6,speed=17}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.08 0.7
# 구간4
execute as @a[scores={job=6,speed=22}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.09 0.9
# 구간5 (중간 단계)
execute as @a[scores={job=6,speed=30}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.1
# 구간6
execute as @a[scores={job=6,speed=36}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.2 1.3
# 구간7
execute as @a[scores={job=6,speed=41}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.3 1.5
# 구간8 (날카로운 소리)
execute as @a[scores={job=6,speed=51}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.4 1.7
# 구간9
execute as @a[scores={job=6,speed=61}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.5 1.9
# 구간10 (최고조 - 피치 2.0 및 추가 효과음)
execute as @a[scores={job=6,speed=81}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.6 0.5
#execute as @a[scores={job=6,speed=81}] at @s run playsound minecraft:entity.zombie_horse.death master @a ~ ~ ~ 1 1
#execute as @a[scores={job=6,speed=81}] at @s run playsound minecraft:entity.generic.explode master @a ~ ~ ~ 0.8 1.2

# --- 가속 중지 및 초기화 시 소리 제거 ---

# 달리기를 멈추거나 땅에 닿아 속도가 초기화될 때 모든 바람 소리 중지
execute as @a[scores={job=6,sprint=0,speed=..10}] run stopsound @s master minecraft:item.elytra.flying

#구간1
execute as @a[scores={job=6,speed=1..8}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.1
execute as @a[scores={job=6,speed=1..8}] run attribute @s attack_damage base set 0.15
#구간2
execute as @a[scores={job=6,speed=9..16}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.15
execute as @a[scores={job=6,speed=9..16}] run attribute @s attack_damage base set 0.65
#구간3
execute as @a[scores={job=6,speed=17..21}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.2
execute as @a[scores={job=6,speed=17..21}] run attribute @s attack_damage base set 1.85
#구간4
execute as @a[scores={job=6,speed=22..29}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.3
execute as @a[scores={job=6,speed=22..29}] run attribute @s attack_damage base set 3
#구간5
execute as @a[scores={job=6,speed=30..35}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.4
execute as @a[scores={job=6,speed=30..35}] run attribute @s attack_damage base set 5
#구간6
execute as @a[scores={job=6,speed=36..40}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.5
execute as @a[scores={job=6,speed=36..40}] run attribute @s attack_damage base set 10
#구간7
execute as @a[scores={job=6,speed=41..50}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.6
execute as @a[scores={job=6,speed=41..50}] run attribute @s attack_damage base set 20
#구간8
execute as @a[scores={job=6,speed=51..60}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.8
execute as @a[scores={job=6,speed=51..60}] run attribute @s attack_damage base set 60
#구간9
execute as @a[scores={job=6,speed=61..80}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 0.9
execute as @a[scores={job=6,speed=61..80}] run attribute @s attack_damage base set 100
#구간10
execute as @a[scores={job=6,speed=81..100}] run attribute @e[type=zombie_horse,tag=lancer_horse,limit=1,sort=nearest] movement_speed base set 1
execute as @a[scores={job=6,speed=81..100}] run attribute @s attack_damage base set 200
execute as @a[scores={job=6,speed=100..}] run scoreboard players set @s speed 80

# 스코어보드 초기화
execute as @a[scores={job=6}] run scoreboard players set @s sprint 0