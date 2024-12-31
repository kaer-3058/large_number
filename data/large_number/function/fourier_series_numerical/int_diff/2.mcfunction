scoreboard players set #temp_definite_integral.loops int 0
execute unless score #Store_expression_evaluation.definite_integral.loop int > #Store_expression_evaluation.definite_integral.dx_times int run function large_number:fourier_series_numerical/int_diff/loop

execute if score #Store_expression_evaluation.definite_integral.loop int > #Store_expression_evaluation.definite_integral.dx_times int run scoreboard players set #temp_fourier_series_numerical.tick.start int 3
