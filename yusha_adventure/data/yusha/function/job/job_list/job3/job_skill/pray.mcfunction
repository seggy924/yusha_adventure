# 1. 시전자에게 도발 마커 태그 부여
tag @s add taunt_caster
# 2. 중요: 시전자(@s)를 '제외'한 주변 30블록 내의 모든 플레이어만 관전 모드로 변경
execute at @s run gamemode spectator @a[distance=..30,tag=!taunt_caster,gamemode=survival]

# 2. 타겟이 완전히 리셋된 주변 몹들에게 0.1 대미지를 주어 시전자에게 어그로 고정
execute at @s as @e[type=!#not_live,distance=..30] run damage @s 0.1 minecraft:generic by @a[tag=taunt_caster,limit=1]

advancement revoke @s only yusha:job_skill/pray
# 3. 1틱(0.05초) 뒤에 복구 함수 실행 예약
schedule function yusha:job/job_list/job3/job_skill/taunt_end 2t