scoreboard players set #temp_definite_integral.loops large_number.int 0
execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int > #Store_expression_evaluation.definite_integral.dx_times large_number.int run function large_number:fourier_series_numerical/int_diff/loop

execute if score #Store_expression_evaluation.definite_integral.loop large_number.int > #Store_expression_evaluation.definite_integral.dx_times large_number.int run scoreboard players set #temp_fourier_series_numerical.tick.start large_number.int 3
