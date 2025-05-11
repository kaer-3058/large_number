##一元二次方程计算器_全double

#data modify storage large_number:math quadratic_equation_double.input set value [1.5,-2.8,-26.34]
#列表三项分别表示一元二次方程系数里的[a,b,c]

#data modify storage large_number:math quadratic_equation_double.tell set value 1

data modify storage large_number:math temp_a set from storage large_number:math quadratic_equation_double.input[0]
data modify storage large_number:math temp_b set from storage large_number:math quadratic_equation_double.input[1]
data modify storage large_number:math temp_c set from storage large_number:math quadratic_equation_double.input[2]

#delta
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_b
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math temp_b2 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_a
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_c
function large_number:float_mul.high_precision/start
function large_number:quadratic_equation_double/macro1 with storage large_number:math float_multiply

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_b2
data modify storage large_number:math temp2 set from storage large_number:math q0
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math temp_delta set from storage large_number:math temp1

data modify storage large_number:math temp_delta_sign set string storage large_number:math temp_delta 0 1
execute unless data storage large_number:math {temp_a:0.0} unless data storage large_number:math {temp_delta_sign:"-"} run function large_number:quadratic_equation_double/roots.2
#execute unless data storage large_number:math {temp_a:0.0} if data storage large_number:math {temp_delta:0.0} run function large_number:quadratic_equation_double/roots.1
execute unless data storage large_number:math {temp_a:0.0} if data storage large_number:math {temp_delta_sign:"-"} run function large_number:quadratic_equation_double/roots.0

execute if data storage large_number:math {temp_a:0.0} run function large_number:quadratic_equation_double/a_is_0

execute if data storage large_number:math quadratic_equation_double{tell:1} run function large_number:quadratic_equation_double/tellraw
