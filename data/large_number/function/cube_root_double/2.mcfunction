#ln(a)
data modify storage large_number:math ln_high_precision.input set from storage large_number:math store_cube_root_inp
function large_number:ln_high_precision/start

#ln(a)/3
data modify storage large_number:math float_multiply.input1 set from storage large_number:math ln_high_precision.output
function large_number:cube_root_double/mul_with_const_1

#e^(ln(a)/b)
data modify storage large_number:math exp_e^x.input set from storage large_number:math float_multiply.output
function large_number:exp_e.x/2
data modify storage large_number:math cube_root.output set from storage large_number:math exp_e^x.output
