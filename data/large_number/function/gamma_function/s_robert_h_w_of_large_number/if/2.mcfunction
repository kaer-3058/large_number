##伽玛函数 - Robert H. Windschitl 方法
#输入范围为区间：(-1, 170.6271]

#data modify storage large_number:math gamma_function.input set value 73.2074d

#使用校正项：scoreboard players set #gamma_function.robert_h.correct large_number.int 1

#2π/x
function large_number:gamma_function/s_robert_h_w_of_large_number/float_reciprocal

#sqrt(2π/x)
data remove storage large_number:math double_sqrt
data modify storage large_number:math double_sqrt.input set from storage large_number:math float_reciprocal.output
scoreboard players set #New_double_sqrt.decimal_add large_number.int 1
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math temp_sqrt2π/x set from storage large_number:math double_sqrt.output

#1/x
data modify storage large_number:math float_reciprocal.input set from storage large_number:math stemp_gamma_function_inp
function large_number:division/float_reciprocal_8_dici/start

#sinh(1/x)
data modify storage large_number:math hyperbolic_function.input set from storage large_number:math float_reciprocal.output
function large_number:hyperbolic_function/sinh

#x*sinh(1/x)
data modify storage large_number:math float_multiply.input2 set from storage large_number:math hyperbolic_function.output
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_x_sinh1/x set from storage large_number:math float_multiply.output

#校正项
data modify storage large_number:math temp1 set from storage large_number:math temp_x_sinh1/x
execute if score #gamma_function.robert_h.correct large_number.int matches 1 run function large_number:gamma_function/s_robert_h_w_of_large_number/correct

#sqrt(x)
data modify storage large_number:math double_sqrt.input set from storage large_number:math temp1
scoreboard players set #New_double_sqrt.decimal_add large_number.int 1
function large_number:new_double_ope/double_sqrt

#x/e
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp
function large_number:gamma_function/robert_h_windschitl/mul_1_euler_e

data modify storage large_number:math float_multiply.input1 set from storage large_number:math double_sqrt.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.output
function large_number:float_mul.high_precision/start

#^x
#data modify storage large_number:math exp_any.input.base set from storage large_number:math float_multiply.output
#data modify storage large_number:math exp_any.input.expon set from storage large_number:math stemp_gamma_function_inp
#function large_number:exp_any/start
#data modify storage large_number:math float_multiply.input1 set from storage large_number:math exp_any.output
data modify storage large_number:math ln_high_precision.input set from storage large_number:math float_multiply.output
function large_number:ln_high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_gamma_function_inp
function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
function large_number:gamma_function/decimal_digits/mul_1_ln10
data modify storage large_number:math round_double.input set from storage large_number:math float_multiply.output
function large_number:round_double/start

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math round_double.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp1
function large_number:gamma_function/stirling_of_large_number/mul_ln10
data modify storage large_number:math exp_e^x.input set from storage large_number:math float_multiply.output
function large_number:exp_e.x/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math exp_e^x.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_sqrt2π/x
function large_number:float_mul.high_precision/start

#拆出科学记数法的指数和底数

execute store result score #temp2 large_number.int run data get storage large_number:math float_multiply.output
scoreboard players set #stempuu large_number.int -1
execute if score #temp2 large_number.int matches 10..99 run scoreboard players set #stempuu large_number.int 0
execute if score #temp2 large_number.int matches 100..999 run scoreboard players set #stempuu large_number.int 1
execute if score #temp2 large_number.int matches 1000..9999 run scoreboard players set #stempuu large_number.int 2
execute if score #temp2 large_number.int matches 10000..99999 run scoreboard players set #stempuu large_number.int 3
execute if score #temp2 large_number.int matches 100000..999999 run scoreboard players set #stempuu large_number.int 4
execute if score #temp2 large_number.int matches 1000000..9999999 run scoreboard players set #stempuu large_number.int 5
execute if score #temp2 large_number.int matches 10000000..99999999 run scoreboard players set #stempuu large_number.int 6
execute if score #temp2 large_number.int matches 100000000..999999999 run scoreboard players set #stempuu large_number.int 7
execute if score #temp2 large_number.int matches 0 store result score #temp2 large_number.int run data get storage large_number:math float_multiply.output 10
execute if score #temp2 large_number.int matches 0 run scoreboard players remove #stempuu large_number.int 1
execute if score #temp2 large_number.int matches 0 store result score #temp2 large_number.int run data get storage large_number:math float_multiply.output 100
execute if score #temp2 large_number.int matches 0 run scoreboard players remove #stempuu large_number.int 1
execute if score #temp2 large_number.int matches 0 store result score #temp2 large_number.int run data get storage large_number:math float_multiply.output 1000
execute if score #temp2 large_number.int matches 0 run scoreboard players remove #stempuu large_number.int 1

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math float_multiply.output 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp large_number.int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players operation #_exp large_number.int -= #stempuu large_number.int
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math gamma_function.output.mantissa set from storage large_number:math sstemp06
execute store result storage large_number:math gamma_function.output.expon int 1 run scoreboard players operation #round_double.output large_number.int += #stempuu large_number.int
