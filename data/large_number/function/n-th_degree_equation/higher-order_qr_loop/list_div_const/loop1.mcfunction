data modify storage large_number:math float_division.input1 set from storage large_number:math list_div_const_inp[0]

#除法
function large_number:division/float/start
data modify storage large_number:math list_div_const_out append from storage large_number:math float_division.output

data remove storage large_number:math list_div_const_inp[0]
execute if data storage large_number:math list_div_const_inp[0] run function large_number:n-th_degree_equation/higher-order_qr_loop/list_div_const/loop1
