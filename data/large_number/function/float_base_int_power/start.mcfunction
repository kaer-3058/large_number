##浮点数的整数次幂 (输入值可以为负)

#data modify storage large_number:math float_base_int_power.base set value 3.66
#data modify storage large_number:math float_base_int_power.expon set value 12

execute store result score #float_base_int_power.expon int run data get storage large_number:math float_base_int_power.expon
scoreboard players operation #temp_float_base_int_power_temp1 int = #float_base_int_power.expon int
execute if score #temp_float_base_int_power_temp1 int matches ..-1 run scoreboard players operation #temp_float_base_int_power_temp1 int *= -1 const
data modify storage large_number:math sstemp1 set from storage large_number:math float_base_int_power.base
data modify storage large_number:math temp1 set string storage large_number:math sstemp1 0 1
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math sstemp1 set string storage large_number:math sstemp1 1 -1
execute if data storage large_number:math {temp1:"-"} run function large_number:float_base_int_power/macro1 with storage large_number:math
data modify storage large_number:math temp_float_base_int_power_mul_2 set from storage large_number:math sstemp1
execute if score #temp_float_base_int_power_temp1 int matches 2.. run function large_number:float_base_int_power/loop
data modify storage large_number:math float_base_int_power.output set from storage large_number:math sstemp1

execute if score #float_base_int_power.expon int matches 0 run data modify storage large_number:math float_base_int_power.output set value 1.0d
execute if score #float_base_int_power.expon int matches 1 run data modify storage large_number:math float_base_int_power.output set from storage large_number:math float_base_int_power.base

execute store result score #float_base_int_power.base int run data get storage large_number:math float_base_int_power.base
execute if score #float_base_int_power.expon int matches ..-1 unless score #float_base_int_power.base int matches 0 run function large_number:float_base_int_power/input.is-

scoreboard players operation #temp1 int = #float_base_int_power.expon int
scoreboard players operation #temp1 int %= 2 const
data modify storage large_number:math sstemp9 set string storage large_number:math float_base_int_power.output 0 -1
data modify storage large_number:math temp3 set value ""
data modify storage large_number:math temp1 set string storage large_number:math float_base_int_power.base 0 1
execute if data storage large_number:math {temp1:"-"} if score #temp1 int matches 1 run data modify storage large_number:math temp3 set value "-"
function large_number:float_base_int_power/macro2 with storage large_number:math
data modify storage large_number:math float_base_int_power.output set from storage large_number:math q0

data modify storage large_number:math temp2 set from storage large_number:math float_base_int_power.output
execute if data storage large_number:math {temp2:"Infinityd"} run data modify storage large_number:math float_base_int_power.output set value 9.9999E400d
execute if data storage large_number:math {temp2:"-Infinityd"} run data modify storage large_number:math float_base_int_power.output set value -9.9999E400d
execute if data storage large_number:math {temp2:"NaNd"} run data modify storage large_number:math float_base_int_power.output set value 0.0d
execute if data storage large_number:math {temp2:"-NaNd"} run data modify storage large_number:math float_base_int_power.output set value 0.0d
