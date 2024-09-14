#高精度浮点开方

data modify storage large_number:math double_sqrt.input set from storage large_number:math _expressionss2
function large_number:double_sqrt_more_decimal
data modify storage large_number:math _expressionss3 set from storage large_number:math double_sqrt.output
