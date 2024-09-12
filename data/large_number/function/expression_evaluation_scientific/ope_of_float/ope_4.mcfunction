#浮点除法

scoreboard players set #expression_evaluation_test2 int 2

execute if data storage large_number:math {_expressionss1:1.0} run function large_number:expression_evaluation_scientific/ope_of_float/ope_4.2
execute unless data storage large_number:math {_expressionss1:1.0} run function large_number:expression_evaluation_scientific/ope_of_float/ope_4.1
