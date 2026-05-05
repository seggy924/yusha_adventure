# 랜덤 번호 (대사 다양성을 위해 1..3 유지)
execute store result score #random oracle run random value 1..3

# --- 1단계: 1~3회 재촉 (친절함) ---
execute if score #sys_wait wait_count matches 1..3 if score #random oracle matches 1 run tellraw @a "음... 그러니까 제 말은..."
execute if score #sys_wait wait_count matches 1..3 if score #random oracle matches 2 run tellraw @a "천천히 생각해보셔도 괜찮아요."
execute if score #sys_wait wait_count matches 1..3 if score #random oracle matches 3 run tellraw @a "운명의 동료는 신중하게 골라야죠!"

# --- 2단계: 4~5회 재촉 (살짝 답답함) ---
execute if score #sys_wait wait_count matches 4..5 if score #random oracle matches 1 run tellraw @a "누구였냐면..!"
execute if score #sys_wait wait_count matches 4..5 if score #random oracle matches 2 run tellraw @a "그러니까...!"
execute if score #sys_wait wait_count matches 4..5 if score #random oracle matches 3 run tellraw @a "빨리요, 세계가 위험하다니까요!"

# --- 3단계: 6~7회 재촉 (인내심 한계) ---
execute if score #sys_wait wait_count matches 6..7 if score #random oracle matches 1 run tellraw @a "저기요...? 졸고 계신 건 아니죠?"
execute if score #sys_wait wait_count matches 6..7 if score #random oracle matches 2 run tellraw @a "아 진짜! 그냥 아무나 고르세요 좀!"
execute if score #sys_wait wait_count matches 6..7 if score #random oracle matches 3 run tellraw @a "살아 계시죠..?"

# --- 4단계: 8회 이상 (...) ---
execute if score #sys_wait wait_count matches 8.. if score #random oracle matches 1 run tellraw @a "..."
execute if score #sys_wait wait_count matches 8.. if score #random oracle matches 2 run tellraw @a "..."
execute if score #sys_wait wait_count matches 8.. if score #random oracle matches 3 run tellraw @a "...고르라고"

# 효과음 및 목록 재출력
execute at @a run playsound minecraft:item.bottle.fill_dragonbreath master @a ~ ~ ~ 1 2
function yusha:job/job_list