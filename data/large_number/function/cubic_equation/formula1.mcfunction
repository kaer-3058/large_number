data modify storage large_number:math cubic_equation.roots set value 1

function large_number:cubic_equation/macro3 with storage large_number:math

data modify storage large_number:math float_division.input1 set from storage large_number:math temp_b
data modify storage large_number:math float_division.input2 set from storage large_number:math q0
function large_number:division/float/start
data modify storage large_number:math cubic_equation.output set from storage large_number:math float_division.output
