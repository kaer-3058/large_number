##列表元素乘常数 - 一一对应的列表乘法 - N次导数特制

#输入列表：data modify storage large_number:math list_ope_const_inp set value []
#计算：function large_number:polynomial_n-th_derivative/r/list_mul_list_bijective_mapping/start
#输出：data get storage large_number:math list_ope_const_out

data modify storage large_number:math list_ope_const_out set value []

#递归
execute if data storage large_number:math list_ope_const_inp[0] run function large_number:polynomial_n-th_derivative/r/list_mul_list_bijective_mapping/loop1
