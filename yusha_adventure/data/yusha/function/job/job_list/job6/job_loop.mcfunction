#랜서
execute as @a[scores={job=6}] run effect give @s minecraft:speed 2 7 true
# 랜서: 이동 시 화염 잔상 효과
execute as @a[scores={job=6}] at @s run particle minecraft:flame ~ ~0.1 ~ 0.1 0.1 0.1 0.02 3
execute as @a[scores={job=6}] at @s run particle minecraft:smoke ~ ~0.1 ~ 0.05 0.05 0.05 0.01 1