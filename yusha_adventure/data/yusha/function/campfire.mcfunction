execute as @a[nbt={Dimension:"minecraft:overworld"}] run scoreboard players set @s ward 0
execute as @a[nbt={Dimension:"minecraft:the_nether"}] run scoreboard players set @s ward 1
execute as @a run function yusha:campfire_ward

# 1. 활성화 (뼛가루가 모닥불 위에 있고, 아직 마커가 없을 때만 실행)
# [태그 제거] 뼛가루 아이템 위치에 불타는 모닥불이 있고 주변 1블록 내에 bone_meal 마커가 없다면 기존 마커의 태그 제거
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run execute as @e[type=marker,tag=campfire] run tag @s remove bone_meal

# [포스로드 해제] 위와 같은 조건일 때 기존 모닥불 마커 청크의 포스로드 해제
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run execute as @e[type=marker,tag=campfire] run forceload remove ~ ~

# [블록 변경] 위와 같은 조건일 때 기존 모닥불을 꺼진 모닥불(lit=false)로 교체
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run execute at @e[type=marker,tag=campfire] run setblock ~ ~ ~ campfire[lit=false] replace

# [마커 소환] 위와 같은 조건일 때 좌표를 정렬하여 중앙에 새로운 campfire 마커 소환
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["campfire"]}

# [디스플레이 소환] 위와 같은 조건일 때 모닥불 위 공중에 네더의 별 아이템 디스플레이 소환
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] align xyz run summon item_display ~0.5 ~2 ~0.5 {Tags:["campfire"],item:{id:"minecraft:nether_star",count:1}}

# [포스로드 추가] 위와 같은 조건일 때 해당 모닥불 위치 청크를 상시 로딩(forceload)에 등록
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run forceload add ~ ~

# [발전과제] 위와 같은 조건일 때 모든 플레이어에게 yusha:main/campfire 발전과제 부여
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] align xyz run advancement grant @a only yusha:main/campfire

#알레이 소환
# 불타는 모닥불 위에 자수정 조각 아이템이 있으면 주변에 무적 상태의 알레이(campfire_mob) 소환
execute at @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard"}},limit=1] if block ~ ~ ~ campfire[lit=true] align xyz run summon allay ~ ~1 ~3 {Invulnerable:1b,Tags:["campfire_mob"],DeathLootTable:""}

# 소환에 사용된 바닥의 자수정 조각 아이템 제거
execute at @e[type=item,nbt={Item:{id:"minecraft:amethyst_shard"}},limit=1] if block ~ ~ ~ campfire[lit=true] align xyz run kill @e[nbt={Item:{id:"minecraft:amethyst_shard"}}]

# [시각/청각 효과 및 마무리] 활성화 조건 만족 시 종소리 재생, 불꽃 파티클 생성, 활성화 안내 메시지 출력
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run playsound block.bell.use block @a ~ ~ ~ 1 1.6
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal,distance=..1] if block ~ ~ ~ campfire[lit=true] run particle flame ~ ~ ~ 0.2 0.5 0.2 0.03 10
execute at @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}}] unless entity @e[type=marker,tag=bone_meal] if block ~ ~ ~ campfire[lit=true] run tellraw @a {"color":"gold","text":"모닥불이 활성화 되었습니다."}

# 새로 생성된 모닥불 마커 주변 1블록 내의 뼛가루 아이템 제거
execute at @e[type=marker,tag=campfire] unless entity @e[type=marker,tag=bone_meal] run kill @e[type=item,nbt={Item:{id:"minecraft:bone_meal"}},distance=..1]

# 중복 실행 방지를 위해 모닥불 마커에 bone_meal 태그 추가
execute as @e[type=marker,tag=campfire] run tag @s add bone_meal
# 소환된 알레이가 모닥불에서 10블록 이상 멀어지면 모닥불 근처로 강제 텔레포트
execute at @e[type=marker,tag=campfire] run tp @e[type=allay,tag=campfire_mob,distance=10..] ~ ~2 ~3

# 모닥불 수리 명령어 수정본
# 모닥불 주변 5블록 내 플레이어의 campfire_timer 점수를 1씩 차감
execute at @e[type=marker,tag=campfire] run scoreboard players remove @a[distance=..5] campfire_timer 1 

# 내구도가 깎인 아이템이 있는 플레이어만 수리 프로세스 진행
# 타이머가 0이 된 3블록 내 플레이어의 머리, 가슴, 다리, 발, 주손 아이템을 yusha:repair 모디파이어로 수리
execute at @e[type=marker,tag=campfire] as @a[distance=..3,scores={campfire_timer=0}] run item modify entity @s armor.head yusha:repair 
execute at @e[type=marker,tag=campfire] as @a[distance=..3,scores={campfire_timer=0}] run item modify entity @s armor.chest yusha:repair 
execute at @e[type=marker,tag=campfire] as @a[distance=..3,scores={campfire_timer=0}] run item modify entity @s armor.legs yusha:repair 
execute at @e[type=marker,tag=campfire] as @a[distance=..3,scores={campfire_timer=0}] run item modify entity @s armor.feet yusha:repair
execute at @e[type=marker,tag=campfire] as @a[distance=..3,scores={campfire_timer=0}] run item modify entity @s weapon.mainhand yusha:repair

# 타이머 초기화 (수리 여부와 상관없이 타이머는 돌아가도록 설정)
# 타이머가 0 이하가 된 플레이어의 타이머를 다시 120으로 설정
scoreboard players set @a[scores={campfire_timer=..0}] campfire_timer 120

# 3. 비활성화 (모닥불 블록이 사라지면 마커 제거 및 알림)
# 모닥불 마커 위치에 켜진 모닥불 블록이 없으면 5블록 내 플레이어에게 비활성화 메시지 출력 및 마커 제거
execute as @e[type=marker,tag=campfire] at @s unless block ~ ~ ~ campfire[lit=true] run tellraw @a[distance=..5] {"color":"dark_gray","text":"모닥불이 비활성화 되었습니다."}
execute as @e[type=marker,tag=campfire] at @s unless block ~ ~ ~ campfire[lit=true] run kill @s
# 주변에 campfire 마커가 없으면 알레이 제거
execute as @e[type=allay,tag=campfire_mob] at @s unless entity @e[type=marker,tag=campfire] run kill @s
# 주변에 campfire 마커가 없으면 아이템 디스플레이 제거
execute as @e[type=item_display,tag=campfire] at @s unless entity @e[type=marker,tag=campfire] run kill @s

# 4. 상시 효과 부여
#execute at @e[type=marker,tag=campfire] run effect give @a[distance=..10] minecraft:darkness 2 0 true
# 모닥불 주변 3블록 내 플레이어에게 재생 및 나약함 효과 부여
execute at @e[type=marker,tag=campfire] run effect give @a[distance=..3] minecraft:regeneration 5 0 true
execute at @e[type=marker,tag=campfire] run effect give @a[distance=..3] weakness 2 100 true