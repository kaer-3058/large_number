##列表元素的绝对值之和

#输入：data modify storage large_number:math list_abs_num_inp set value []
#计算：function large_number:n-th_degree_equation/higher-order_qr_loop/list_abs_num/start
#输出：data get storage large_number:math list_abs_num_out


data remove storage large_number:math list_abs_num_out
execute store success score #temp2 large_number.int if data storage large_number:math list_abs_num_inp[0]

data modify storage large_number:math temp1 set from storage large_number:math list_abs_num_inp[0]

#取绝对值
data modify storage large_number:math stemp1 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:n-th_degree_equation/higher-order_qr_loop/list_abs_num/macro1 with storage large_number:math

#递归
data remove storage large_number:math list_abs_num_inp[0]
execute store success score #temp1 large_number.int if data storage large_number:math list_abs_num_inp[0]
execute if data storage large_number:math list_abs_num_inp[0] run function large_number:n-th_degree_equation/higher-order_qr_loop/list_abs_num/loop1

#输出
execute if score #temp1 large_number.int matches 1 run data modify storage large_number:math list_abs_num_out set from storage large_number:math temp1
execute if score #temp1 large_number.int matches 0 if score #temp2 large_number.int matches 1 run data modify storage large_number:math list_abs_num_out set from storage large_number:math temp1
