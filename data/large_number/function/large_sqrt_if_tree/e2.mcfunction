scoreboard players operation #Iteration_2 large_number.int = #3.5 large_number.int
scoreboard players set #loop_math.1 large_number.int 4
scoreboard players operation #Iteration_2 large_number.int += #loop_math.1 large_number.int
scoreboard players operation #Iteration_2 large_number.int *= #loop_math.1 large_number.int

execute if score #Iteration_2 large_number.int > #2.5 large_number.int run function large_number:if_iteration_3_2.2_/e/3
execute if score #Iteration_2 large_number.int > #2.5 large_number.int run function large_number:if_iteration_3_2.2_/e/2
execute if score #Iteration_2 large_number.int > #2.5 large_number.int run function large_number:if_iteration_3_2.2_/e/1
execute if score #Iteration_2 large_number.int > #2.5 large_number.int run function large_number:if_iteration_3_2.2_/e/0