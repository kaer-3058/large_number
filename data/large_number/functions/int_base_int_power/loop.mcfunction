function large_number:int_base_int_power/loop.macro1 with storage large_number:math

scoreboard players remove #temp1 int 1
execute if score #temp1 int matches 2.. run function large_number:int_base_int_power/loop
