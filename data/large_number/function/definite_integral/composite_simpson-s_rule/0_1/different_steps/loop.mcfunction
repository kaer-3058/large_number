#循环

#第一个求和
scoreboard players operation #int_+decimal.input1 large_number.int = #int.k large_number.int
function large_number:division/int_8decimal/start

#解析逆波兰式 - 实函数
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math int_more_decimal_out
function large_number:definite_integral/int_expression_ope
data modify storage large_number:math temp1_sum_inp_1 append from storage large_number:math expression_evaluation.output

#第二个求和
scoreboard players operation #int_+decimal.input1 large_number.int *= 10 const
scoreboard players add #int_+decimal.input1 large_number.int 5
function large_number:definite_integral/composite_simpson-s_rule/0_1/int_8decimal_spe_div

#解析逆波兰式 - 实函数
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math int_more_decimal_out
function large_number:definite_integral/int_expression_ope
data modify storage large_number:math temp1_sum_inp_2 append from storage large_number:math expression_evaluation.output


#循环
scoreboard players add #int.k large_number.int 1
scoreboard players remove #loops large_number.int 1
scoreboard players add #temp_int.composite_simpson-s_rule_diff.loop1 large_number.int 1
execute if score #loops large_number.int matches 1.. if score #temp_int.composite_simpson-s_rule_diff.loop1 large_number.int < #definite_integral.loops large_number.int run function large_number:definite_integral/composite_simpson-s_rule/0_1/different_steps/loop
