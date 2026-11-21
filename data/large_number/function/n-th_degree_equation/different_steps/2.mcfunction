scoreboard players operation #temp_n-th_degree_equation.diff_tick_loops large_number.int = #n-th_degree_equation.diff_tick_loops large_number.int
execute if score #Store_n-th_degree_equ.QR_all_loop_times large_number.int matches 1.. run function large_number:n-th_degree_equation/different_steps/qr_loop
execute unless score #Store_n-th_degree_equ.QR_all_loop_times large_number.int matches 1.. run scoreboard players add #n-th_degree_equation.diff_info large_number.int 1
