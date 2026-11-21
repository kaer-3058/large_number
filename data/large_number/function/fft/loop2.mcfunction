#若计算次数达到了n的一半，那么就视为完成了这一组计算，进入到下一组
execute if score #temp_dft.loops_2 large_number.int >= #temp_dft.span large_number.int run function large_number:fft/next_team
execute unless data storage large_number:math temp_order_2[1] run return fail

#取序号
data modify storage large_number:math temp_order_a set from storage large_number:math temp_order_2[0]
execute store result storage large_number:math temp_order_b int 1 run function large_number:fft/macro2 with storage large_number:math

#根据序号取数字
function large_number:fft/macro4 with storage large_number:math

#把输入值转化为标准格式的复数
data modify storage large_number:math temp_complex_ope_z1 set value {x:0d,i:0d}
data modify storage large_number:math temp_complex_ope_z2 set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_complex_ope_z1 merge from storage large_number:math temp_A
execute store success score #temp2 large_number.int run data modify storage large_number:math temp_complex_ope_z2 merge from storage large_number:math temp_B
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z1.x set from storage large_number:math temp_A
execute if score #temp2 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z2.x set from storage large_number:math temp_B

#旋转因子，三角函数
scoreboard players set #int_+decimal.input1 large_number.int 360
scoreboard players operation #int_+decimal.input1 large_number.int *= #temp_dft.k large_number.int
scoreboard players operation #int_+decimal.input2 large_number.int = #temp_dft.n large_number.int
function large_number:fft/int_8decimal_div
data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math q0
function large_number:math_trifs/sin_cos_high_precision/start

#指数符号
execute if score #temp_dft_inverse large_number.int matches 1 run scoreboard players operation #sin_high_precision large_number.int *= -1 const

#复数乘法，复数乘旋转因子

data modify storage large_number:math temp_a set from storage large_number:math temp_complex_ope_z2.x
data modify storage large_number:math temp_b set from storage large_number:math temp_complex_ope_z2.i
execute store result storage large_number:math temp_c int 1 run scoreboard players get #cos_high_precision large_number.int
execute store result storage large_number:math temp_d int 1 run scoreboard players get #sin_high_precision large_number.int
execute store result storage large_number:math temp_d2 int -1 run scoreboard players get #sin_high_precision large_number.int
function large_number:fft/macro5 with storage large_number:math
function large_number:fft/macro6 with storage large_number:math
function large_number:fft/macro7 with storage large_number:math
function large_number:fft/macro8 with storage large_number:math

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp_ac 0 -1
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
data modify storage large_number:math temp_ac set from storage large_number:math sstemp06

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp_bd 0 -1
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
data modify storage large_number:math temp_bd set from storage large_number:math sstemp06

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp_bc 0 -1
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
data modify storage large_number:math temp_bc set from storage large_number:math sstemp06

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp_ad 0 -1
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
data modify storage large_number:math temp_ad set from storage large_number:math sstemp06

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_ac
data modify storage large_number:math temp2 set from storage large_number:math temp_bd
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

data modify storage large_number:math temp_complex_ope_z2.x set from storage large_number:math temp1

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_bc
data modify storage large_number:math temp2 set from storage large_number:math temp_ad
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

data modify storage large_number:math temp_complex_ope_z2.i set from storage large_number:math temp1

#两点fft
data modify storage large_number:math complex_operation.z1 set from storage large_number:math temp_complex_ope_z1
data modify storage large_number:math complex_operation.z2 set from storage large_number:math temp_complex_ope_z2
function large_number:complex_operation/addition_direct
data modify storage large_number:math temp_A set from storage large_number:math complex_operation.output
function large_number:complex_operation/subtraction_direct
data modify storage large_number:math temp_B set from storage large_number:math complex_operation.output

#根据序号存数字
function large_number:fft/macro9 with storage large_number:math


scoreboard players add #temp_dft.k large_number.int 1
scoreboard players operation #temp_dft.k large_number.int %= #temp_dft.span large_number.int
scoreboard players add #temp_dft.loops_2 large_number.int 1

data remove storage large_number:math temp_order_2[0]
execute if data storage large_number:math temp_order_2[1] run function large_number:fft/loop2
