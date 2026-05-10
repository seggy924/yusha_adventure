# 1. 파도술사 본인 주변 효과
execute at @s run particle bubble_column_up ~ ~0.3 ~ 0.5 0.05 0.5 0 5

# 4. 삼지창 비행 파티클 연출 (trident:1b 태그 기준) 
# 날아가는 삼지창 주위에 하늘색 dust 파티클을 생성합니다.
execute at @e[type=trident, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}] run particle dust{color:[0.000,0.600,1.000],scale:3} ~ ~ ~ 0.4 0 0.4 0 4

execute at @e[type=trident, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}] run function yusha:job/job_list/job9/job_skill/splash

# 5. 삼지창 탑승 로직 (새로운 시도!) 
# 파도술사가 자신이 던진 전용 삼지창을 타고 이동하게 합니다.
execute as @s at @s run ride @s mount @e[limit=1,type=trident,distance=..3,nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}]

# 1. 삼지창(차량)에 탑승 중인지 NBT로 직접 체크하여 무적 부여
execute as @s if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:trident"}}}] run effect give @s minecraft:resistance 1 255 true

