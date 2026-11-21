scoreboard players operation #Iteration_2.0 large_number.int = #3.12.0 large_number.int
scoreboard players operation #Iteration_2.1 large_number.int = #3.12.1 large_number.int
scoreboard players operation #Iteration_2.2 large_number.int = #3.12.2 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int = #3.12.3 large_number.int
scoreboard players set #loop_math.1 large_number.int 4
execute store result score #4.3 large_number.int run scoreboard players operation #Iteration_2.3 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

execute store result score #4.3 large_number.int run scoreboard players operation #Iteration_2.3 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.2 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.1 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #Iteration_2.0 large_number.int *= #loop_math.1 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #Iteration_2.2 large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #Iteration_2.1 large_number.int += #4.2 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
scoreboard players operation #Iteration_2.0 large_number.int += #4.1 large_number.int
scoreboard players operation #Iteration_2.3 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.2 large_number.int %= 10000 const
scoreboard players operation #Iteration_2.1 large_number.int %= 10000 const

scoreboard players set #Iteration_>#2._ large_number.int 0
execute if score #Iteration_2.0 large_number.int > #2.12.0 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int if score #Iteration_2.1 large_number.int > #2.12.1 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int if score #Iteration_2.2 large_number.int > #2.12.2 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int unless score #Iteration_2.2 large_number.int < #2.12.2 large_number.int if score #Iteration_2.3 large_number.int > #2.12.3 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute if score #Iteration_>#2._ large_number.int matches 1 run function large_number:if_iteration_3_2.2_/l/3

scoreboard players set #Iteration_>#2._ large_number.int 0
execute if score #Iteration_2.0 large_number.int > #2.12.0 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int if score #Iteration_2.1 large_number.int > #2.12.1 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int if score #Iteration_2.2 large_number.int > #2.12.2 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int unless score #Iteration_2.2 large_number.int < #2.12.2 large_number.int if score #Iteration_2.3 large_number.int > #2.12.3 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute if score #Iteration_>#2._ large_number.int matches 1 run function large_number:if_iteration_3_2.2_/l/2

scoreboard players set #Iteration_>#2._ large_number.int 0
execute if score #Iteration_2.0 large_number.int > #2.12.0 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int if score #Iteration_2.1 large_number.int > #2.12.1 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int if score #Iteration_2.2 large_number.int > #2.12.2 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int unless score #Iteration_2.2 large_number.int < #2.12.2 large_number.int if score #Iteration_2.3 large_number.int > #2.12.3 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute if score #Iteration_>#2._ large_number.int matches 1 run function large_number:if_iteration_3_2.2_/l/1

scoreboard players set #Iteration_>#2._ large_number.int 0
execute if score #Iteration_2.0 large_number.int > #2.12.0 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int if score #Iteration_2.1 large_number.int > #2.12.1 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int if score #Iteration_2.2 large_number.int > #2.12.2 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute unless score #Iteration_2.0 large_number.int < #2.12.0 large_number.int unless score #Iteration_2.1 large_number.int < #2.12.1 large_number.int unless score #Iteration_2.2 large_number.int < #2.12.2 large_number.int if score #Iteration_2.3 large_number.int > #2.12.3 large_number.int run scoreboard players set #Iteration_>#2._ large_number.int 1
execute if score #Iteration_>#2._ large_number.int matches 1 run function large_number:if_iteration_3_2.2_/l/0