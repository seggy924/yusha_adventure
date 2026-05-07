execute if score gm4 load.status matches 1 if score gm4_minor load.status matches 9.. run scoreboard players set gm4_cozy_campfires load.status 1
execute if score gm4 load.status matches 1 if score gm4_minor load.status matches 9.. run scoreboard players set gm4_cozy_campfires_minor load.status 6
execute unless score gm4 load.status matches 1.. run data modify storage gm4:log queue append value {type:"missing",module:"Cozy Campfires",id:"gm4_cozy_campfires",require:"Gamemode 4 Base",require_id:"gm4"}
execute if score gm4 load.status matches 1.. unless score gm4 load.status matches 1 run data modify storage gm4:log queue append value {type:"version_conflict",module:"Cozy Campfires",id:"gm4_cozy_campfires",require:"Gamemode 4 Base",require_id:"gm4",require_ver:"1.9.0"}
execute if score gm4 load.status matches 1 unless score gm4_minor load.status matches 9.. run data modify storage gm4:log queue append value {type:"version_conflict",module:"Cozy Campfires",id:"gm4_cozy_campfires",require:"Gamemode 4 Base",require_id:"gm4",require_ver:"1.9.0"}
execute unless score gm4_cozy_campfires load.status matches 1.. run scoreboard players set gm4_cozy_campfires load.status -1

execute if score gm4_cozy_campfires load.status matches 1 run function gm4_cozy_campfires:init
execute unless score gm4_cozy_campfires load.status matches 1 run schedule clear gm4_cozy_campfires:main
