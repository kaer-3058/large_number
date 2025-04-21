#开n次根

data modify storage large_number:math exp_any.input.base set from storage large_number:math _expressionss2
data modify storage large_number:math exp_any.input.expon set from storage large_number:math _expressionss1
function large_number:exp_any/n_root
data modify storage large_number:math _expressionss3 set from storage large_number:math exp_any.output

scoreboard players set #expression_evaluation_test2 int 2
