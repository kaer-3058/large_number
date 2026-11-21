#浮点加法

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math complex_operation.z1 set from storage large_number:math _expressionss1
data modify storage large_number:math complex_operation.z2 set from storage large_number:math _expressionss2
function large_number:complex_operation/addition_direct

data modify storage large_number:math _expressionss3 set from storage large_number:math complex_operation.output
