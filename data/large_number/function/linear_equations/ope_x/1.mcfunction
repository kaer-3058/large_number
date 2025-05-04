data modify storage large_number:math float_division.input1 set from storage large_number:math store_vecb[-1]
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_output_matrix[-1][-1]
function large_number:division/float/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_division.output
data modify storage large_number:math temp_x prepend from storage large_number:math float_division.output
