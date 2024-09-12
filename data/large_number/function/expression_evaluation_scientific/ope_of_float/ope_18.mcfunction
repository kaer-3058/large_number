#取绝对值

data modify storage large_number:math temp1 set string storage large_number:math _expressionss2
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1
function large_number:expression_evaluation_scientific/ope_of_float/ope_8/macro1 with storage large_number:math
