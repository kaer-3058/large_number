##实数域 - n次多项式批量计算函数值

#原理：秦九昭算法

#系数列表：data modify storage large_number:math polynomial_value.coefficient set value [1d,2d,{x:-3d,i:6.2d},4d,{i:5d}]
#按顺序从最高次一直写到常数次，浮点数格式，支持实数，最高次的系数不能为0，其余项若为0也要写上0d。

#data modify storage large_number:math polynomial_value.x_list set value [5d,{i:7d},7.3d,{x:4d,i:-1.2}]
#自变量值的列表，必须是一个列表，支持实数

#执行：function large_number:polynomial_value/r/start

#输出：data get storage large_number:math polynomial_value.output

data modify storage large_number:math polynomial_value.output set value []

data modify storage large_number:math list_ope_const_inp set from storage large_number:math polynomial_value.x_list
data modify storage large_number:math store_list_ope_const_inp set from storage large_number:math polynomial_value.x_list

data modify storage large_number:math Store_f_value_coef set from storage large_number:math polynomial_value.coefficient
execute unless data storage large_number:math Store_f_value_coef[1] run data modify storage large_number:math list_ope_const_out set from storage large_number:math polynomial_value.x_list
execute unless data storage large_number:math Store_f_value_coef[1] run data modify storage large_number:math list_ope_const_out[] set from storage large_number:math Store_f_value_coef[0]
execute if data storage large_number:math Store_f_value_coef[1] run function large_number:polynomial_value/r/next

data modify storage large_number:math polynomial_value.output set from storage large_number:math list_ope_const_out
