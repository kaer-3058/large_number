#一次方程

data modify storage large_number:math temp1 set from storage large_number:math n-th_degree_equation.input[1]
function large_number:n-th_degree_equation/1/macro1 with storage large_number:math
data modify storage large_number:math float_division.input2 set from storage large_number:math n-th_degree_equation.input[0]
function large_number:division/float/start
data modify storage large_number:math temp1 set value {x:0}
data modify storage large_number:math temp1.x set from storage large_number:math float_division.output
data modify storage large_number:math n-th_degree_equation.output append from storage large_number:math temp1
