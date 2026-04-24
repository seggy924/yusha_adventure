#탱커
execute as @a[scores={job=3}] at @s run effect give @a[scores={job=1..},distance=1..5] minecraft:resistance 1 255 true
execute as @a[scores={job=3}] at @s run effect give @a[scores={job=1..},distance=1..5] minecraft:glowing 1 0 true
# 수호자 주변 5블록 범위 파티클 (수정된 문법)
execute as @a[scores={job=3}] at @s run particle minecraft:dust{color:[0.1,0.8,0.1],scale:1.0} ~ ~0.1 ~ 2.5 0.1 2.5 0.01 15
