#矩阵平衡算法
#前置库：function large_number:n-th_degree_equation/higher-order_qr_loop/2_expon_database

#设置一个标志变量用于检查是否需要迭代
scoreboard players set #converged large_number.int 0

#1 (行/列) 索引
data modify storage large_number:math temp_index set value 1
function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#2 (行/列) 索引
data modify storage large_number:math temp_index set value 2
function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#3 (行/列) 索引
data modify storage large_number:math temp_index set value 3
function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#4 (行/列) 索引
data modify storage large_number:math temp_index set value 4
execute if score #temp_matrix_order large_number.int matches 4.. run function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#5 (行/列) 索引
data modify storage large_number:math temp_index set value 5
execute if score #temp_matrix_order large_number.int matches 5.. run function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#6 (行/列) 索引
data modify storage large_number:math temp_index set value 6
execute if score #temp_matrix_order large_number.int matches 6.. run function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#7 (行/列) 索引
data modify storage large_number:math temp_index set value 7
execute if score #temp_matrix_order large_number.int matches 7.. run function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#8 (行/列) 索引
data modify storage large_number:math temp_index set value 8
execute if score #temp_matrix_order large_number.int matches 8.. run function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#9 (行/列) 索引
data modify storage large_number:math temp_index set value 9
execute if score #temp_matrix_order large_number.int matches 9.. run function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance

#10 (行/列) 索引
data modify storage large_number:math temp_index set value 10
execute if score #temp_matrix_order large_number.int matches 10.. run function large_number:n-th_degree_equation/higher-order_qr_loop/n_order_blance


scoreboard players remove #temp_balance.max_loops large_number.int 1
execute if score #converged large_number.int matches 1 if score #temp_balance.max_loops large_number.int matches 1.. run function large_number:n-th_degree_equation/higher-order_qr_loop/the_matrix_balance_loop
