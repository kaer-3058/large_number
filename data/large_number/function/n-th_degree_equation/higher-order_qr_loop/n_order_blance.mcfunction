#检查是否需要平衡：
data modify storage large_number:math c_list set value []
data modify storage large_number:math r_list set value []
function large_number:n-th_degree_equation/higher-order_qr_loop/macro2 with storage large_number:math
data modify storage large_number:math list_abs_num_inp set from storage large_number:math c_list
function large_number:n-th_degree_equation/higher-order_qr_loop/list_abs_num/start

#矩阵平衡算法
scoreboard players set #temp_balanceing large_number.int 0
execute if data storage large_number:math list_abs_num_out run function large_number:n-th_degree_equation/higher-order_qr_loop/matrix_balance
execute if score #temp_balanceing large_number.int matches 1 run function large_number:n-th_degree_equation/higher-order_qr_loop/macro3 with storage large_number:math
