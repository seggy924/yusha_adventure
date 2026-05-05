# 드롭 아이템 생성
loot give @a[scores={job=5}] loot yusha:clue

# 유물을 받았는지 확인 후 스코어 증가
#execute if items entity @a[scores={job=5}] container.* *[custom_data~{clue_item:1b}] run scoreboard players add @s clue 1
execute as @a[scores={job=5}] store result score @s clue run clear @s *[custom_data~{clue_item:1b}] 0
# 노트 업데이트
execute as @a[scores={job=5}] run function yusha:job/job_list/job5/job_item/note
# 킬 카운트 초기화
scoreboard players set @a kill_count2 0