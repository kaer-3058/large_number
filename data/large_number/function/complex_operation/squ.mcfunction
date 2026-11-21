##复数 - 平方

#输入：data modify storage large_number:math complex_operation.z1 set value {x:1.0,i:2.0}

#function large_number:complex_operation/squ

#把输入值转化为标准格式的复数
data modify storage large_number:math temp_complex_ope_z1 set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_complex_ope_z1 merge from storage large_number:math complex_operation.z1
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z1.x set from storage large_number:math complex_operation.z1

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_complex_ope_z1.x
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_complex_ope_z1.x
function large_number:float_multiply/of_score/start
data modify storage large_number:math temp_a_2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_complex_ope_z1.i
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_complex_ope_z1.i
function large_number:float_multiply/of_score/start

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_a_2
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math complex_operation.output set value {x:0d,i:0d}
data modify storage large_number:math complex_operation.output.x set from storage large_number:math temp1

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_complex_ope_z1.x
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_complex_ope_z1.i
function large_number:float_multiply/of_score/start

function large_number:complex_operation/macro3 with storage large_number:math float_multiply
