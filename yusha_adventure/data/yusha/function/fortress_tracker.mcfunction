# 1. 거리 측정 (네더에 있을 때만 실행)
execute as @a[nbt={Dimension:"minecraft:the_nether"},nbt={SelectedItem:{components:{"minecraft:custom_data":{fortress_tracker:1b}}}}] at @s store result score @s dist run locate structure minecraft:fortress 

# 2. 타이머 감소 (맨드레이크를 들고 있는 모든 플레이어 대상) 
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{fortress_tracker:1b}}}}] run scoreboard players remove @s beep_timer 1 

# 3. 비명 소리 재생 (타이머가 0 이하일 때) 
# 염소 비명과 가스트 비명을 섞어 기괴한 소리를 냅니다. 
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{fortress_tracker:1b}}}},scores={beep_timer=..0}] at @s run playsound minecraft:entity.goat.screaming.hurt master @a ~ ~ ~ 0.9 2
execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{fortress_tracker:1b}}}},scores={beep_timer=..0}] at @s run playsound minecraft:entity.ghast.hurt master @a ~ ~ ~ 0.1 1.8

# 4. 타이머 초기화 (하나의 파일에서 차원별로 처리) 

# [오버월드] 고향이 아니라서 매우 빠르게 발악하며 비명을 지름 (매 틱 혹은 2틱 간격)
execute as @a[nbt={Dimension:"minecraft:overworld"},nbt={SelectedItem:{components:{"minecraft:custom_data":{fortress_tracker:1b}}}},scores={beep_timer=..0}] run scoreboard players set @s beep_timer 0

# [네더] 거리 1000까지 10단계 (가까워질수록 조용해짐) 
execute as @a[nbt={Dimension:"minecraft:the_nether"},scores={dist=..50,beep_timer=..0}] run scoreboard players set @s beep_timer 200
execute as @a[nbt={Dimension:"minecraft:the_nether"},scores={dist=51..100,beep_timer=..0}] run scoreboard players set @s beep_timer 100
execute as @a[nbt={Dimension:"minecraft:the_nether"},scores={dist=101..150,beep_timer=..0}] run scoreboard players set @s beep_timer 60
execute as @a[nbt={Dimension:"minecraft:the_nether"},scores={dist=151..200,beep_timer=..0}] run scoreboard players set @s beep_timer 30
execute as @a[nbt={Dimension:"minecraft:the_nether"},scores={dist=201..300,beep_timer=..0}] run scoreboard players set @s beep_timer 10
execute as @a[nbt={Dimension:"minecraft:the_nether"},scores={dist=301..,beep_timer=..0}] run scoreboard players set @s beep_timer 3