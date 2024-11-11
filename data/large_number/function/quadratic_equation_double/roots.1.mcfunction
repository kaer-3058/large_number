data modify storage large_number:math quadratic_equation_double.roots set value 1

function large_number:quadratic_equation_double/macro2 with storage large_number:math
function large_number:quadratic_equation_double/macro3 with storage large_number:math
data modify storage large_number:math float_division.input1 set from storage large_number:math temp_-b
data modify storage large_number:math float_division.input2 set from storage large_number:math q0
function large_number:division/float/start
data modify storage large_number:math quadratic_equation_double.output set from storage large_number:math float_division.output

data modify storage large_number:math temp1 set string storage large_number:math temp_-b 0 -1
data modify storage large_number:math temp2 set string storage large_number:math float_division.input2 0 -1
function large_number:quadratic_equation_double/roots.1.expression with storage large_number:math
data modify storage large_number:math quadratic_equation_double.expression set from storage large_number:math q0
