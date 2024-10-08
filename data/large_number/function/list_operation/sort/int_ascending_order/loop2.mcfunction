execute store result score #sstemp1 int run data get storage large_number:math stemp0[0]
execute store result score #sstemp2 int run data get storage large_number:math stemp0[1]

execute if score #sstemp2 int < #sstemp1 int run function large_number:list_operation/sort/int_ascending_order/if1

data modify storage large_number:math stemp1 append from storage large_number:math stemp0[0]
data remove storage large_number:math stemp0[0]
execute if data storage large_number:math stemp0[1] run function large_number:list_operation/sort/int_ascending_order/loop2
