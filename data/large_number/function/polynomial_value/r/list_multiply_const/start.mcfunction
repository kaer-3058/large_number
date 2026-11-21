##列表元素乘常数

#输入：data modify storage large_number:math list_ope_const_inp set value []
#输入常数：data modify storage large_number:math float_multiply.input2 set value {x:5.0,i:7.0}
#计算：function large_number:polynomial_value/r/list_multiply_const/start
#输出：data get storage large_number:math list_ope_const_out

data modify storage large_number:math list_ope_const_out set value []

#递归
execute if data storage large_number:math list_ope_const_inp[0] run function large_number:polynomial_value/r/list_multiply_const/loop1
