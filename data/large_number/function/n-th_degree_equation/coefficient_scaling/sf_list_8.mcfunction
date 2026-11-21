#1次项
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_m1_8th
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_coe_m
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_m1_9th set from storage large_number:math float_multiply.output
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_mat[8]
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_m1_9th
function large_number:division/float/start
data modify storage large_number:math temp_mat[8] set from storage large_number:math float_division.output
