# --- 초기 발동 (speed 10) ---
execute at @a[scores={job=6,speed=10}] run playsound minecraft:item.goat_horn.sound.1 master @a ~ ~ ~ 3 0.9
execute as @a[scores={job=6,speed=10}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 0.5
execute as @a[scores={job=6,speed=10}] at @s run playsound minecraft:entity.zombie_horse.angry master @s ~ ~ ~ 1 1

# --- 50 단위 (겉날개 소리만) ---
execute as @a[scores={job=6,speed=50}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 0.6
execute as @a[scores={job=6,speed=150}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 0.8
execute as @a[scores={job=6,speed=250}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.0
execute as @a[scores={job=6,speed=350}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.2
execute as @a[scores={job=6,speed=450}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.4
execute as @a[scores={job=6,speed=550}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.6
execute as @a[scores={job=6,speed=650}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.8
execute as @a[scores={job=6,speed=750}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 2.0

# --- 100 단위 (겉날개 소리만 - 200 배수 제외 구간) ---
execute as @a[scores={job=6,speed=100}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 0.7
execute as @a[scores={job=6,speed=300}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.1
execute as @a[scores={job=6,speed=500}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.5
execute as @a[scores={job=6,speed=700}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.9

# --- 200 단위 (겉날개 + 좀비말 소리 피치 1) ---
# speed 200
execute as @a[scores={job=6,speed=200}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 0.9
execute as @a[scores={job=6,speed=200}] at @s run playsound minecraft:entity.zombie_horse.angry master @s ~ ~ ~ 3 1

# speed 400
execute as @a[scores={job=6,speed=400}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.3
execute as @a[scores={job=6,speed=400}] at @s run playsound minecraft:entity.zombie_horse.angry master @s ~ ~ ~ 5 1

# speed 600
execute as @a[scores={job=6,speed=600}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 1.7
execute as @a[scores={job=6,speed=600}] at @s run playsound minecraft:entity.zombie_horse.angry master @s ~ ~ ~ 5 1

# speed 800
execute as @a[scores={job=6,speed=800}] at @s run playsound minecraft:item.elytra.flying master @s ~ ~ ~ 0.1 2.0
execute as @a[scores={job=6,speed=800}] at @s run playsound minecraft:entity.zombie_horse.angry master @s ~ ~ ~ 5 1