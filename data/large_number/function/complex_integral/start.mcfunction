##定积分 - 复化辛普森求积公式 - 复函数在实区间上的积分

#只能求一重积分，被积函数必须"黎曼可积"，求出来的结果只能是个数（无法处理含参结果），取积分变量为ｘ
#前置算法："表达式求值 - 科学计算"

#积分区域 下限：data modify storage large_number:math expression_evaluation.definite_integral.a set value 2.0
#积分区域 上限：data modify storage large_number:math expression_evaluation.definite_integral.b set value 3.0
#分割区间的份数：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 300
#取正整数，上限是99999999，不宜太多
#被积函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式
#输出：storage large_number:math expression_evaluation.definite_integral.output

#function large_number:complex_integral/start

#tellraw @a ["∫[",{"nbt":"expression_evaluation.definite_integral.a","storage":"large_number:math"},", ",{"nbt":"expression_evaluation.definite_integral.b","storage":"large_number:math"},"](",{"nbt":"expression_evaluation.input","storage":"large_number:math"},")dｘ≈",{"nbt":"expression_evaluation.definite_integral.output","storage":"large_number:math"}]

execute store result score #complex_integral_method1.n large_number.int run data get storage large_number:math expression_evaluation.definite_integral.dx_times
scoreboard players operation #Divisor_float_int0 large_number.int = #complex_integral_method1.n large_number.int
scoreboard players remove #complex_integral_method1.n large_number.int 1

data modify storage large_number:math temp_int_a set from storage large_number:math expression_evaluation.definite_integral.a

#h

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.definite_integral.b
data modify storage large_number:math temp2 set from storage large_number:math temp_int_a
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

#float除以int
function large_number:complex_integral/float_div_int
data modify storage large_number:math sstemp_a_b_divx set from storage large_number:math q1
#tellraw @a {"nbt":"sstemp_a_b_divx","storage": "large_number:math"}

#x_{0+1/2}

#double/2  h/2

function large_number:complex_integral/macro1 with storage large_number:math

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp large_number.int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 1
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math temp_h_div_2 set from storage large_number:math sstemp06

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math sstemp06
data modify storage large_number:math temp2 set from storage large_number:math temp_int_a
execute store result score #temp_test.float_add_sub_a2 large_number.int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 large_number.int run data get storage large_number:math temp2
scoreboard players operation #temp_test.float_add_sub_a large_number.int = #temp_test.float_add_sub_a2 large_number.int
scoreboard players operation #temp_test.float_add_sub_b large_number.int = #temp_test.float_add_sub_b2 large_number.int
execute if score #temp_test.float_add_sub_a large_number.int matches ..-1 store result score #temp_test.float_add_sub_a large_number.int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b large_number.int matches ..-1 store result score #temp_test.float_add_sub_b large_number.int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 0
execute if score #temp_test.float_add_sub_a large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
execute if score #temp_test.float_add_sub_b large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
scoreboard players operation #temp_test.float_add_sub_a2 large_number.int += #temp_test.float_add_sub_b2 large_number.int
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 0 if score #temp_test.float_add_sub_a large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.5 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 1 run function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 1 as @e[type=minecraft:item,distance=.0..] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

#f(x_{0+1/2})

data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp1

#解析逆波兰式 - 复函数
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
scoreboard players set #temp_expression_evaluation_error large_number.int -1
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expre_evalu_sci_complex/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
scoreboard players set #temp1 large_number.int 0
function large_number:expre_evalu_sci_complex/macro4.output with storage large_number:math
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math expression_evaluation.output set from storage large_number:math temp1

data modify storage large_number:math stemp09 set from storage large_number:math expression_evaluation.output

data modify storage large_number:math temp1_sum_inp_1 set value []
data modify storage large_number:math temp1_sum_inp_2 set value []
data modify storage large_number:math temp1_sum_inp_2 append from storage large_number:math stemp09

#循环
scoreboard players set #complex_integral_method1.loop1 large_number.int 1
execute if score #complex_integral_method1.loop1 large_number.int <= #complex_integral_method1.n large_number.int run function large_number:complex_integral/loop1

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
