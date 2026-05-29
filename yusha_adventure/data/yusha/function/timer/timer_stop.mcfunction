# 예약된 타이머 루프 취소
schedule clear yusha:timer/timer_loop

# 보스바 및 스코어보드 제거 
bossbar remove minecraft:doom_timer
scoreboard objectives remove doom_timer
tag @a remove end