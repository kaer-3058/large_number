#浮点除法 - 交换除

scoreboard players set #expression_evaluation_test2 large_number.int 2

execute if data storage large_number:math {_expressionss2:1.0} run function large_number:expre_evalu_sci_complex/ope_of_float/ope_34.2
execute unless data storage large_number:math {_expressionss2:1.0} run function large_number:expre_evalu_sci_complex/ope_of_float/ope_34.1
