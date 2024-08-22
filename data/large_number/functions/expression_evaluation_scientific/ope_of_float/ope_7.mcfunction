#log.a(b)

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math ln_high_precision.input set from storage large_number:math _expressionss2
function large_number:ln_high_precision/start
data modify storage large_number:math store_log_expre_1 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math ln_high_precision.input set from storage large_number:math _expressionss1
function large_number:ln_high_precision/start
data modify storage large_number:math float_division.input2 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math float_division.input1 set from storage large_number:math store_log_expre_1
function large_number:division/float_12dicimal/start
data modify storage large_number:math _expressionss3 set from storage large_number:math float_division.output
