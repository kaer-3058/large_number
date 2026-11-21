#计算复数根

#实部
function large_number:n-th_degree_equation/2/macro3 with storage large_number:math
scoreboard players set #New_double_sqrt.decimal_add large_number.int 1
function large_number:new_double_ope/double_sqrt
function large_number:n-th_degree_equation/2/macro2 with storage large_number:math
function large_number:n-th_degree_equation/2/macro4 with storage large_number:math
function large_number:division/float/start
data modify storage large_number:math temp_in09 set value {x:0,i:0}
data modify storage large_number:math temp_in09.x set from storage large_number:math float_division.output

#虚部
data modify storage large_number:math float_division.input1 set from storage large_number:math double_sqrt.output
function large_number:division/float/start
data modify storage large_number:math temp_in09.i set from storage large_number:math float_division.output
data modify storage large_number:math n-th_degree_equation.output append from storage large_number:math temp_in09

#共轭复数
function large_number:n-th_degree_equation/2/macro5 with storage large_number:math float_division
data modify storage large_number:math n-th_degree_equation.output append from storage large_number:math temp_in09
