data modify storage large_number:math s1 set from storage large_number:math temp_expression_s1[-2]
data modify storage large_number:math s2 set from storage large_number:math temp_expression_s1[-1]
function large_number:expression_evaluation/ope_of_float/macro1 with storage large_number:math
execute if data storage large_number:math {stemp_expression1:"+"} run function large_number:expression_evaluation/ope_of_float/ope_1
execute if data storage large_number:math {stemp_expression1:"-"} run function large_number:expression_evaluation/ope_of_float/ope_2
execute if data storage large_number:math {stemp_expression1:"*"} run function large_number:expression_evaluation/ope_of_float/ope_3
execute if data storage large_number:math {stemp_expression1:"/"} run function large_number:expression_evaluation/ope_of_float/ope_4
data remove storage large_number:math temp_expression_s1[-1]
data remove storage large_number:math temp_expression_s1[-1]
data modify storage large_number:math _expressionss3 set string storage large_number:math _expressionss3 0 -1
data modify storage large_number:math temp_expression_s1 append from storage large_number:math _expressionss3
