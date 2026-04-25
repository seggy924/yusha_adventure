# 1. 파도술사 본인 주변 효과
execute at @a[scores={job=9}] run particle bubble_column_up ~ ~0.3 ~ 0.5 0.05 0.5 0 5

execute at @e[tag=cloud_target] run particle dust{color:[0.000,0.600,1.000],scale:2} ~ ~ ~ 0.4 0 0.4 0.5 10