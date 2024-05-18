data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_float_base_int_power_mul_2
scoreboard players set #temp1 int 0
function large_number:float_base_int_power/test.macro3 with storage large_number:math float_multiply
execute unless score #temp1 int matches 0 run function large_number:float_mul.high_precision/start
execute unless score #temp1 int matches 0 run data modify storage large_number:math sstemp1 set from storage large_number:math float_multiply.output

scoreboard players remove #temp_float_base_int_power_temp1 int 1
execute unless score #temp1 int matches 0 if score #temp_float_base_int_power_temp1 int matches 2.. run function large_number:float_base_int_power/loop
