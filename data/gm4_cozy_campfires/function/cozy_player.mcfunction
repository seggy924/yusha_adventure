# @s = player near a campfire
# run from gm4_cozy_campfires:cozy_campfire

# apply effect
effect give @s absorption 720 1 true

# particle using RGB
particle minecraft:entity_effect{color:[1.0d,0.773d,0.208d,0.15d]} ~0.3 ~0.8 ~0.3 0 0 0 1 1
particle minecraft:entity_effect{color:[1.0d,0.773d,0.208d,0.15d]} ~0.3 ~0.8 ~-0.3 0 0 0 1 1
particle minecraft:entity_effect{color:[1.0d,0.773d,0.208d,0.15d]} ~-0.3 ~0.8 ~-0.3 0 0 0 1 1
particle minecraft:entity_effect{color:[1.0d,0.773d,0.208d,0.15d]} ~-0.3 ~0.8 ~0.3 0 0 0 1 1
