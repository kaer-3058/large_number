data modify storage large_number:math complex_operation.z2 set from storage large_number:math stempr[0]
function large_number:complex_operation/addition_direct
data modify storage large_number:math complex_operation.z1 set from storage large_number:math complex_operation.output

data remove storage large_number:math stempr[0]
execute if data storage large_number:math stempr[0] run function large_number:complex_integral/list_sum_of_c/loop
