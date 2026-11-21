#校正项

#x^6
function large_number:elem_complex_function/gamma/x_6_expon/start

#810x^6
function large_number:elem_complex_function/gamma/macro4 with storage large_number:math temp_x_6_expon_out
function large_number:elem_complex_function/gamma/macro5 with storage large_number:math temp_x_6_expon_out

#1/(810x^6)
data modify storage large_number:math complex_operation.z1 set from storage large_number:math temp_x_6_expon_out
function large_number:complex_operation/reciprocal_direct

#加法
data modify storage large_number:math complex_operation.z1 set from storage large_number:math complex_operation.output
data modify storage large_number:math complex_operation.z2 set from storage large_number:math temp_x_sinh1/x
function large_number:complex_operation/addition_direct
data modify storage large_number:math temp1 set from storage large_number:math complex_operation.output
