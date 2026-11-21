data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_zeta_function_inp
function large_number:float_mul.high_precision/squ/start
data modify storage large_number:math float_reciprocal.input set from storage large_number:math float_multiply.output
function large_number:riemann_zeta_function/float_reciprocal_8dici_-1
data modify storage large_number:math temp_zeta_function_t_03 set from storage large_number:math float_reciprocal.output
