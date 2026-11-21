##浮点数的整数次幂 - 快速幂

#data modify storage large_number:math float_base_int_power.base set value 3.66
#data modify storage large_number:math float_base_int_power.expon set value 12

#function large_number:float_base_int_power/fast_power/start

#设置初值
scoreboard players operation #Store_temp_exp_out_so_large large_number.int = #temp_exp_out_so_large large_number.int
scoreboard players set #temp_exp_out_so_large large_number.int 0
execute store result score #float_base_int_power.expon large_number.int run data get storage large_number:math float_base_int_power.expon
data modify storage large_number:math float_base_int_power.output set from storage large_number:math float_base_int_power.base
data remove storage large_number:math temp_convert_deci
scoreboard players operation #temp_float_base_int_power_temp1 large_number.int = #float_base_int_power.expon large_number.int
execute if score #temp_float_base_int_power_temp1 large_number.int matches -2147483648 run scoreboard players set #temp_float_base_int_power_temp1 large_number.int 2147483647
execute if score #temp_float_base_int_power_temp1 large_number.int matches ..-1 run scoreboard players operation #temp_float_base_int_power_temp1 large_number.int *= -1 const
data modify storage large_number:math sstemp1 set from storage large_number:math float_base_int_power.base
data modify storage large_number:math temp_float_base_int_power_exp_sign set string storage large_number:math sstemp1 0 1
execute if data storage large_number:math {temp_float_base_int_power_exp_sign:"-"} run function large_number:float_base_int_power/macro1 with storage large_number:math

#分情况讨论
execute if score #temp_float_base_int_power_temp1 large_number.int matches 0 run data modify storage large_number:math float_base_int_power.output set value 1.0d
execute if score #temp_float_base_int_power_temp1 large_number.int matches 1 run data modify storage large_number:math float_base_int_power.output set from storage large_number:math float_base_int_power.base
execute if score #temp_float_base_int_power_temp1 large_number.int matches 2..3 run data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_base_int_power.base
execute if score #temp_float_base_int_power_temp1 large_number.int matches 2 run function large_number:float_mul.high_precision/squ/start
execute if score #temp_float_base_int_power_temp1 large_number.int matches 3 run function large_number:float_mul.high_precision/cube/start
execute if score #temp_float_base_int_power_temp1 large_number.int matches 2..3 run data modify storage large_number:math float_base_int_power.output set from storage large_number:math float_multiply.output

#进入快速幂算法
execute if score #temp_float_base_int_power_temp1 large_number.int matches 4.. run function large_number:float_base_int_power/fast_power/2
execute if data storage large_number:math temp_convert_deci run data modify storage large_number:math float_base_int_power.output set from storage large_number:math temp_convert_deci[0]

#如果指数为负则取倒数
execute store result score #float_base_int_power.base large_number.int run data get storage large_number:math float_base_int_power.base
execute if score #float_base_int_power.expon large_number.int matches ..-1 unless score #float_base_int_power.base large_number.int matches 0 run function large_number:float_base_int_power/input.is-

#对负底数设置符号
scoreboard players operation #temp1 large_number.int = #float_base_int_power.expon large_number.int
scoreboard players operation #temp1 large_number.int %= 2 const
execute if data storage large_number:math {temp_float_base_int_power_exp_sign:"-"} if score #temp1 large_number.int matches 1 run function large_number:float_base_int_power/macro2 with storage large_number:math float_base_int_power
execute if data storage large_number:math {temp_float_base_int_power_exp_sign:"-"} if score #temp1 large_number.int matches 1 run data modify storage large_number:math float_base_int_power.output set from storage large_number:math q0

#报错机制
data modify storage large_number:math temp2 set from storage large_number:math float_base_int_power.output
execute if data storage large_number:math {temp2:"Infinityd"} run data modify storage large_number:math float_base_int_power.output set value 1.797693134862315807E308d
execute if data storage large_number:math {temp2:"Infinityd"} run scoreboard players set #temp_exp_out_so_large large_number.int 1
execute if data storage large_number:math {temp2:"-Infinityd"} run data modify storage large_number:math float_base_int_power.output set value -1.797693134862315807E308d
execute if data storage large_number:math {temp2:"-Infinityd"} run scoreboard players set #temp_exp_out_so_large large_number.int 1
execute if data storage large_number:math {temp2:"NaNd"} run data modify storage large_number:math float_base_int_power.output set value 0.0d
execute if data storage large_number:math {temp2:"-NaNd"} run data modify storage large_number:math float_base_int_power.output set value 0.0d
execute if score #temp_exp_out_so_large large_number.int matches 1 run data modify storage large_number:math float_base_int_power.output set value 1.797693134862315807E308d

execute unless score #temp_exp_out_so_large large_number.int matches 1 run scoreboard players operation #temp_exp_out_so_large large_number.int = #Store_temp_exp_out_so_large large_number.int
