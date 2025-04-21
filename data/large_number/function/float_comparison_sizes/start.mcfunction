##浮点数比大小

#data modify storage large_number:math float_comparison_sizes.A set value 6.74503
#data modify storage large_number:math float_comparison_sizes.B set value 6.74502
#A 比较 B，"+"为更大，"-"为更小，"="为相等

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math float_comparison_sizes.A
data modify storage large_number:math temp2 set from storage large_number:math float_comparison_sizes.B
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int -= #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:float_comparison_sizes/ope_output_of_small_number with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:float_comparison_sizes/ope_out

#给出结果
execute unless data storage large_number:math float_comparison_sizes{output:"-"} run data modify storage large_number:math float_comparison_sizes.output set value "+"
data modify storage large_number:math temp1 set from storage large_number:math float_comparison_sizes.A
execute store success score #temp int run data modify storage large_number:math temp1 set from storage large_number:math float_comparison_sizes.B
execute if score #temp int matches 0 run data modify storage large_number:math float_comparison_sizes.output set value "="
