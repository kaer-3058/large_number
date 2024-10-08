##整数排序 - 冒泡排序法 - 逆序

#data modify storage large_number:math sort_int.input set value [17,6,0,99,-3,288,1,7,3,2,6,9]

data modify storage large_number:math sort_int.output set value []
data modify storage large_number:math stemp0 set from storage large_number:math sort_int.input
data modify storage large_number:math stemp1 set value []

execute if data storage large_number:math stemp0[1] run function large_number:list_operation/sort/int_descending_order/loop
data modify storage large_number:math sort_int.output prepend from storage large_number:math stemp0[]
