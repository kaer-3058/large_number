#sin(x)

data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math _expressionss2
function large_number:elem_complex_function/cos_sin/sin
data modify storage large_number:math _expressionss3 set from storage large_number:math sin_cos_high_precision.sin
