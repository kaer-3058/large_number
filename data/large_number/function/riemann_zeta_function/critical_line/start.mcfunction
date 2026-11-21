##黎曼zeta函数在临界线上的值

#参阅：https://www.zhihu.com/question/577312204/answer/1967585898469267079

#data modify storage large_number:math riemann_zeta_critical_line.input set value 11.6

#function large_number:riemann_zeta_function/critical_line/start

#data get storage large_number:math riemann_zeta_critical_line.output

data modify storage large_number:math riemann_zeta_critical_line.output set value {x:0d,i:0d}

##Z函数

#对输入值取绝对值并标记负数
data modify storage large_number:math riemann_zeta_critical_line_inp set from storage large_number:math riemann_zeta_critical_line.input
scoreboard players set #temp_riemann_zeta_critical_line_inp_is- large_number.int 0
data modify storage large_number:math stemp1 set string storage large_number:math riemann_zeta_critical_line_inp 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:riemann_zeta_function/critical_line/macro2 with storage large_number:math

#相位函数
data modify storage large_number:math phase_function_inp set from storage large_number:math riemann_zeta_critical_line_inp
function large_number:riemann_zeta_function/critical_line/phase_function

#M
data modify storage large_number:math double_sqrt.input set from storage large_number:math riemann_zeta_critical_line_inp
scoreboard players set #New_double_sqrt.decimal_add large_number.int 1
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math float_multiply.input1 set from storage large_number:math double_sqrt.output
function large_number:riemann_zeta_function/critical_line/mul_1_sqrt_2pi
data modify storage large_number:math round_double.input set from storage large_number:math float_multiply.output
scoreboard players set #round_towards_zero large_number.int 1
function large_number:round_double/start
data modify storage large_number:math temp_zeta_critical_line_m set from storage large_number:math round_double.output
execute store result score #temp_zeta_critical_line_m large_number.int run data get storage large_number:math temp_zeta_critical_line_m

#p
#浮点减法-
data modify storage large_number:math temp1 set from storage large_number:math float_multiply.output
data modify storage large_number:math temp2 set from storage large_number:math temp_zeta_critical_line_m
function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math temp_zeta_critical_line_p set from storage large_number:math temp1
execute store result score #temp_zeta_critical_line_p large_number.int run data get storage large_number:math temp_zeta_critical_line_p 1000000000

#C0

execute store result storage large_number:math temp1 int 1 run scoreboard players get #temp_zeta_critical_line_p large_number.int
function large_number:riemann_zeta_function/critical_line/macro3 with storage large_number:math

execute store result score #temp1 large_number.int run data get storage large_number:math temp1 .000000001
scoreboard players operation #temp1 large_number.int -= #temp_zeta_critical_line_p large_number.int

execute store result storage large_number:math temp1 double 6.2831853071795864769252867 run scoreboard players remove #temp1 large_number.int 62500000

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math sstemp06
function large_number:math_trifs/sin_cos_high_precision/large_range_start
data modify storage large_number:math float_division.input1 set from storage large_number:math sin_cos_high_precision.cos

execute store result storage large_number:math temp1 double 6.2831853071795864769252867 run scoreboard players get #temp_zeta_critical_line_p large_number.int

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math sstemp06
function large_number:math_trifs/sin_cos_high_precision/large_range_start
data modify storage large_number:math float_division.input2 set from storage large_number:math sin_cos_high_precision.cos
function large_number:division/float/start
data modify storage large_number:math temp_zeta_critical_line_c0 set from storage large_number:math float_division.output

#准备工作

scoreboard players operation #temp_zeta_critical_line_s_p large_number.int = #temp_zeta_critical_line_p large_number.int
scoreboard players remove #temp_zeta_critical_line_s_p large_number.int 500000000

execute store result storage large_number:math float_multiply.input1 double .000000001 run scoreboard players get #temp_zeta_critical_line_s_p large_number.int
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math temp_zeta_critical_line_s_p_2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_zeta_critical_line_s_p_2
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math temp_zeta_critical_line_s_p_4 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_zeta_critical_line_s_p_4
execute store result storage large_number:math float_multiply.input2 double .000000001 run scoreboard players get #temp_zeta_critical_line_s_p large_number.int
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_zeta_critical_line_s_p_5 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_zeta_critical_line_s_p_2
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_zeta_critical_line_s_p_5
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_zeta_critical_line_s_p_7 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp_zeta_critical_line_s_p_7 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:riemann_zeta_function/critical_line/macro4 with storage large_number:math

#C1

function large_number:riemann_zeta_function/critical_line/macro5 with storage large_number:math

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players add #_exp large_number.int 7
function large_number:gamma_function/stirling/macro1 with storage large_number:math

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstemp06
execute store result storage large_number:math temp2 double .0485 run scoreboard players get #temp_zeta_critical_line_s_p large_number.int
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math temp_zeta_critical_line_c1 set from storage large_number:math sstemp06

#C2

function large_number:riemann_zeta_function/critical_line/macro6 with storage large_number:math

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 3
function large_number:gamma_function/stirling/macro1 with storage large_number:math
data modify storage large_number:math store1_sstemp06 set from storage large_number:math sstemp06

function large_number:riemann_zeta_function/critical_line/macro7 with storage large_number:math

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 2
function large_number:gamma_function/stirling/macro1 with storage large_number:math
data modify storage large_number:math temp1 set from storage large_number:math sstemp06

#浮点减法
data modify storage large_number:math temp2 set from storage large_number:math store1_sstemp06
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:riemann_zeta_function/critical_line/as_entity_3

#余项 R

data modify storage large_number:math float_multiply.input1 set from storage large_number:math riemann_zeta_critical_line_inp
function large_number:riemann_zeta_function/critical_line/mul_1_2pi

data modify storage large_number:math float_division.input1 set from storage large_number:math temp_zeta_critical_line_c2
data modify storage large_number:math float_division.input2 set from storage large_number:math float_multiply.output
function large_number:division/float/start
data modify storage large_number:math temp_zeta_critical_line_c2 set from storage large_number:math float_division.output

data modify storage large_number:math double_sqrt.input set from storage large_number:math float_multiply.output
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math float_division.input2 set from storage large_number:math double_sqrt.output
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_zeta_critical_line_c1
function large_number:division/float/start
data modify storage large_number:math temp_zeta_critical_line_c1 set from storage large_number:math float_division.output

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_zeta_critical_line_c0
data modify storage large_number:math temp2 set from storage large_number:math temp_zeta_critical_line_c1
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

#浮点加法
data modify storage large_number:math temp2 set from storage large_number:math temp_zeta_critical_line_c2
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

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1

data modify storage large_number:math double_sqrt.input set from storage large_number:math double_sqrt.output
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math float_division.input2 set from storage large_number:math double_sqrt.output
function large_number:division/float/start
data modify storage large_number:math temp_zeta_critical_line_r set from storage large_number:math float_division.output

scoreboard players operation #temp1 large_number.int = #temp_zeta_critical_line_m large_number.int
scoreboard players remove #temp1 large_number.int 1
scoreboard players operation #temp1 large_number.int %= 2 const
execute if score #temp1 large_number.int matches 1 run function large_number:riemann_zeta_function/critical_line/macro8 with storage large_number:math

#求和项

data modify storage large_number:math temp_zeta_critical_line_sum set value 0.0
data modify storage large_number:math list_sum_inp set value []
scoreboard players set #temp_sum_n large_number.int 1
execute if score #temp_zeta_critical_line_m large_number.int matches 1.. run function large_number:riemann_zeta_function/critical_line/loop1

data modify storage large_number:math list_sum.input set from storage large_number:math list_sum_inp
execute if data storage large_number:math list_sum_inp[0] run function large_number:list_operation/sum/start
execute if data storage large_number:math list_sum_inp[0] run data modify storage large_number:math temp_zeta_critical_line_sum set from storage large_number:math list_sum.output

#最终的Z函数值

function large_number:riemann_zeta_function/critical_line/macro9 with storage large_number:math

#浮点加法
data modify storage large_number:math temp2 set from storage large_number:math temp_zeta_critical_line_r
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

data modify storage large_number:math temp_zeta_critical_line_z set from storage large_number:math temp1

#乘e^(-iu) u=相位函数

data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math phase_function_out
function large_number:math_trifs/sin_cos_high_precision/large_range_start
execute store result storage large_number:math temp1 int 1 run scoreboard players get #cos_high_precision large_number.int
function large_number:riemann_zeta_function/critical_line/macro10 with storage large_number:math

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math riemann_zeta_critical_line.output.x set from storage large_number:math sstemp06

execute if score #temp_riemann_zeta_critical_line_inp_is- large_number.int matches 1 run scoreboard players operation #sin_high_precision large_number.int *= -1 const
execute store result storage large_number:math temp1 int -1 run scoreboard players get #sin_high_precision large_number.int
function large_number:riemann_zeta_function/critical_line/macro10 with storage large_number:math

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math riemann_zeta_critical_line.output.i set from storage large_number:math sstemp06
