tellraw @a ["",{"text":"[ ","color":"gray"},{"text":"용사의 모험","color":"gold","bold":true},{"text":" ] ","color":"gray"},{"text":"데이터팩이 성공적으로 로드되었습니다!","color":"white"}]
scoreboard objectives remove generation
gamerule fall_damage false
gamerule pvp false
function yusha:timer/timer_stop
schedule clear yusha:game_start/wait_notice
advancement revoke seggy_rice_ only yusha:win
gamerule immediate_respawn true
gamerule fall_damage false
kill @e[tag=flag]
execute at @a run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 1
# 용사 죽음 스코어보드
scoreboard objectives add deaths deathCount
# 환생 횟수를 저장할 스코어보드 (기본값은 0임)
scoreboard objectives add generation deathCount '번째 환생'
# 재접속 스코어 보드
scoreboard objectives add join_game minecraft.custom:minecraft.leave_game
# 직업 스코어보드 (기본값은 0임)
scoreboard objectives add job dummy '직업'
# 환생 횟수를 출력
scoreboard objectives setdisplay below_name generation
# hp 스코어보드
scoreboard objectives add hp health
#리스폰 타이머 스코어 보드
scoreboard objectives add respawn_timer dummy

scoreboard objectives add count dummy

scoreboard objectives add oracle dummy

scoreboard objectives add wait_count dummy

scoreboard players set #sys_wait wait_count 0
# 트리거 점수판 생성
scoreboard objectives add select_job trigger

scoreboard objectives add timer dummy
#모두를 무직으로 설정
#execute as @a run function yusha:job/job_list/job0/job_give
#용사 깃발 초기화
function yusha:job/job_item_clear

