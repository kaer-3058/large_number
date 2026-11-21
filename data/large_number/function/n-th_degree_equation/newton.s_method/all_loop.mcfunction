#迭代开始

data modify storage large_number:math polynomial_value.coefficient set from storage large_number:math temp_newton-s_method_fz
function large_number:polynomial_value/c/start
data modify storage large_number:math temp_newm_list_ope_const_inp set from storage large_number:math polynomial_value.output
data modify storage large_number:math polynomial_value.coefficient set from storage large_number:math temp_newton-s_method_fm
function large_number:polynomial_value/c/start
data modify storage large_number:math list_ope_const_inp_2 set from storage large_number:math polynomial_value.output
data modify storage large_number:math list_ope_const_inp set from storage large_number:math temp_newm_list_ope_const_inp
function large_number:n-th_degree_equation/newton.s_method/list_div_list_bijective_mapping/start
data modify storage large_number:math polynomial_value.x_list set from storage large_number:math list_ope_const_out

scoreboard players remove #temp_newton.s_method.loops large_number.int 1
execute if score #temp_newton.s_method.loops large_number.int matches 1.. run function large_number:n-th_degree_equation/newton.s_method/all_loop
