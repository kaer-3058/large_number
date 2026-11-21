#nroot(N,x)
function large_number:n-th_degree_equation/nroot/start

#9次项
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_mat[0]
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_coe_m
function large_number:division/float/start
data modify storage large_number:math temp_mat[0] set from storage large_number:math float_division.output

#8次项
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_coe_m
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_mat[1]
data modify storage large_number:math float_division.input2 set from storage large_number:math float_multiply.output
function large_number:division/float/start
data modify storage large_number:math temp_mat[1] set from storage large_number:math float_division.output

#7次项
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_coe_m
function large_number:float_mul.high_precision/cube/start
data modify storage large_number:math temp_m1_3th set from storage large_number:math float_multiply.output
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_mat[2]
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_m1_3th
function large_number:division/float/start
data modify storage large_number:math temp_mat[2] set from storage large_number:math float_division.output

execute if data storage large_number:math temp_mat[3] run function large_number:n-th_degree_equation/coefficient_scaling/sf_list_3
execute if data storage large_number:math temp_mat[4] run function large_number:n-th_degree_equation/coefficient_scaling/sf_list_4
execute if data storage large_number:math temp_mat[5] run function large_number:n-th_degree_equation/coefficient_scaling/sf_list_5
execute if data storage large_number:math temp_mat[6] run function large_number:n-th_degree_equation/coefficient_scaling/sf_list_6
execute if data storage large_number:math temp_mat[7] run function large_number:n-th_degree_equation/coefficient_scaling/sf_list_7
execute if data storage large_number:math temp_mat[8] run function large_number:n-th_degree_equation/coefficient_scaling/sf_list_8
execute if data storage large_number:math temp_mat[9] run function large_number:n-th_degree_equation/coefficient_scaling/sf_list_9
