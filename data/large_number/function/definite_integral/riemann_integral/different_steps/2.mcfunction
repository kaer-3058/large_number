scoreboard players set #temp_definite_integral.loops large_number.int 0
execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int > #Store_expression_evaluation.definite_integral.dx_times large_number.int run function large_number:definite_integral/riemann_integral/different_steps/loop

execute if score #Store_expression_evaluation.definite_integral.loop large_number.int > #Store_expression_evaluation.definite_integral.dx_times large_number.int run scoreboard players set ##definite_integral.different_steps.start large_number.int 3
