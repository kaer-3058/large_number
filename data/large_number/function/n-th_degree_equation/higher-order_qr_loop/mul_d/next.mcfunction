#导入不含对角元素的行和列
data modify storage large_number:math c_list set value []
data modify storage large_number:math r_list set value []
function large_number:n-th_degree_equation/higher-order_qr_loop/macro2 with storage large_number:math

#行除列乘
data modify storage large_number:math list_multiply_const_inp set from storage large_number:math c_list
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_f_approx
function large_number:n-th_degree_equation/higher-order_qr_loop/list_multiply_const/start
data modify storage large_number:math c_list set from storage large_number:math list_multiply_const_out

data modify storage large_number:math list_div_const_inp set from storage large_number:math r_list
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_f_approx
function large_number:n-th_degree_equation/higher-order_qr_loop/list_div_const/start
data modify storage large_number:math r_list set from storage large_number:math list_div_const_out

#导出行列
function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/macro1 with storage large_number:math
