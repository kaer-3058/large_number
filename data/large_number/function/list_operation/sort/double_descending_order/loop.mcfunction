scoreboard players set #temp_sorting int 0
execute if data storage large_number:math stemp0[1] run function large_number:list_operation/sort/double_descending_order/loop2
data modify storage large_number:math sort_double.output prepend from storage large_number:math stemp0[0]
data modify storage large_number:math stemp0 set from storage large_number:math stemp1
data modify storage large_number:math stemp1 set value []
execute if data storage large_number:math stemp0[1] if score #temp_sorting int matches 1 run function large_number:list_operation/sort/double_descending_order/loop
