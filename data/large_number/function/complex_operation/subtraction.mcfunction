##复数-四则运算 - 减法

#z1=a+bi  z2=c+di

#data modify storage large_number:math complex_operation.z1 set value {x:1.0,i:2.0}
#data modify storage large_number:math complex_operation.z2 set value {x:3.0,i:4.0}

#function large_number:complex_operation/subtraction

#把输入值转化为标准格式的复数
data modify storage large_number:math complex_operation.output set value {x:0d,i:0d}
data modify storage large_number:math temp_complex_ope_z1 set value {x:0d,i:0d}
data modify storage large_number:math temp_complex_ope_z2 set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_complex_ope_z1 merge from storage large_number:math complex_operation.z1
execute store success score #temp2 large_number.int run data modify storage large_number:math temp_complex_ope_z2 merge from storage large_number:math complex_operation.z2
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z1.x set from storage large_number:math complex_operation.z1
execute if score #temp2 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z2.x set from storage large_number:math complex_operation.z2

execute if data storage large_number:math temp_complex_ope_z1{i:0.0} if data storage large_number:math temp_complex_ope_z2{x:0.0} run return run function large_number:complex_operation/ope_2.2
execute if data storage large_number:math temp_complex_ope_z1{x:0.0} if data storage large_number:math temp_complex_ope_z2{i:0.0} run return run function large_number:complex_operation/ope_2.3
function large_number:complex_operation/ope_2
