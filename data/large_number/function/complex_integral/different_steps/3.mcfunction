
#求和1
data modify storage large_number:math list_sum.input set from storage large_number:math temp1_sum_inp_1
function large_number:complex_integral/list_sum_of_c/start
data modify storage large_number:math temp_ss3 set value {x:0d,i:0d}
function large_number:complex_integral/macro5 with storage large_number:math list_sum.output
#tellraw @a {"nbt":"list_sum.output","storage": "large_number:math"}

#求和2
data modify storage large_number:math list_sum.input set from storage large_number:math temp1_sum_inp_2
function large_number:complex_integral/list_sum_of_c/start
data modify storage large_number:math temp_ss4 set value {x:0d,i:0d}
function large_number:complex_integral/macro6 with storage large_number:math list_sum.output
#tellraw @a {"nbt":"list_sum.output","storage": "large_number:math"}

#f(a)
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp_int_a

#解析逆波兰式 - 复函数
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
scoreboard players set #temp_expression_evaluation_error large_number.int -1
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expre_evalu_sci_complex/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
scoreboard players set #temp1 large_number.int 0
function large_number:expre_evalu_sci_complex/macro4.output with storage large_number:math
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math expression_evaluation.output set from storage large_number:math temp1

data modify storage large_number:math temp_ss2 set from storage large_number:math expression_evaluation.output

#f(b)
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math expression_evaluation.definite_integral.b

#解析逆波兰式 - 复函数
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
scoreboard players set #temp_expression_evaluation_error large_number.int -1
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expre_evalu_sci_complex/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
scoreboard players set #temp1 large_number.int 0
function large_number:expre_evalu_sci_complex/macro4.output with storage large_number:math
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math expression_evaluation.output set from storage large_number:math temp1

data modify storage large_number:math complex_operation.z1 set from storage large_number:math expression_evaluation.output

#加法
data modify storage large_number:math complex_operation.z2 set from storage large_number:math temp_ss2
function large_number:complex_operation/addition_direct

#加法
data modify storage large_number:math complex_operation.z1 set from storage large_number:math complex_operation.output
data modify storage large_number:math complex_operation.z2 set from storage large_number:math temp_ss3
function large_number:complex_operation/addition_direct

#加法
data modify storage large_number:math complex_operation.z1 set from storage large_number:math complex_operation.output
data modify storage large_number:math complex_operation.z2 set from storage large_number:math temp_ss4
function large_number:complex_operation/addition_direct

#乘法
data modify storage large_number:math complex_operation.z1 set from storage large_number:math complex_operation.output
data modify storage large_number:math complex_operation.z2 set from storage large_number:math temp_h_div_6
function large_number:complex_operation/mul_high_precision

data modify storage large_number:math expression_evaluation.definite_integral.output set from storage large_number:math complex_operation.output


execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate":"large_number.definite_integral.end","fallback": "\u00A77\u00A7o定积分求解完成"}
scoreboard players set #complex_integral_method1_info large_number.int 4
