#对整数任意倍乘 (double*int)
#data modify storage math int_mul_by_n.data_type set value "double"

data modify storage math temp1 set from storage math int_mul_by_n.input_n
data modify storage math temp2 set from storage math int_mul_by_n.data_type
function large_number:int_mul_by_n/macro with storage math

# byte、float、double、short、int、long
