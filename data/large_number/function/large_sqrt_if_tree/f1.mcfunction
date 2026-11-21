scoreboard players operation #Iteration_2 large_number.int = #3.6 large_number.int
scoreboard players set #loop_math.1 large_number.int 8
scoreboard players operation #Iteration_2 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #Iteration_2 large_number.int *= #loop_math.1 large_number.int

execute if score #Iteration_2 large_number.int > #2.6 large_number.int run function large_number:if_iteration_3_2.2_/f/7
execute if score #Iteration_2 large_number.int > #2.6 large_number.int run function large_number:if_iteration_3_2.2_/f/6
execute if score #Iteration_2 large_number.int > #2.6 large_number.int run function large_number:if_iteration_3_2.2_/f/5

execute if score #Iteration_2 large_number.int > #2.6 large_number.int run function large_number:large_sqrt_if_tree/f2
