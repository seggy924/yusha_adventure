# 1. 기존 타겟(5초 동안 추적당한 적)에게 번개 타격
#execute at @e[tag=cloud_target] run summon minecraft:lightning_bolt ~ ~ ~ {Silent:1b}
execute at @e[tag=cloud_target] run playsound entity.lightning_bolt.impact master @a ~ ~ ~ 0.2 1
execute as @e[tag=cloud_target] run damage @s 5 player_attack
#execute at @e[tag=cloud_target] run particle flash{color:,scale:1} ~ ~1 ~ 0.5 0.5 0.5 0 0

# 2. 기존 타겟 태그 제거
tag @e[tag=cloud_target] remove cloud_target

# 3. 새로운 적 3명 선정 (기상술사 위치 기준 20블록 이내)
# 이 시점에 태그가 붙어야 다음 5초 동안 구름이 쫓아다닙니다.
execute as @a[scores={job=9}] at @s run tag @e[limit=3,sort=nearest,type=!player,type=!item,type=!experience_orb,type=!villager,type=!creeper,type=!#arrows,distance=1..20] add cloud_target

# 4. 마무리 효과 및 타이머 초기화
scoreboard players set #strike timer 0