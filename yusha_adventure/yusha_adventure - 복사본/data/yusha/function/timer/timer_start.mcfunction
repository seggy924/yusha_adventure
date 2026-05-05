#멸망 타이머 스코어보드
scoreboard objectives add doom_timer dummy
#멸망 타이머 시간 설정
scoreboard players set left_time doom_timer 288000
# 시작 시점의 시간을 따로 저장 (나중에 뺄셈을 하기 위함)
scoreboard players set #start_time oracle 288000
#멸망 타이머 추가
bossbar add doom_timer "멸망까지 남은 시간"
#멸망 타이머 보스바 시간 설정
bossbar set minecraft:doom_timer max 288000
#멸망 타이머 보스바 색 설정
bossbar set minecraft:doom_timer color red
#멸망 타이머 출력
bossbar set minecraft:doom_timer players @a
