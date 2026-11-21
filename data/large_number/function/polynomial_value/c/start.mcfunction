##复数域 - n次多项式批量计算函数值

#原理：秦九昭算法

#系数列表：data modify storage large_number:math polynomial_value.coefficient set value [1d,2d,{x:-3d,i:6.2d},4d,{i:5d}]
#按顺序从最高次一直写到常数次，浮点数格式，支持实数虚数与复数，最高次的系数不能为0，其余项若为0也要写上0d。

#data modify storage large_number:math polynomial_value.x_list set value [5d,{i:7d},7.3d,{x:4d,i:-1.2}]
#自变量值的列表，必须是一个列表，支持实数虚数与复数

#执行：function large_number:polynomial_value/c/start

#输出：data get storage large_number:math polynomial_value.output

data modify storage large_number:math polynomial_value.output set value []

data modify storage large_number:math list_ope_const_inp set from storage large_number:math polynomial_value.x_list
data modify storage large_number:math store_list_ope_const_inp set from storage large_number:math polynomial_value.x_list

data modify storage large_number:math Store_f_value_coef set from storage large_number:math polynomial_value.coefficient
execute unless data storage large_number:math Store_f_value_coef[1] run function large_number:polynomial_value/c/start.next.2
execute if data storage large_number:math Store_f_value_coef[1] run function large_number:polynomial_value/c/next

data modify storage large_number:math polynomial_value.output set from storage large_number:math list_ope_const_out


##复数-四则运算

#输入z1：data modify storage large_number:math complex_operation.z1 set value {x:1.0,i:2.0}
#输入z2：data modify storage large_number:math complex_operation.z2 set value {x:3.0,i:4.0}
#定义复数是一个包含两个浮点数的复合标签结构，其中x是实部，i是虚部

#加法(z1+z2)：function large_number:complex_operation/addition
#减法(z1-z2)：function large_number:complex_operation/subtraction
#乘法(z1·z2)：function large_number:complex_operation/multiplication
#高精度乘法：function large_number:complex_operation/mul_high_precision
#除法(z1/z2)：function large_number:complex_operation/division

#模长：function large_number:complex_operation/modulus
#幅角：function large_number:complex_operation/argument

#输出：data get storage large_number:math complex_operation.output

#系数列表：storage large_number:math polynomial_value.coefficient

#输入：data modify storage large_number:math list_ope_const_inp set value []
#输入常数：data modify storage large_number:math complex_operation.z2 set value {x:5.0,i:7.0}
#加法：function large_number:polynomial_value/c/list_addi_const/start
#乘法：function large_number:polynomial_value/c/list_multiply_const/start
#输出：data get storage large_number:math list_ope_const_out
