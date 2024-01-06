scoreboard players operation #Iteration_2 int = #3.6 int
scoreboard players set #loop_math.1 int 4
scoreboard players operation #Iteration_2 int += #loop_math.1 int
scoreboard players operation #Iteration_2 int *= #loop_math.1 int

execute if score #Iteration_2 int > #2.6 int run function large_number:if_iteration_3_2.2_/f/3
execute if score #Iteration_2 int > #2.6 int run function large_number:if_iteration_3_2.2_/f/2
execute if score #Iteration_2 int > #2.6 int run function large_number:if_iteration_3_2.2_/f/1
execute if score #Iteration_2 int > #2.6 int run function large_number:if_iteration_3_2.2_/f/0