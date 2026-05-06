# --- 0m ~ 9m : 녹색 구간 ---
title @a[team=!job8,scores={job=2..},distance=..1.5] actionbar {"bold":true,"color":"green","text":"■■■■■■■■■■"}
title @a[team=!job8,scores={job=2..},distance=1.5..3] actionbar [{"bold":true,"color":"green","text":"■■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■"}]
title @a[team=!job8,scores={job=2..},distance=3..4.5] actionbar [{"bold":true,"color":"green","text":"■■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■"}]
title @a[team=!job8,scores={job=2..},distance=4.5..6] actionbar [{"bold":true,"color":"green","text":"■■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■"}]
title @a[team=!job8,scores={job=2..},distance=6..7.5] actionbar [{"bold":true,"color":"green","text":"■■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■"}]
title @a[team=!job8,scores={job=2..},distance=7.5..9] actionbar [{"bold":true,"color":"green","text":"■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■"}]

# --- 9m ~ 19.5m : 노란색/금색 구간 ---
title @a[team=!job8,scores={job=2..},distance=9..10.5] actionbar [{"bold":true,"color":"yellow","text":"■■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■"}]
title @a[team=!job8,scores={job=2..},distance=10.5..12] actionbar [{"bold":true,"color":"yellow","text":"■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■"}]
title @a[team=!job8,scores={job=2..},distance=12..13.5] actionbar [{"bold":true,"color":"yellow","text":"■■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■"}]
title @a[team=!job8,scores={job=2..},distance=13.5..15] actionbar [{"bold":true,"color":"gold","text":"■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■"}]
title @a[team=!job8,scores={job=2..},distance=15..16.5] actionbar [{"bold":true,"color":"gold","text":"■■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■"}]
title @a[team=!job8,scores={job=2..},distance=16.5..18] actionbar [{"bold":true,"color":"gold","text":"■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■"}]
title @a[team=!job8,scores={job=2..},distance=18..19.5] actionbar [{"bold":true,"color":"gold","text":"■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■"}]

# --- 19.5m ~ 30m : 빨간색 구간 ---
title @a[team=!job8,scores={job=2..},distance=19.5..22.5] actionbar [{"bold":true,"color":"red","text":"■■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■"}]
title @a[team=!job8,scores={job=2..},distance=22.5..25.5] actionbar [{"bold":true,"color":"red","text":"■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■"}]
title @a[team=!job8,scores={job=2..},distance=25.5..30] actionbar [{"bold":true,"color":"red","text":"■"},{"bold":true,"color":"dark_gray","text":"■■■■■■■■■"}]

execute at @a[scores={job=1}] run tag @a[distance=30..,scores={job=2..},team=!job8] add out_of_range
execute at @a[scores={job=1}] run kill @e[distance=30..,tag=lancer_horse,type=zombie_horse]
execute at @a[scores={job=1}] run tp @a[distance=30..,scores={job=2..},team=!job8] ~ ~ ~
