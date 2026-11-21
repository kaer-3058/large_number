##复变函数 - 反三角函数 - arcsin 和 arccos

#data modify storage large_number:math arcsin_cos_high_precision.input set value {x:0.1,i:-2.0}

#function large_number:elem_complex_function/arcsin_arccos/start

data modify storage large_number:math store_arcsin_cos_inp set from storage large_number:math arcsin_cos_high_precision.input

#把输入值转化为标准格式的复数
data modify storage large_number:math temp_arcsin_inp set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_arcsin_inp merge from storage large_number:math arcsin_cos_high_precision.input
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_arcsin_inp.x set from storage large_number:math arcsin_cos_high_precision.input

#c
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_arcsin_inp.x
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_arcsin_inp.x
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_a2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_arcsin_inp.i
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_arcsin_inp.i
function large_number:float_multiply/of_score/start

#浮点减法
data modify storage large_number:math temp1 set value 1d
data modify storage large_number:math temp2 set from storage large_number:math stemp_a2
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

#浮点加法
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
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

data modify storage large_number:math temp_arcinp_c set from storage large_number:math temp1

#d
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_arcsin_inp.x
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_arcsin_inp.i
function large_number:float_multiply/of_score/start
function large_number:elem_complex_function/arcsin_arccos/macro1 with storage large_number:math float_multiply

#p
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_arcinp_c
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_arcinp_c
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_c2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_arcinp_d
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_arcinp_d
function large_number:float_multiply/of_score/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math stemp_c2
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
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

data modify storage large_number:math double_sqrt.input set from storage large_number:math temp1
scoreboard players set #New_double_sqrt.decimal_add large_number.int 1
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math temp_sqrt_in_p set from storage large_number:math double_sqrt.output

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_sqrt_in_p
data modify storage large_number:math temp2 set from storage large_number:math temp_arcinp_c
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

function large_number:hyperbolic_function/macro1 with storage large_number:math

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

data modify storage large_number:math double_sqrt.input set from storage large_number:math sstemp06
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math temp_arcinp_p set from storage large_number:math double_sqrt.output

#q

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_sqrt_in_p
data modify storage large_number:math temp2 set from storage large_number:math temp_arcinp_c
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

function large_number:hyperbolic_function/macro1 with storage large_number:math

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

data modify storage large_number:math double_sqrt.input set from storage large_number:math sstemp06
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math temp_arcinp_q set from storage large_number:math double_sqrt.output

data modify storage large_number:math stemp1 set string storage large_number:math temp_arcinp_d 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:elem_complex_function/arcsin_arccos/macro2 with storage large_number:math

#q+a
#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_arcinp_q
data modify storage large_number:math temp2 set from storage large_number:math temp_arcsin_inp.x
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

data modify storage large_number:math temp_arcinp_q set from storage large_number:math temp1

#p-b
#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_arcinp_p
data modify storage large_number:math temp2 set from storage large_number:math temp_arcsin_inp.i
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math temp_arcinp_p set from storage large_number:math temp1

data modify storage large_number:math temp_arcsin_out set value {x:0d,i:0d}
data modify storage large_number:math arcsin_cos_high_precision.output set value {arcsin:{x:0d,i:0d},arccos:{x:0d,i:0d}}

#实部
data modify storage large_number:math atan2_double.y set from storage large_number:math temp_arcinp_q
data modify storage large_number:math atan2_double.x set from storage large_number:math temp_arcinp_p
execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/atan2_double/start

execute store result storage large_number:math temp1 double 1745329.25199432957692369 run data get storage large_number:math atan2_double.output 1000000

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 14
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math temp_arcsin_out.x set from storage large_number:math sstemp06

#虚部

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_arcinp_q
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_arcinp_q
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_q2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_arcinp_p
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_arcinp_p
function large_number:float_multiply/of_score/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math stemp_q2
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
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

data modify storage large_number:math ln_high_precision.input set from storage large_number:math temp1
function large_number:ln_high_precision/start

function large_number:elem_complex_function/arcsin_arccos/macro3 with storage large_number:math ln_high_precision

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

data modify storage large_number:math temp_arcsin_out.i set from storage large_number:math sstemp06

#输出
data modify storage large_number:math arcsin_cos_high_precision.input set from storage large_number:math store_arcsin_cos_inp
data modify storage large_number:math arcsin_cos_high_precision.output.arcsin set from storage large_number:math temp_arcsin_out

#arccos

#虚部
function large_number:elem_complex_function/arcsin_arccos/macro4 with storage large_number:math temp_arcsin_out

#实部

#浮点减法
data modify storage large_number:math temp1 set value 1.57079632679489661923
data modify storage large_number:math temp2 set from storage large_number:math temp_arcsin_out.x
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math temp_arcsin_out.x set from storage large_number:math temp1

data modify storage large_number:math arcsin_cos_high_precision.output.arccos set from storage large_number:math temp_arcsin_out
