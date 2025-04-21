#lambertw(x) -1的分支 - 高精度

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math lambertw.input set from storage large_number:math _expressionss2
execute store result storage large_number:math newton.s_method.loops int 1 run data get storage large_number:math _expressionss1
scoreboard players set #large_number.all_tellraw_set int 1
function large_number:lambertw/-1/high_precision
scoreboard players set #large_number.all_tellraw_set int 0
data modify storage large_number:math _expressionss3 set from storage large_number:math lambertw.output
