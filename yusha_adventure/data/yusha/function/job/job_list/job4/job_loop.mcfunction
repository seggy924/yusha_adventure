# 0. 아이템 개수 체크 (현재 인벤토리에 몇 개 있는지 blood_count에 저장)
execute as @a[scores={job=4}] store result score @s blood_count run clear @s minecraft:magma_cream[minecraft:custom_data~{blood:1b}] 0

# 1. 스택 상승 및 타이머 리셋
execute as @a[scores={job=4,kill_count=1.., kill_stack=..4}] run scoreboard players add @s kill_stack 1
execute as @a[scores={job=4,kill_count=1..}] run scoreboard players set @s kill_timer 400

# 2. 효과음 발생
# (5스택 달성 시: 가장 파괴적인 소리)
execute as @a[scores={job=4,kill_count=1.., kill_stack=5}] at @s run playsound minecraft:entity.zombie.attack_iron_door master @a ~ ~ ~ 1 1.5

# (1~4스택 상승 시: 스택별로 피치를 낮춰서 점점 무겁게 연출)
execute as @a[scores={job=4,kill_count=1.., kill_stack=1}] at @s run playsound minecraft:entity.player.attack.weak player @s ~ ~ ~ 1 1.2
execute as @a[scores={job=4,kill_count=1.., kill_stack=2}] at @s run playsound minecraft:entity.player.attack.crit player @s ~ ~ ~ 1 1.0
execute as @a[scores={job=4,kill_count=1.., kill_stack=3}] at @s run playsound minecraft:entity.player.attack.strong player @s ~ ~ ~ 1 0.8
execute as @a[scores={job=4,kill_count=1.., kill_stack=4}] at @s run playsound minecraft:entity.iron_golem.damage player @s ~ ~ ~ 1 1.2

# 3. '피의 갈망' 아이템 지급 (1개씩만 추가, 최대 5개 제한)
# 조건: 처치를 했고, 현재 인벤토리에 아이템이 4개 이하인 경우에만 1개 지급
execute as @a[scores={job=4,kill_count=1.., blood_count=..4}] run function yusha:job/job_list/job4/job_item/blood
# 4. 스택별 힘 버프 부여 (입자 제거)
execute as @a[scores={job=4,kill_stack=1}] run effect give @s minecraft:strength 10 0 true 
execute as @a[scores={job=4,kill_stack=2}] run effect give @s minecraft:strength 10 1 true 
execute as @a[scores={job=4,kill_stack=3}] run effect give @s minecraft:strength 10 2 true 
execute as @a[scores={job=4,kill_stack=4}] run effect give @s minecraft:strength 10 3 true 
execute as @a[scores={job=4,kill_stack=5..}] run effect give @s minecraft:strength 10 4 true 

# 6. 붉은 파티클 연출
execute as @a[scores={job=4,kill_stack=1}] at @s run particle minecraft:dust{color:[1,0,0],scale:0.8} ~ ~0.1 ~ 0.2 0.4 0.2 0.01 1 force
execute as @a[scores={job=4,kill_stack=2}] at @s run particle minecraft:dust{color:[0.9,0,0],scale:1.0} ~ ~0.1 ~ 0.2 0.4 0.2 0.01 2 force
execute as @a[scores={job=4,kill_stack=3}] at @s run particle minecraft:dust{color:[0.8,0,0],scale:1.2} ~ ~0.1 ~ 0.25 0.5 0.25 0.02 3 force
execute as @a[scores={job=4,kill_stack=4}] at @s run particle minecraft:dust{color:[0.7,0,0],scale:1.4} ~ ~0.1 ~ 0.25 0.5 0.25 0.02 5 force
execute as @a[scores={job=4,kill_stack=5..}] at @s run particle minecraft:dust{color:[0.5,0,0],scale:1.6} ~ ~0.1 ~ 0.3 0.6 0.3 0.05 8 force

# 7. 타이머 종료 시 초기화
execute as @a[scores={job=4,kill_timer=0, kill_stack=1..}] run tellraw @s {"text":"피의 갈망이 식었습니다...","color":"gray"}
execute as @a[scores={job=4,kill_timer=0, kill_stack=1..}] at @s run playsound minecraft:block.lava.extinguish player @s ~ ~ ~ 1 1
execute as @a[scores={job=4,kill_timer=0, kill_stack=1..}] run effect clear @s minecraft:strength
execute as @a[scores={job=4,kill_timer=0, kill_stack=1..}] run scoreboard players set @s kill_stack 0

# 5. 처치 카운트 초기화 및 타이머 작동
scoreboard players set @a[scores={kill_count=1..,job=4}] kill_count 0
execute as @a[scores={kill_timer=1..}] run scoreboard players remove @s kill_timer 1