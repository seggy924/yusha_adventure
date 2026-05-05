# 1. 파도술사 기본 효과 (돌고래의 가속) 
execute as @a[scores={job=9}] run effect give @s dolphins_grace 1 5 true

# 2. 전용 아이템(바다의 심장) 착용 시 타이머 증가
# 가슴 슬롯에 heart:1b 데이터가 있는 아이템을 감지합니다.
execute as @a[scores={job=9}] if items entity @s armor.chest *[minecraft:custom_data~{heart:1b}] run scoreboard players add #strike timer 1

# 3. 주변 물 연출 및 스킬 실행 
function yusha:job/job_list/job9/job_skill/wave

# 4. 삼지창 비행 파티클 연출 (trident:1b 태그 기준) 
# 날아가는 삼지창 주위에 하늘색 dust 파티클을 생성합니다.
execute at @e[type=trident, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}] run particle dust{color:[0.000,0.600,1.000],scale:3} ~ ~ ~ 0.4 0 0.4 0.5 30

execute at @e[type=trident, nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}] run function yusha:job/job_list/job9/job_skill/splash

# 5. 삼지창 탑승 로직 (새로운 시도!) 
# 파도술사가 자신이 던진 전용 삼지창을 타고 이동하게 합니다.
execute as @a[scores={job=9}] at @s run ride @s mount @e[limit=1,type=trident,distance=..3,nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}}]

# 1. 삼지창(차량)에 탑승 중인지 NBT로 직접 체크하여 무적 부여
execute as @a[scores={job=9}] if entity @s[nbt={RootVehicle:{Entity:{id:"minecraft:trident"}}}] run effect give @s minecraft:resistance 1 255 true