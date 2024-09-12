#浮点数的平方

data modify storage large_number:math float_multiply.input1 set from storage large_number:math _expressionss2
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math _expressionss3 set from storage large_number:math float_multiply.output
