#贝塔函数

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math beta_function.input set value [0d,0d]
data modify storage large_number:math beta_function.input[0] set from storage large_number:math _expressionss1
data modify storage large_number:math beta_function.input[1] set from storage large_number:math _expressionss2
function large_number:beta_function/start
data modify storage large_number:math _expressionss3 set from storage large_number:math beta_function.output
