##整数的乘方(输入值可以为负)

#scoreboard players set #int_base_int_power.base large_number.int 3
#scoreboard players set #int_base_int_power.expon large_number.int 12

scoreboard players operation #temp1 large_number.int = #int_base_int_power.expon large_number.int
scoreboard players operation #temp3 large_number.int = #int_base_int_power.base large_number.int
execute if score #temp3 large_number.int matches -2147483648 run scoreboard players set #temp3 large_number.int 2147483647
execute if score #temp3 large_number.int matches ..-1 run scoreboard players operation #temp3 large_number.int *= -1 const
execute if score #temp1 large_number.int matches -2147483648 run scoreboard players set #temp1 large_number.int 2147483647
execute if score #temp1 large_number.int matches ..-1 run scoreboard players operation #temp1 large_number.int *= -1 const
execute store result storage large_number:math temp1 double 1 run scoreboard players get #temp3 large_number.int
execute if score #temp1 large_number.int matches 2.. run function large_number:int_base_int_power/loop
data modify storage large_number:math int_base_int_power_out set from storage large_number:math temp1

execute if score #int_base_int_power.expon large_number.int matches 0 run data modify storage large_number:math int_base_int_power_out set value 1.0d

execute if score #int_base_int_power.expon large_number.int matches ..-1 unless score #int_base_int_power.base large_number.int matches 0 run function large_number:int_base_int_power/input.is-

scoreboard players operation #temp1 large_number.int = #int_base_int_power.expon large_number.int
scoreboard players operation #temp1 large_number.int %= 2 const
data modify storage large_number:math int_base_int_power_out set string storage large_number:math int_base_int_power_out 0 -1
data modify storage large_number:math temp3 set value ""
execute if score #int_base_int_power.base large_number.int matches ..-1 if score #temp1 large_number.int matches 1 run data modify storage large_number:math temp3 set value "-"
function large_number:int_base_int_power/macro2 with storage large_number:math

execute if data storage large_number:math {int_base_int_power_out:"Infinityd"} run data modify storage large_number:math int_base_int_power_out set value 1.797693134862315807E308d
execute if data storage large_number:math {int_base_int_power_out:"-Infinityd"} run data modify storage large_number:math int_base_int_power_out set value -1.797693134862315807E308d
execute if data storage large_number:math {int_base_int_power_out:"NaNd"} run data modify storage large_number:math int_base_int_power_out set value 0.0d
execute if data storage large_number:math {int_base_int_power_out:"-NaNd"} run data modify storage large_number:math int_base_int_power_out set value 0.0d
