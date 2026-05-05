# 아직 동료 선택 중이라면 실행
execute if score #total count matches 1.. run scoreboard players add #sys_wait wait_count 1
execute if score #total count matches 1.. run function yusha:game_start/notice