#对整数任意倍乘 (double*int)
#data modify storage large_number:math int_mul_by_n.data_type set value "double"

data modify storage large_number:math temp1 set from storage large_number:math int_mul_by_n.input_n
data modify storage large_number:math temp2 set from storage large_number:math int_mul_by_n.data_type
function large_number:int_mul_by_n/macro with storage large_number:math

# byte、float、double、short、int、long
