#验证输入的符号是否受支持
data modify storage large_number:math stemp_expression1 set from storage large_number:math temp_expression_s2[0]
execute store result score #temp1 large_number.int store result storage large_number:math stemp_expression2 int 1 run function large_number:expression_evaluation_scientific/ope_of_float/loop1.macro1 with storage large_number:math
execute if score #temp1 large_number.int matches 0 run function large_number:expression_evaluation_scientific/ope_of_float/loop1.if
execute if score #temp1 large_number.int matches 1.. run function large_number:expression_evaluation_scientific/ope_of_float/ope

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

data remove storage large_number:math temp_expression_s2[0]
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
