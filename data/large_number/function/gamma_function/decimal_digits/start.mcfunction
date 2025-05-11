##用斯特林公式估计阶乘的位数

#输入：data modify storage large_number:math factorial_decimal_digits.input set value 1730220.77
#输入范围：x>1

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math factorial_decimal_digits.input
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute store success score #temp_test.float_add_sub.number_is_large int if score #temp_test.float_add_sub_a int matches 20000000..
scoreboard players add #temp_test.float_add_sub_a2 int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/decimal_digits/macro1 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:gamma_function/decimal_digits/macro2 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math temp_x_add__5 set from storage large_number:math temp1

#ln(x)
data modify storage large_number:math ln_high_precision.input set from storage large_number:math factorial_decimal_digits.input
function large_number:ln_high_precision/start

#乘法
data modify storage large_number:math float_multiply.input1 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_x_add__5
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_front set from storage large_number:math float_multiply.output

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_front
data modify storage large_number:math temp2 set from storage large_number:math factorial_decimal_digits.input
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

#浮点加法
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute store success score #temp_test.float_add_sub.number_is_large int if score #temp_test.float_add_sub_a int matches 20000000..
scoreboard players add #temp_test.float_add_sub_a2 int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/decimal_digits/macro4 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:gamma_function/decimal_digits/macro5 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp1
function large_number:gamma_function/decimal_digits/mul_with_const_1


##对浮点数向下取整

data modify storage large_number:math round_double.input set from storage large_number:math float_multiply.output

data modify storage large_number:math temp1 set string storage large_number:math round_double.input 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math

execute if score #_exp int matches 17.. run data modify storage large_number:math round_double.output set from storage large_number:math round_double.input
execute if score #_exp int matches ..-17 run data modify storage large_number:math round_double.output set value 0.0
execute if score #_exp int matches -16..16 run function large_number:gamma_function/decimal_digits/round_double_1
