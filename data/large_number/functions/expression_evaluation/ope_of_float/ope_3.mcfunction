data modify storage large_number:math float_multiply.input1 set from storage large_number:math _expressionss1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math _expressionss2
function large_number:float_mul.high_precision/start
data modify storage large_number:math _expressionss3 set from storage large_number:math float_multiply.output