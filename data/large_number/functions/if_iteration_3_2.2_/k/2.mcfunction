scoreboard players operation #Iteration_2.0 int = #3.11.0 int
scoreboard players operation #Iteration_2.1 int = #3.11.1 int
scoreboard players operation #Iteration_2.2 int = #3.11.2 int
scoreboard players operation #Iteration_2.3 int = #3.11.3 int
scoreboard players set #loop_math.1 int 2
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




