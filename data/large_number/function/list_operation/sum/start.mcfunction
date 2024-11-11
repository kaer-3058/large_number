##总和

#data modify storage large_number:math list_sum.input set value [1.0,7.0,6.0,5.233,16.23]

data modify storage large_number:math sstempr set from storage large_number:math list_sum.input
execute if data storage large_number:math sstempr[0] positioned .0 .0 .0 run function large_number:definite_integral/riemann_integral/loop2

data modify storage large_number:math list_sum.output set from storage large_number:math float_multiply.input1
