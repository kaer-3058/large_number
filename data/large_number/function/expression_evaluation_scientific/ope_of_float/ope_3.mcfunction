#高精度浮点乘法

data modify storage large_number:math float_multiply.input1 set from storage large_number:math _expressionss1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math _expressionss2
function large_number:float_mul.high_precision/start
data modify storage large_number:math _expressionss3 set from storage large_number:math float_multiply.output

scoreboard players set #expression_evaluation_test2 large_number.int 2

#报错，乘法溢出
execute if score #stempv large_number.int matches 0 run scoreboard players set #temp_expression_evaluation_error large_number.int 1105