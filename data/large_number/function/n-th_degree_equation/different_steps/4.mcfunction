scoreboard players operation #temp_n-th_degree_equation.diff_tick_loops large_number.int = #n-th_degree_equation.diff_tick_loops large_number.int
execute if score #temp_newton.s_method.loops large_number.int matches 1.. if score #temp_n-th_degree_equation.diff_tick_loops large_number.int matches 1.. run function large_number:n-th_degree_equation/newton.s_method/diff_start
execute unless score #temp_newton.s_method.loops large_number.int matches 1.. run scoreboard players add #n-th_degree_equation.diff_info large_number.int 1
