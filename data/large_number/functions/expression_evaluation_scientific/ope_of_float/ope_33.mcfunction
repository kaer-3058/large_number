#α≈≈β,δ，逻辑运算，误差判断，判断α和β的距离是否在δ的绝对值以内，是为1，否则为0

#是则输出1，不是则输出0

scoreboard players set #expression_evaluation_test2 int 3

#large_number:math _expressionss4
#large_number:math _expressionss1
#large_number:math _expressionss2

#large_number:math _expressionss3


#取绝对值
data modify storage large_number:math temp1 set string storage large_number:math _expressionss4
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1
function large_number:expression_evaluation_scientific/ope_of_float/ope_8/macro1 with storage large_number:math
data modify storage large_number:math temp_store_||s1 set from storage large_number:math _expressionss3

#取绝对值
data modify storage large_number:math temp1 set string storage large_number:math _expressionss1
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1
function large_number:expression_evaluation_scientific/ope_of_float/ope_8/macro1 with storage large_number:math
data modify storage large_number:math temp_store_||s2 set from storage large_number:math _expressionss3

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_store_||s1
data modify storage large_number:math temp2 set from storage large_number:math temp_store_||s2
data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math temp_store_||s3 set from storage large_number:math temp1

#取绝对值
data modify storage large_number:math temp1 set string storage large_number:math temp_store_||s3
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1
function large_number:expression_evaluation_scientific/ope_of_float/ope_8/macro1 with storage large_number:math
data modify storage large_number:math temp_store_||s3 set from storage large_number:math _expressionss3

#取绝对值
data modify storage large_number:math temp1 set string storage large_number:math _expressionss2
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1
function large_number:expression_evaluation_scientific/ope_of_float/ope_8/macro1 with storage large_number:math
data modify storage large_number:math temp_store_||s4 set from storage large_number:math _expressionss3

##浮点数比大小

data modify storage large_number:math temp1 set from storage large_number:math temp_store_||s3
data modify storage large_number:math temp2 set from storage large_number:math temp_store_||s4
data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
data modify storage large_number:math float_comparison_sizes.output set value ""
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:float_comparison_sizes/ope_out

#给出结果
execute unless data storage large_number:math float_comparison_sizes{output:"-"} run data modify storage large_number:math float_comparison_sizes.output set value "+"
data modify storage large_number:math temp1 set from storage large_number:math float_comparison_sizes.A
execute store success score #temp int run data modify storage large_number:math temp1 set from storage large_number:math float_comparison_sizes.B
execute if score #temp int matches 0 run data modify storage large_number:math float_comparison_sizes.output set value "="


data modify storage large_number:math _expressionss3 set value 0.0
execute if data storage large_number:math float_comparison_sizes{output:"-"} run data modify storage large_number:math _expressionss3 set value 1.0
execute if data storage large_number:math float_comparison_sizes{output:"="} run data modify storage large_number:math _expressionss3 set value 1.0
