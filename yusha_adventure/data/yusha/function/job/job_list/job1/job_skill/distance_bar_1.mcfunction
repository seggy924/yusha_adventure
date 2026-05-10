# --- 0m ~ 18m : 녹색 구간 (3m 간격) ---
title @a[team=!job8,distance=..3] actionbar {"bold":true,"color":"green","text":"■■■■■■■■■■■■■■■■■■■■"}
title @a[team=!job8,distance=3..6] actionbar [{"bold":true,"color":"green","text":"■■■■■■■■■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■"}]
title @a[team=!job8,distance=6..9] actionbar [{"bold":true,"color":"green","text":"■■■■■■■■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■"}]
title @a[team=!job8,distance=9..12] actionbar [{"bold":true,"color":"green","text":"■■■■■■■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■"}]
title @a[team=!job8,distance=12..15] actionbar [{"bold":true,"color":"green","text":"■■■■■■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■"}]
title @a[team=!job8,distance=15..18] actionbar [{"bold":true,"color":"green","text":"■■■■■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■"}]

# --- 18m ~ 39m : 노란색 구간 (3m 간격) ---
title @a[team=!job8,distance=18..21] actionbar [{"bold":true,"color":"yellow","text":"■■■■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■"}]
title @a[team=!job8,distance=21..24] actionbar [{"bold":true,"color":"yellow","text":"■■■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■"}]
title @a[team=!job8,distance=24..27] actionbar [{"bold":true,"color":"yellow","text":"■■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■"}]
title @a[team=!job8,distance=27..30] actionbar [{"bold":true,"color":"yellow","text":"■■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■"}]
title @a[team=!job8,distance=30..33] actionbar [{"bold":true,"color":"yellow","text":"■■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■"}]
title @a[team=!job8,distance=33..36] actionbar [{"bold":true,"color":"yellow","text":"■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■"}]
title @a[team=!job8,distance=36..39] actionbar [{"bold":true,"color":"yellow","text":"■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■■"}]

# --- 39m ~ 60m : 빨간색 구간 (3m 간격) ---
title @a[team=!job8,distance=39..42] actionbar [{"bold":true,"color":"red","text":"■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■■■"}]
title @a[team=!job8,distance=42..45] actionbar [{"bold":true,"color":"red","text":"■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■■■■"}]
title @a[team=!job8,distance=45..48] actionbar [{"bold":true,"color":"red","text":"■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■■■■■"}]
title @a[team=!job8,distance=48..51] actionbar [{"bold":true,"color":"red","text":"■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■■■■■■"}]
title @a[team=!job8,distance=51..54] actionbar [{"bold":true,"color":"red","text":"■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■■■■■■■"}]
title @a[team=!job8,distance=54..57] actionbar [{"bold":true,"color":"red","text":"■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■■■■■■■■"}]
title @a[team=!job8,distance=57..60] actionbar [{"bold":true,"color":"red","text":"■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■■■■■■■■■■■"}]

tag @a[distance=60..,scores={job=1..}] add out_of_range
kill @e[distance=60..,tag=lancer_horse,type=zombie_horse]
execute at @e[type=item_display,tag=flag] run data merge entity @e[nbt={item:{components:{"minecraft:custom_data":{trident:1b}}}},limit=1,distance=60..] {inGround:1b}

execute at @e[tag=flag,limit=1] run tp @a[distance=60..,scores={job=1..},team=!job8] ~ ~ ~