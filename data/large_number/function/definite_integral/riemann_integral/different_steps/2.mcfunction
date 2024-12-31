scoreboard players set #temp_definite_integral.loops int 0
execute unless score #Store_expression_evaluation.definite_integral.loop int > #Store_expression_evaluation.definite_integral.dx_times int run function large_number:definite_integral/riemann_integral/different_steps/loop

execute if score #Store_expression_evaluation.definite_integral.loop int > #Store_expression_evaluation.definite_integral.dx_times int run scoreboard players set ##definite_integral.different_steps.start int 3
