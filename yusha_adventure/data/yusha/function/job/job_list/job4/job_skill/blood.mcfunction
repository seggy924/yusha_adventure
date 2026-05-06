# 도전과제 초기화 (반복 사용 가능)
advancement revoke @s only yusha:job_skill/blood
advancement revoke @s only yusha:job_skill/blood_break
# 사용 시 킬 스택 1 차감 (최소 0점 유지)
execute as @s[scores={kill_stack=1..}] run scoreboard players remove @s kill_stack 1