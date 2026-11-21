##复数-四则运算 - 加法

#z1=a+bi  z2=c+di

#输入z1：data modify storage large_number:math complex_operation.z1 set value {x:1.0,i:2.0}
#输入z2：data modify storage large_number:math complex_operation.z2 set value {x:3.0,i:4.0}
#定义复数是一个包含两个浮点数的复合标签结构，其中x是实部，i是虚部

#加法(z1+z2)：function large_number:complex_operation/addition
#减法(z1-z2)：function large_number:complex_operation/subtraction
#乘法(z1·z2)：function large_number:complex_operation/multiplication
#高精度乘法：function large_number:complex_operation/mul_high_precision
#除法(z1/z2)：function large_number:complex_operation/division

#输出：data get storage large_number:math complex_operation.output

#把输入值转化为标准格式的复数
data modify storage large_number:math complex_operation.output set value {x:0d,i:0d}
data modify storage large_number:math temp_complex_ope_z1 set value {x:0d,i:0d}
data modify storage large_number:math temp_complex_ope_z2 set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_complex_ope_z1 merge from storage large_number:math complex_operation.z1
execute store success score #temp2 large_number.int run data modify storage large_number:math temp_complex_ope_z2 merge from storage large_number:math complex_operation.z2
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z1.x set from storage large_number:math complex_operation.z1
execute if score #temp2 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z2.x set from storage large_number:math complex_operation.z2

execute if data storage large_number:math temp_complex_ope_z1{i:0.0} if data storage large_number:math temp_complex_ope_z2{x:0.0} run return run function large_number:complex_operation/ope_1.2
execute if data storage large_number:math temp_complex_ope_z1{x:0.0} if data storage large_number:math temp_complex_ope_z2{i:0.0} run return run function large_number:complex_operation/ope_1.3
function large_number:complex_operation/ope_1
