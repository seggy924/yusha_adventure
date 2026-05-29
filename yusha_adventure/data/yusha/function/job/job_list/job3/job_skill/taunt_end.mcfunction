# 3. 타겟이 리셋된 주변 몹들에게 0.1 대미지를 주어 시전자에게 어그로 고정
execute as @a[tag=taunt_caster] at @s as @e[type=!#not_live,distance=..30] run damage @s 0.0 minecraft:generic by @p


# 2. 관전 모드가 되었던 플레이어들을 다시 서바이벌 모드로 복구
execute as @a[tag=taunt_caster] at @s run gamemode survival @a[distance=..31,gamemode=spectator]

execute as @a[tag=taunt_caster] run function yusha:job/job_list/job3/job_item/mace
# 4. 역할이 끝난 시전자의 태그 제거
tag @a[tag=taunt_caster] remove taunt_caster