##平均数

#data modify storage large_number:math average_number.input set value [1.0,7.0,6.0,5.233,16.23]

data modify storage large_number:math sstempr set from storage large_number:math average_number.input
execute if data storage large_number:math sstempr[0] positioned .0 .0 .0 run function large_number:definite_integral/riemann_integral/loop2

data modify storage large_number:math float_division.input1 set from storage large_number:math float_multiply.input1
execute store result storage large_number:math float_division.input2 double 1 run data get storage large_number:math average_number.input
function large_number:division/float/start
data modify storage large_number:math average_number.output set from storage large_number:math float_division.output
