# 타이머가 1 이상인 플레이어에게 액션바 출력 (남은 시간 표시)
execute as @s[scores={respawn_timer=181..200}] run title @s actionbar {"text":"리스폰 대기 중... (10초)","color":"red"}
execute as @s[scores={respawn_timer=161..180}] run title @s actionbar {"text":"리스폰 대기 중... (9초)","color":"red"}
execute as @s[scores={respawn_timer=141..160}] run title @s actionbar {"text":"리스폰 대기 중... (8초)","color":"red"}
execute as @s[scores={respawn_timer=121..140}] run title @s actionbar {"text":"리스폰 대기 중... (7초)","color":"red"}
execute as @s[scores={respawn_timer=101..120}] run title @s actionbar {"text":"리스폰 대기 중... (6초)","color":"red"}
execute as @s[scores={respawn_timer=81..100}] run title @s actionbar {"text":"리스폰 대기 중... (5초)","color":"yellow"}
execute as @s[scores={respawn_timer=61..80}] run title @s actionbar {"text":"리스폰 대기 중... (4초)","color":"yellow"}
execute as @s[scores={respawn_timer=41..60}] run title @s actionbar {"text":"리스폰 대기 중... (3초)","color":"green"}
execute as @s[scores={respawn_timer=21..40}] run title @s actionbar {"text":"리스폰 대기 중... (2초)","color":"green"}
execute as @s[scores={respawn_timer=1..20}] run title @s actionbar {"text":"리스폰 대기 중... (1초)","color":"green"}

# 타이머 감소
scoreboard players remove @s respawn_timer 1

# 타이머가 0이 되는 순간 부활 처리
execute if score @s respawn_timer matches 0 run function yusha:job/job_respawn
execute if score @s respawn_timer matches 0 at @e[type=item_display,limit=1] run tp @s ~ ~ ~
execute if score @s respawn_timer matches 0 unless entity @e[type=item_display,tag=flag,limit=1] at @a[scores={job=1},limit=1] run tp @s ~ ~ ~
execute if score @s respawn_timer matches 0 run effect give @s minecraft:resistance 5 255 true
execute if score @s respawn_timer matches 0 run gamemode survival @s
execute if score @s respawn_timer matches 0 run title @s actionbar {"text":"부활했습니다!","color":"aqua","bold":true}
execute if score @s respawn_timer matches 0 run scoreboard players set @s respawn_timer -1