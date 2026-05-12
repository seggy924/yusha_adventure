scoreboard objectives add dist dummy
scoreboard objectives add beep_timer dummy

give @a pitcher_pod[custom_data={fortress_tracker:1b},custom_name={"bold":true,"color":"#521B04","italic":false,"text":"맨드레이크"},lore=[{"italic":false,"text":"이 뿌리는 고향으로 되돌아 가려는"},{"italic":false,"text":" 습성이 있는것 같다."},{"italic":false,"text":"(요새에 가까워  질수록 조용해 진다)"}]] 1

# 3. 효과음 재생
playsound minecraft:entity.player.levelup player @a ~ ~ ~ 1 1