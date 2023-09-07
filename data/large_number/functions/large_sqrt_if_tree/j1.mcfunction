scoreboard players operation #Iteration_2.0 int = #3.10.0 int
scoreboard players operation #Iteration_2.1 int = #3.10.1 int
scoreboard players operation #Iteration_2.2 int = #3.10.2 int
scoreboard players operation #Iteration_2.3 int = #3.10.3 int
scoreboard players set #loop_math.1 int 8
execute store result score #4.3 int run scoreboard players operation #Iteration_2.3 int += #loop_math.1 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.3 int %= 10000 const
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

execute store result score #4.3 int run scoreboard players operation #Iteration_2.3 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.2 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.1 int *= #loop_math.1 int
scoreboard players operation #Iteration_2.0 int *= #loop_math.1 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #Iteration_2.2 int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #Iteration_2.1 int += #4.2 int
scoreboard players operation #4.1 int /= 10000 const
scoreboard players operation #Iteration_2.0 int += #4.1 int
scoreboard players operation #Iteration_2.3 int %= 10000 const
scoreboard players operation #Iteration_2.2 int %= 10000 const
scoreboard players operation #Iteration_2.1 int %= 10000 const

scoreboard players set #Iteration_>#2._ int 0
execute if score #Iteration_2.0 int > #2.10.0 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int if score #Iteration_2.1 int > #2.10.1 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int if score #Iteration_2.2 int > #2.10.2 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int unless score #Iteration_2.2 int < #2.10.2 int if score #Iteration_2.3 int > #2.10.3 int run scoreboard players set #Iteration_>#2._ int 1
execute if score #Iteration_>#2._ int matches 1 run function large_number:if_iteration_3_2.2_/j/7

scoreboard players set #Iteration_>#2._ int 0
execute if score #Iteration_2.0 int > #2.10.0 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int if score #Iteration_2.1 int > #2.10.1 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int if score #Iteration_2.2 int > #2.10.2 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int unless score #Iteration_2.2 int < #2.10.2 int if score #Iteration_2.3 int > #2.10.3 int run scoreboard players set #Iteration_>#2._ int 1
execute if score #Iteration_>#2._ int matches 1 run function large_number:if_iteration_3_2.2_/j/6

scoreboard players set #Iteration_>#2._ int 0
execute if score #Iteration_2.0 int > #2.10.0 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int if score #Iteration_2.1 int > #2.10.1 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int if score #Iteration_2.2 int > #2.10.2 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int unless score #Iteration_2.2 int < #2.10.2 int if score #Iteration_2.3 int > #2.10.3 int run scoreboard players set #Iteration_>#2._ int 1
execute if score #Iteration_>#2._ int matches 1 run function large_number:if_iteration_3_2.2_/j/5

scoreboard players set #Iteration_>#2._ int 0
execute if score #Iteration_2.0 int > #2.10.0 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int if score #Iteration_2.1 int > #2.10.1 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int if score #Iteration_2.2 int > #2.10.2 int run scoreboard players set #Iteration_>#2._ int 1
execute unless score #Iteration_2.0 int < #2.10.0 int unless score #Iteration_2.1 int < #2.10.1 int unless score #Iteration_2.2 int < #2.10.2 int if score #Iteration_2.3 int > #2.10.3 int run scoreboard players set #Iteration_>#2._ int 1
execute if score #Iteration_>#2._ int matches 1 run function large_number:large_sqrt_if_tree/j2