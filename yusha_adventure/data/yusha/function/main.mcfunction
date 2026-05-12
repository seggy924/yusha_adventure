execute if entity @a[scores={deaths=1..}] run function yusha:death
# 4. 부활 프로세스 실행 (분리된 함수 호출)
execute as @a[scores={respawn_timer=1..}] run function yusha:respawn

function yusha:job/job_loop
#직업 아이템 버리기 금지
function yusha:job/job_item_save

#재접속시
execute as @a[scores={join_game=1..}] run function yusha:join_game

#지옥 보호
# 지옥에 플레이어가 한 명이라도 있는지 확인
execute if entity @a[nbt={Dimension:"minecraft:the_nether"}] run execute in minecraft:the_nether run gamerule keep_inventory true
execute if entity @a[nbt={Dimension:"minecraft:the_nether"}] run execute in minecraft:the_nether run gamerule pvp false
execute if entity @a[nbt={Dimension:"minecraft:the_nether"}] run execute in minecraft:the_nether run gamerule fall_damage false

execute if entity @a[nbt={Dimension:"minecraft:the_end"}] run execute in minecraft:the_end run gamerule keep_inventory true
execute if entity @a[nbt={Dimension:"minecraft:the_end"}] run execute in minecraft:the_end run gamerule pvp false
execute if entity @a[nbt={Dimension:"minecraft:the_end"}] run execute in minecraft:the_end run gamerule fall_damage false


execute as @a[nbt={SelectedItem:{components:{"minecraft:custom_data":{fortress_tracker:1b}}}}] at @s run function yusha:timer/fortress_tracker

function yusha:campfire