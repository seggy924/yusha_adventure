# 1. 시각 및 청각 효과
execute as @a at @s run playsound minecraft:entity.lightning_bolt.thunder master @s ~ ~ ~ 10 0.5
execute as @a at @s run playsound minecraft:entity.generic.explode master @s ~ ~ ~ 10 0.1
execute as @a at @s run summon lightning_bolt ~ ~ ~

# 2. 화면 연출 (어둠 및 경고 타이틀)
effect give @a minecraft:darkness 10 1 true
title @a times 10 40 10
title @a title {"text":"세계가 멸망했습니다","color":"dark_red","bold":true}
title @a subtitle {"text":"모든 것이 재가 되었습니다...","color":"gray"}

# 3. 주변 파티클 효과 (큰 폭발 구름)
execute as @a at @s run particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 0.1 100

# 4. 약간의 지연 후 밴 처리 (순차적으로 실행하려면 schedule 활용 가능)
# 여기서는 연출을 조금 보여준 뒤 3초 후에 실제 밴을 하도록 설정합니다.
schedule function yusha:timer/final_ban 3s