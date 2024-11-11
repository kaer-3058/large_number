data modify storage large_number:math quadratic_equation_double.roots set value 1

function large_number:quadratic_equation_double/macro4 with storage large_number:math
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_c1
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_b
function large_number:division/float/start
data modify storage large_number:math quadratic_equation_double.output set from storage large_number:math float_division.output

data modify storage large_number:math temp_c1 set string storage large_number:math temp_c1 0 -1
data modify storage large_number:math temp_b set string storage large_number:math temp_b 0 -1
function large_number:quadratic_equation_double/macro5 with storage large_number:math
data modify storage large_number:math quadratic_equation_double.expression set from storage large_number:math q0
