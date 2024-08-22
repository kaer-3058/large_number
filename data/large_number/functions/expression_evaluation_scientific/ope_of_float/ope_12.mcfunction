#ln(x)

data modify storage large_number:math ln_high_precision.input set from storage large_number:math _expressionss2
function large_number:ln_high_precision/start
data modify storage large_number:math _expressionss3 set from storage large_number:math ln_high_precision.output
