#乘方运算+指数函数

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math exp_any.input.base set from storage large_number:math _expressionss1
data modify storage large_number:math exp_any.input.expon set from storage large_number:math _expressionss2
scoreboard players set #exp_any.mode int 1
function large_number:exp_any/start
data modify storage large_number:math _expressionss3 set from storage large_number:math exp_any.output
