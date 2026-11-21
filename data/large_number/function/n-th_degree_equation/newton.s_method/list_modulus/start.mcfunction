##列表元素的绝对值|模长|

#输入：data modify storage large_number:math list_ope_const_inp set value []
#计算：function large_number:n-th_degree_equation/newton.s_method/list_modulus/start
#输出：data get storage large_number:math list_ope_const_out

data modify storage large_number:math list_ope_const_out set value []

#递归
execute if data storage large_number:math list_ope_const_inp[0] run function large_number:n-th_degree_equation/newton.s_method/list_modulus/loop1
