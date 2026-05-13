# 1. 기괴하고 웅장한 사운드 연출 (무쥬라풍 저음 울림)
# 세계의 근간이 무너지는 저음과 날카로운 종소리 조합
execute as @a at @s run playsound minecraft:entity.warden.emerge master @s ~ ~ ~ 10 0.1
execute as @a at @s run playsound minecraft:block.conduit.deactivate master @s ~ ~ ~ 10 0.1
execute as @a at @s run playsound minecraft:block.bell.resonate master @s ~ ~ ~ 10 0.5
execute as @a at @s run playsound minecraft:entity.lightning_bolt.thunder master @s ~ ~ ~ 10 0.1

# 2. 화면 연출 (암전 및 멸망 멘트)
# 시야를 완전히 차단하여 공포감 극대화
effect give @a minecraft:darkness 15 255 true
effect give @a minecraft:blindness 15 255 true
effect give @a minecraft:slowness 15 5 true

# 3. 파티클 연출 (재가 내리는 세상)
# 거대한 폭발과 함께 재가 흩날리는 시각 효과
execute as @a at @s run particle minecraft:explosion_emitter ~ ~ ~ 5 5 5 0 15
execute as @a at @s run particle minecraft:large_smoke ~ ~ ~ 2 2 2 0.05 1000

# 4. 마무리 (5초 후 밴 처리)
# 소름 돋는 엔더 드래곤의 비명과 함께 종료
execute as @a at @s run playsound minecraft:entity.ender_dragon.death master @s ~ ~ ~ 1 0.5
schedule function yusha:timer/final_ban 5s