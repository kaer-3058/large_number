#取绝对值

data modify storage large_number:math temp2 set string storage large_number:math _expressionss2 0 1
execute if data storage large_number:math {temp2:"-"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_21 with storage large_number:math
