#矩阵平衡算法
data modify storage large_number:math temp_balance_D set from storage large_number:math naive_qr_method_input[0]
data modify storage large_number:math temp_balance_D[] set value 1d

execute store result score #temp_matrix_order large_number.int run data get storage large_number:math naive_qr_method_input[0]
data modify storage large_number:math temp_balance_input set from storage large_number:math naive_qr_method_input

#迭代平衡
scoreboard players operation #temp_balance.max_loops large_number.int = #n-th_degree_equ.matrix_balance.max_loops large_number.int
execute if score #temp_balance.max_loops large_number.int matches 1.. run function large_number:n-th_degree_equation/higher-order_qr_loop/the_matrix_balance_loop

#若对角矩阵D不为单位矩阵则更新 storage large_number:math naive_qr_method_input
data modify storage large_number:math temp1 set from storage large_number:math temp_balance_D
execute store result score #temp1 large_number.int run data modify storage large_number:math temp1[] set value 1d
execute if score #temp1 large_number.int matches 1.. run function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/start
