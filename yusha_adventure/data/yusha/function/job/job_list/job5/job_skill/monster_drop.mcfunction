# 탐험가가 죽인 몬스터 드롭 처리 (좀비/스켈레톤 제외: 거미/크리퍼)
# 드롭 아이템 생성
execute as @a[scores={job=5,kill_count=1..}] run loot give @s loot yusha:clue

# 유물을 받았는지 확인 후 스코어 증가
execute as @a[scores={job=5,kill_count=1..}] if items entity @s container.* *[custom_data~{clue_item:1b}] run scoreboard players add @s clue 1

# 노트 업데이트
execute as @a[scores={job=5,kill_count=1..}] run function yusha:job/job_list/job5/job_item/note

# 킬 카운트 초기화
scoreboard players set @a[scores={job=5,kill_count=1..}] kill_count 0