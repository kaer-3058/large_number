#上海森伯格型矩阵乘对角矩阵D
#输入：
#[列表] storage large_number:math temp_balance_D
#[矩阵] storage large_number:math naive_qr_method_input

#计算：function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/start

execute store result score #temp_matrix_order large_number.int run data get storage large_number:math naive_qr_method_input[0]
data modify storage large_number:math temp_balance_input set from storage large_number:math naive_qr_method_input

#1 (行/列) 索引
data modify storage large_number:math temp_index set value 1
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[0]
function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#2 (行/列) 索引
data modify storage large_number:math temp_index set value 2
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[1]
function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#3 (行/列) 索引
data modify storage large_number:math temp_index set value 3
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[2]
function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#4 (行/列) 索引
data modify storage large_number:math temp_index set value 4
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[3]
execute if score #temp_matrix_order large_number.int matches 4.. run function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#5 (行/列) 索引
data modify storage large_number:math temp_index set value 5
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[4]
execute if score #temp_matrix_order large_number.int matches 5.. run function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#6 (行/列) 索引
data modify storage large_number:math temp_index set value 6
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[5]
execute if score #temp_matrix_order large_number.int matches 6.. run function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#7 (行/列) 索引
data modify storage large_number:math temp_index set value 7
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[6]
execute if score #temp_matrix_order large_number.int matches 7.. run function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#8 (行/列) 索引
data modify storage large_number:math temp_index set value 8
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[7]
execute if score #temp_matrix_order large_number.int matches 8.. run function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#9 (行/列) 索引
data modify storage large_number:math temp_index set value 9
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[8]
execute if score #temp_matrix_order large_number.int matches 9.. run function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

#10 (行/列) 索引
data modify storage large_number:math temp_index set value 10
data modify storage large_number:math temp_f_approx set from storage large_number:math temp_balance_D[9]
execute if score #temp_matrix_order large_number.int matches 10.. run function large_number:n-th_degree_equation/higher-order_qr_loop/mul_d/next

data modify storage large_number:math naive_qr_method_input set from storage large_number:math temp_balance_input
