##数值导数 - 差商求导法 - 二阶

#data modify storage large_number:math expression_evaluation.differential.input set value 2.3075
#data modify storage large_number:math expression_evaluation.differential.dx set value 0.004
#dx是一个较小的值，范围是[1, 1E-9]，因浮点误差的存在，此值不可太小，一般选0.01~0.001
#所求导的函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.differential.input
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.differential.dx
function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp1

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:expression_evaluation_scientific/macro4.output with storage large_number:math
data modify storage large_number:math stempu set from storage large_number:math expression_evaluation.output

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.differential.input
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.differential.dx
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp1

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:expression_evaluation_scientific/macro4.output with storage large_number:math
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.output

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math stempu
function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math stempv set from storage large_number:math temp1

data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math expression_evaluation.differential.input

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:expression_evaluation_scientific/macro4.output with storage large_number:math

function large_number:differential/difference_quotient_method/2/macro1 with storage large_number:math expression_evaluation

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math stempv
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

#h^2
execute store result storage large_number:math temp2 double 0.000000000000000001 store result score #temp1 int run data get storage large_number:math expression_evaluation.differential.dx 1000000000
function large_number:differential/difference_quotient_method/2/macro2 with storage large_number:math

#结果
execute store result score #temp1 int run data get storage large_number:math temp2 1000000000
scoreboard players set #temp2 int 1000000000
scoreboard players operation #temp2 int /= #temp1 int
function large_number:differential/difference_quotient_method/1/macro1 with storage large_number:math
data modify storage large_number:math expression_evaluation.differential.2output set from storage large_number:math temp4
