#lambertw(x) 主分支 - 高精度

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math lambertw.input set from storage large_number:math _expressionss2
execute store result storage large_number:math newton.s_method.loops int 1 run data get storage large_number:math _expressionss1
data modify storage large_number:math lambertw.branch set value 0
function large_number:lambertw/high_precision_no_tell
data modify storage large_number:math _expressionss3 set from storage large_number:math lambertw.output
