data modify storage large_number:math temp2 set from storage large_number:math list_abs_num_inp[0]

#取绝对值
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:n-th_degree_equation/higher-order_qr_loop/list_abs_num/macro2 with storage large_number:math

#加法
function large_number:float_add_subtra/add

data remove storage large_number:math list_abs_num_inp[0]
execute if data storage large_number:math list_abs_num_inp[0] run function large_number:n-th_degree_equation/higher-order_qr_loop/list_abs_num/loop1
