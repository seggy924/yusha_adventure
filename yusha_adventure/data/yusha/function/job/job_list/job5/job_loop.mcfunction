# 탐험가 직업 루프
# 몬스터 드롭 처리
function yusha:job/job_list/job5/job_skill/monster_drop

# clue_item 개수를 스코어보드에 동기화 (clear 0개로 개수만 조사)
execute as @a[scores={job=5}] store result score @s clue run clear @s *[custom_data~{clue_item:1b}] 0