##整数的乘方(输入值可以为负)

#scoreboard players set #int_base_int_power.base int 3
#scoreboard players set #int_base_int_power.expon int 12

scoreboard players operation #temp1 int = #int_base_int_power.expon int
scoreboard players operation #temp3 int = #int_base_int_power.base int
execute if score #temp3 int matches ..-1 run scoreboard players operation #temp3 int *= -1 const
execute if score #temp1 int matches ..-1 run scoreboard players operation #temp1 int *= -1 const
execute store result storage math temp1 double 1 run scoreboard players get #temp3 int
execute if score #temp1 int matches 2.. run function large_number:int_base_int_power/loop
data modify storage math int_base_int_power_out set from storage math temp1

execute if score #int_base_int_power.expon int matches 0 run data modify storage math int_base_int_power_out set value 1.0d

execute if score #int_base_int_power.expon int matches ..-1 unless score #int_base_int_power.base int matches 0 run function large_number:int_base_int_power/input.is-

scoreboard players operation #temp1 int = #int_base_int_power.expon int
scoreboard players operation #temp1 int %= 2 const
data modify storage math int_base_int_power_out set string storage math int_base_int_power_out 0 -1
data modify storage math temp3 set value ""
execute if score #int_base_int_power.base int matches ..-1 if score #temp1 int matches 1 run data modify storage math temp3 set value "-"
function large_number:int_base_int_power/macro2 with storage math

execute if data storage math {int_base_int_power_out:"Infinityd"} run data modify storage math int_base_int_power_out set value 9.9999E400d
execute if data storage math {int_base_int_power_out:"-Infinityd"} run data modify storage math int_base_int_power_out set value -9.9999E400d
execute if data storage math {int_base_int_power_out:"NaNd"} run data modify storage math int_base_int_power_out set value 0.0d
execute if data storage math {int_base_int_power_out:"-NaNd"} run data modify storage math int_base_int_power_out set value 0.0d
