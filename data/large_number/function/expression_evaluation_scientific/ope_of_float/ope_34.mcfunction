#浮点除法 - 交换除

data modify storage large_number:math temp set from storage large_number:math _expressionss2
data modify storage large_number:math _expressionss2 set from storage large_number:math _expressionss1
data modify storage large_number:math _expressionss1 set from storage large_number:math temp

function large_number:expression_evaluation_scientific/ope_of_float/ope_4
