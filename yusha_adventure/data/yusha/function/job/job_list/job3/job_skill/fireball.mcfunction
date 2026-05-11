# 1. 화염구 소환 (가속도 태그를 아예 빼고 소환하여 에러 방지)
execute at @s anchored eyes run summon fireball ^ ^ ^2 {Tags:["job3_fireball"], ExplosionPower:1}

# 2. 플레이어의 Motion(보는 방향 벡터)을 화염구의 Motion으로 즉시 복사
execute as @e[tag=job3_fireball] run data modify entity @s Motion set from entity @p Motion

# 3. 화염구는 Motion만 있으면 멈추는 경우가 있으므로, 
# 복사한 Motion 값을 'power' (혹은 acceleration) 위치에 강제로 쑤셔 넣습니다.

# 4. 태그 제거
tag @e[tag=job3_fireball] remove job3_fireball