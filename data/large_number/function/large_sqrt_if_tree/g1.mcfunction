scoreboard players operation #Iteration_2 large_number.int = #3.7 large_number.int
scoreboard players set #loop_math.1 large_number.int 8
scoreboard players operation #Iteration_2 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #Iteration_2 large_number.int *= #loop_math.1 large_number.int

execute if score #Iteration_2 large_number.int > #2.7 large_number.int run function large_number:if_iteration_3_2.2_/g/7
execute if score #Iteration_2 large_number.int > #2.7 large_number.int run function large_number:if_iteration_3_2.2_/g/6
execute if score #Iteration_2 large_number.int > #2.7 large_number.int run function large_number:if_iteration_3_2.2_/g/5

execute if score #Iteration_2 large_number.int > #2.7 large_number.int run function large_number:large_sqrt_if_tree/g2
