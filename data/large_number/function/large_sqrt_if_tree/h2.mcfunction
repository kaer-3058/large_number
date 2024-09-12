scoreboard players operation #Iteration_2 int = #3.8 int
scoreboard players set #loop_math.1 int 4
scoreboard players operation #Iteration_2 int += #loop_math.1 int
scoreboard players operation #Iteration_2 int *= #loop_math.1 int

execute if score #Iteration_2 int > #2.8 int run function large_number:if_iteration_3_2.2_/h/3
execute if score #Iteration_2 int > #2.8 int run function large_number:if_iteration_3_2.2_/h/2
execute if score #Iteration_2 int > #2.8 int run function large_number:if_iteration_3_2.2_/h/1
execute if score #Iteration_2 int > #2.8 int run function large_number:if_iteration_3_2.2_/h/0