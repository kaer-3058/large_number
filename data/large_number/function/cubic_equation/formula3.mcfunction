data modify storage large_number:math cubic_equation.roots set value 2

data modify storage large_number:math cubic_equation.output set value [0.0,0.0]

#X1

data modify storage large_number:math float_division.input1 set from storage large_number:math cubic_equation.B
data modify storage large_number:math float_division.input2 set from storage large_number:math cubic_equation.A
function large_number:division/float/start
data modify storage large_number:math temp_k set from storage large_number:math float_division.output

data modify storage large_number:math float_division.input1 set from storage large_number:math temp_b
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_a
function large_number:division/float/start

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_k
data modify storage large_number:math temp2 set from storage large_number:math float_division.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math cubic_equation.output[0] set from storage large_number:math temp1


#X2

data modify storage large_number:math float_division.input1 set from storage large_number:math temp_k
function large_number:cubic_equation/float_div_const
data modify storage large_number:math temp1 set from storage large_number:math float_division.output
function large_number:cubic_equation/macro4 with storage large_number:math
data modify storage large_number:math cubic_equation.output[1] set from storage large_number:math temp_tb2
