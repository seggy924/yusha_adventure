# 1. 파도술사 본인 주변 효과
execute at @s run particle bubble_column_up ~ ~0.3 ~ 0.5 0.05 0.5 0 5

# 4. 삼지창 비행 파티클 연출 (trident:1b 태그 기준) 
# 날아가는 삼지창 주위에 하늘색 dust 파티클을 생성합니다.
execute at @e[type=trident, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}] run particle dust{color:[0.000,0.600,1.000],scale:3} ~ ~ ~ 0.4 0 0.4 0 4

# 5. 삼지창 탑승 로직 (새로운 시도!) 
# 파도술사가 자신이 던진 전용 삼지창을 타고 이동하게 합니다.
execute as @s at @s run ride @s mount @e[limit=1,type=trident,distance=..3,nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}]

# 1. 땅에 박힌 삼지창(nbt 체크) 중 아직 소리가 안 난 것(tag 체크) 주변에 소리 재생
execute at @e[type=trident, tag=!landed_sound, nbt={inGround:1b, item:{components:{"minecraft:custom_data":{trident:1b}}}}] run playsound minecraft:entity.generic.splash master @a[distance=..5] ~ ~ ~ 1 1

# 2. 소리가 난 삼지창에 태그를 붙여서 중복 실행 방지
execute as @e[type=trident, tag=!landed_sound, nbt={inGround:1b, item:{components:{"minecraft:custom_data":{trident:1b}}}}] run tag @s add landed_sound

execute at @e[type=trident, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}},DealtDamage:1b,inGround:0b}] as @e[distance=1..5] run damage @s 3