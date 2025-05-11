#单次迭代

#f(x0) 解析逆波兰式
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math newton.s_method.output
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:expression_evaluation_scientific/macro4.output with storage large_number:math
data modify storage large_number:math temp_fx set from storage large_number:math expression_evaluation.output

#f'(x0)
data modify storage large_number:math expression_evaluation.differential.input set from storage large_number:math newton.s_method.output
function large_number:differential/difference_quotient_method/1/start

#f(x0)/f'(x0)
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_fx
data modify storage large_number:math float_division.input2 set from storage large_number:math expression_evaluation.differential.1output
function large_number:division/float/start

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math newton.s_method.output
data modify storage large_number:math temp2 set from storage large_number:math float_division.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math newton.s_method.output set from storage large_number:math temp1
