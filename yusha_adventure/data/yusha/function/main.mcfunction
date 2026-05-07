execute if entity @a[scores={deaths=1..}] run function yusha:death
# 4. 부활 프로세스 실행 (분리된 함수 호출)
execute as @a[scores={respawn_timer=1..}] run function yusha:respawn

execute if entity @a[scores={job=1..}] run function yusha:timer/timer_loop

function yusha:job/job_loop
#직업 아이템 버리기 금지
function yusha:job/job_item_save

#재접속시
execute as @a[scores={join_game=1..}] run function yusha:join_game

#지옥 보호
# 지옥에 플레이어가 한 명이라도 있는지 확인
execute if entity @a[nbt={Dimension:"minecraft:the_nether"}] run gamerule keep_inventory true

# 모두가 오버월드나 엔드에 있다면 끄기
execute unless entity @a[nbt={Dimension:"minecraft:the_nether"}] run gamerule keep_inventory false

function yusha:campfire