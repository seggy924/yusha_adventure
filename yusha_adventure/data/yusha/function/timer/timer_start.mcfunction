# 1. 스코어보드 생성 (이미 있으면 무시됨)
scoreboard objectives add doom_timer dummy
scoreboard objectives add doom_math dummy
scoreboard objectives add oracle dummy
scoreboard objectives add nether_time dummy "지옥 체류 시간"

# 2. 시작 시간 및 현재 남은 시간 설정 (초 단위: 4시간 = 14400초)
# 기록 계산을 위해 #start_time을 반드시 설정해야 합니다.
scoreboard players set left_time doom_timer 14400
scoreboard players set #start_time oracle 14400

# 3. 계산용 상수 설정
# 이제 초 단위로 계산하므로 20으로 나누는 상수는 필요 없습니다.
scoreboard players set #60 doom_math 60
scoreboard players set #3600 doom_math 3600
scoreboard players set #60 oracle 60
scoreboard players set #3600 oracle 3600

# 4. 보스바 설정 (최대값을 초 단위인 14400으로 설정)
bossbar add minecraft:doom_timer "멸망까지 남은 시간"
bossbar set minecraft:doom_timer max 14400
bossbar set minecraft:doom_timer style notched_12
bossbar set minecraft:doom_timer color red
bossbar set minecraft:doom_timer players @a

# 5. 타이머 루프 함수 최초 실행
function yusha:timer/timer_loop