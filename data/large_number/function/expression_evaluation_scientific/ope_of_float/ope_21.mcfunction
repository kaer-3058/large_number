#取相反数

data modify storage large_number:math temp1 set string storage large_number:math _expressionss2 0 -1
data modify storage large_number:math temp2 set string storage large_number:math _expressionss2 0 1
data modify storage large_number:math temp3 set value "-"
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp3 set value ""
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math _expressionss2 1 -1

function large_number:expression_evaluation_scientific/ope_of_float/ope_21.2 with storage large_number:math
