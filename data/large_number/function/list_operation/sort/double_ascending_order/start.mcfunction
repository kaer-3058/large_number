##double排序 - 冒泡排序法 - 正序

#data modify storage large_number:math sort_double.input set value [17.3,6.9,0.0,99.0,1.700001,1.79E308,7.09E-320,-3.9982,288.7,1.7,3.0,2.0,6.0,9.0]

data modify storage large_number:math sort_double.output set value []
data modify storage large_number:math stemp0 set from storage large_number:math sort_double.input
data modify storage large_number:math stemp1 set value []

execute if data storage large_number:math stemp0[1] run function large_number:list_operation/sort/double_ascending_order/loop
data modify storage large_number:math sort_double.output prepend from storage large_number:math stemp0[]
