scoreboard players operation #Iteration_2 int = #3.5 int
scoreboard players set #loop_math.1 int 8
scoreboard players operation #Iteration_2 int += #loop_math.1 int
scoreboard players operation #Iteration_2 int *= #loop_math.1 int

execute if score #Iteration_2 int > #2.5 int run function large_number:if_iteration_3_2.2_/e/7
execute if score #Iteration_2 int > #2.5 int run function large_number:if_iteration_3_2.2_/e/6
execute if score #Iteration_2 int > #2.5 int run function large_number:if_iteration_3_2.2_/e/5

execute if score #Iteration_2 int > #2.5 int run function large_number:large_sqrt_if_tree/e2
