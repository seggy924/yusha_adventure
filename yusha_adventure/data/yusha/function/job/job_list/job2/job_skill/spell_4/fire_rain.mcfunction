# 1. 시전자가 조준한 pointer 마커 위치에 화살비 전용 고정 마커(fire_rain_cloud) 소환
execute at @a[scores={job=2,spell=4},tag=raycast] at @e[type=marker,tag=pointer,distance=..30] run summon marker ~ ~ ~ {Tags:["fire_rain_cloud"]}

execute at @e[type=marker,tag=pointer,distance=..30] run playsound entity.lightning_bolt.thunder master @s ~ ~ ~ 10 0

# 2. 방금 생성된 고정 마커에게 10초(200틱) 타이머 설정 (display_age 사용)
scoreboard players set @e[type=marker,tag=fire_rain_cloud] display_age 200