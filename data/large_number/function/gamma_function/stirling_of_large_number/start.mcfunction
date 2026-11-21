##利用斯特林级数计算大数阶乘

#function large_number:gamma_function/stirling_of_large_number/start

data modify storage large_number:math store_gamma_function_inp set from storage large_number:math gamma_function.input

#sqrt(x)
data remove storage large_number:math double_sqrt
data modify storage large_number:math double_sqrt.input set from storage large_number:math store_gamma_function_inp
scoreboard players set #New_double_sqrt.decimal_add large_number.int 1
function large_number:new_double_ope/double_sqrt

#sqrt(2πx)
data modify storage large_number:math float_multiply.input1 set from storage large_number:math double_sqrt.output
function large_number:gamma_function/stirling/mul_sqrt_2pi
data modify storage large_number:math temp_sqrt_2pix set from storage large_number:math float_multiply.output

#ln(x)
data modify storage large_number:math ln_high_precision.input set from storage large_number:math store_gamma_function_inp
function large_number:ln_high_precision/start

#ln(x)-1
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/stirling_of_large_number/as_entity_1

#x(ln(x)-1)
data modify storage large_number:math float_multiply.input2 set from storage large_number:math store_gamma_function_inp
function large_number:float_mul.high_precision/start

#x(ln(x)-1)/ln(10)
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
function large_number:gamma_function/decimal_digits/mul_1_ln10
data modify storage large_number:math temp_log_x_div_e_exp_x set from storage large_number:math float_multiply.output

#floor(x)
data modify storage large_number:math round_double.input set from storage large_number:math temp_log_x_div_e_exp_x
scoreboard players set #round_towards_zero large_number.int 0
function large_number:round_double/start

#x-floor_x
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/stirling_of_large_number/as_entity_2

#(x/e)^x的尾数部分
function large_number:gamma_function/stirling_of_large_number/mul_ln10
data modify storage large_number:math exp_e^x.input set from storage large_number:math float_multiply.output
function large_number:exp_e.x/start
data modify storage large_number:math temp_exp_a set from storage large_number:math exp_e^x.output

#(x/e)^x的指数部分
data modify storage large_number:math temp_exp_b set from storage large_number:math round_double.output

#级数展开

function large_number:gamma_function/stirling_of_large_number/macro2 with storage large_number:math
function large_number:division/float_reciprocal_8_dici/start
data modify storage large_number:math temp_stirling_series_times_2 set from storage large_number:math float_reciprocal.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_gamma_function_inp
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math temp_x^2 set from storage large_number:math float_multiply.output
function large_number:gamma_function/stirling_of_large_number/macro3 with storage large_number:math float_multiply
function large_number:division/float_reciprocal_8_dici/start
data modify storage large_number:math temp_stirling_series_times_3 set from storage large_number:math float_reciprocal.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_gamma_function_inp
function large_number:float_mul.high_precision/cube/start
function large_number:gamma_function/stirling_of_large_number/macro4 with storage large_number:math float_multiply
function large_number:gamma_function/stirling_of_large_number/float_reciprocal_8_dici
data modify storage large_number:math temp_stirling_series_times_4 set from storage large_number:math float_reciprocal.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_x^2
function large_number:float_mul.high_precision/squ/start
function large_number:gamma_function/stirling_of_large_number/macro5 with storage large_number:math float_multiply
function large_number:gamma_function/stirling_of_large_number/float_reciprocal_8_dici_2
data modify storage large_number:math temp_stirling_series_times_5 set from storage large_number:math float_reciprocal.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math store_gamma_function_inp
function large_number:float_mul.high_precision/start
function large_number:gamma_function/stirling_of_large_number/macro6 with storage large_number:math float_multiply
function large_number:gamma_function/stirling_of_large_number/float_reciprocal_8_dici_3
data modify storage large_number:math temp_stirling_series_times_6 set from storage large_number:math float_reciprocal.output

#级数的各项相加
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/stirling_of_large_number/as_entity_3


#三个部分相乘
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_sqrt_2pix
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_stirling_series
function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_exp_a
function large_number:float_mul.high_precision/start


execute store result score #gamma_function_input_inte_lan_expon large_number.int run data get storage large_number:math temp_exp_b 10
scoreboard players operation #temp2 large_number.int = #gamma_function_input_inte_lan_expon large_number.int
scoreboard players operation #temp2 large_number.int %= 10 const
scoreboard players operation #gamma_function_input_inte_lan_expon large_number.int /= 10 const
execute if score #temp2 large_number.int matches 5.. run scoreboard players add #gamma_function_input_inte_lan_expon large_number.int 1

#指数和底数拆开

execute store result score #temp2 large_number.int run data get storage large_number:math float_multiply.output
scoreboard players set #stempuu large_number.int 0
execute if score #temp2 large_number.int matches 10..99 run scoreboard players set #stempuu large_number.int 1
execute if score #temp2 large_number.int matches 100..999 run scoreboard players set #stempuu large_number.int 2
execute if score #temp2 large_number.int matches 1000..9999 run scoreboard players set #stempuu large_number.int 3
execute if score #temp2 large_number.int matches 10000..99999 run scoreboard players set #stempuu large_number.int 4
execute if score #temp2 large_number.int matches 100000..999999 run scoreboard players set #stempuu large_number.int 5
execute if score #temp2 large_number.int matches 1000000..9999999 run scoreboard players set #stempuu large_number.int 6
execute if score #temp2 large_number.int matches 10000000..99999999 run scoreboard players set #stempuu large_number.int 7
execute if score #temp2 large_number.int matches 100000000..999999999 run scoreboard players set #stempuu large_number.int 8

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
execute store result storage large_number:math gamma_function.output.expon int 1 run scoreboard players operation #gamma_function_input_inte_lan_expon large_number.int += #stempuu large_number.int
