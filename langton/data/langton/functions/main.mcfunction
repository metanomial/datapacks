# Remove lstate score from inappropriate entities
scoreboard players reset @e[type=!minecraft:bee,scores={lstate=0..}] lstate

# Remove out of range lstate score
scoreboard players reset @e[scores={lstate=35..}] lstate

# Free off-grid bees
execute as @e[scores={lstate=0..}] run execute at @s run execute unless block ~ ~-1 ~ #langton:tile run tag @s add yesai
scoreboard players reset @e[tag=yesai] lstate
execute as @e[tag=yesai] run data modify entity @s NoAI set value 0b
tag @e[tag=yesai] remove yesai

# Assign an initial state of 0 to Langton's bees
execute as @e[type=minecraft:bee] run execute at @s run execute if block ~ ~-1 ~ #langton:tile run scoreboard players add @s lstate 0

# Routine-lock Langton's bees
execute as @e[scores={lstate=0..}] run data modify entity @s NoAI set value 1b

# Align Langton's Bees to the XZ grid (lstate=0)
execute as @e[scores={lstate=0}] run execute at @s run execute align xyz run teleport ~0.5 ~ ~0.5
execute as @e[scores={lstate=0},y_rotation=45..135] run execute at @s run teleport @s ~ ~ ~ 90 0
execute as @e[scores={lstate=0},y_rotation=135..225] run execute at @s run teleport @s ~ ~ ~ 180 0
execute as @e[scores={lstate=0},y_rotation=225..315] run execute at @s run teleport @s ~ ~ ~ 270 0
execute as @e[scores={lstate=0},y_rotation=315..405] run execute at @s run teleport @s ~ ~ ~ 0 0

# Inspect tile (lstate=0)
execute as @e[scores={lstate=0}] run execute at @s run execute if block ~ ~-1 ~ minecraft:black_concrete run scoreboard players set @s lstate 1
execute as @e[scores={lstate=0}] run execute at @s run execute if block ~ ~-1 ~ minecraft:white_concrete run scoreboard players set @s lstate 2

# Set white tile (lstate=1)
execute as @e[scores={lstate=1}] run execute at @s run setblock ~ ~-1 ~ minecraft:white_concrete
scoreboard players set @e[scores={lstate=1}] lstate 3

# Set white tile (lstate=2)
execute as @e[scores={lstate=2}] run execute at @s run setblock ~ ~-1 ~ minecraft:black_concrete
scoreboard players set @e[scores={lstate=2}] lstate 10

# Turn left (lstate=9)
execute as @e[scores={lstate=9}] run execute at @s run teleport @s ~ ~ ~ ~-90 ~
execute as @e[scores={lstate=9}] run execute at @s run execute if block ^ ^ ^1 #langton:air if block ^ ^-1 ^1 #langton:tile run scoreboard players set @s lstate 17
scoreboard players set @e[scores={lstate=9}] lstate 3

# Turn right (lstate=16)
execute as @e[scores={lstate=16}] run execute at @s run teleport @s ~ ~ ~ ~90 ~
execute as @e[scores={lstate=16}] run execute at @s run execute if block ^ ^ ^1 #langton:air if block ^ ^-1 ^1 #langton:tile run scoreboard players set @s lstate 17
scoreboard players set @e[scores={lstate=16}] lstate 10

# Move forward (lstate=26)
execute as @e[scores={lstate=26}] run execute at @s run teleport @s ^ ^ ^1
scoreboard players set @e[scores={lstate=26}] lstate 27

# Wait (lstate=3..8,10..15,17..25,27..34)
scoreboard players add @e[scores={lstate=3..8}] lstate 1
scoreboard players add @e[scores={lstate=10..15}] lstate 1
scoreboard players add @e[scores={lstate=17..25}] lstate 1
scoreboard players add @e[scores={lstate=27..34}] lstate 1

# Repeat (lstate=35)
scoreboard players set @e[scores={lstate=35}] lstate 0
