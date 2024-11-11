#顺序判断
data modify storage large_number:math s0 set value ""
data modify storage large_number:math s0 set string storage large_number:math stemp0[0] 0 1
data modify storage large_number:math s1 set value ""
data modify storage large_number:math s1 set string storage large_number:math stemp0[1] 0 1
execute store result score #temp1 int run function large_number:list_operation/sort/string_dictionary_order_basic/macro1 with storage large_number:math
execute store result score #temp2 int run function large_number:list_operation/sort/string_dictionary_order_basic/macro2 with storage large_number:math
execute if score #temp1 int matches 0 run scoreboard players set #temp1 int 2147483646
execute if score #temp2 int matches 0 run scoreboard players set #temp2 int 2147483646
execute if data storage large_number:math {s0:""} run scoreboard players set #temp1 int 2147483647
execute if data storage large_number:math {s1:""} run scoreboard players set #temp2 int 2147483647

execute if score #temp1 int > #temp2 int run function large_number:list_operation/sort/string_dictionary_order_basic/if1

data modify storage large_number:math stemp1 append from storage large_number:math stemp0[0]
data remove storage large_number:math stemp0[0]
execute if data storage large_number:math stemp0[1] run function large_number:list_operation/sort/string_dictionary_order_basic/loop2
