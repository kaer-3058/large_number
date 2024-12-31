#开n次根

execute if data storage large_number:math {_expressionss1:3.0} run function large_number:expression_evaluation_scientific/ope_of_float/ope_40.1
execute unless data storage large_number:math {_expressionss1:3.0} run function large_number:expression_evaluation_scientific/ope_of_float/ope_40.2

scoreboard players set #expression_evaluation_test2 int 2
