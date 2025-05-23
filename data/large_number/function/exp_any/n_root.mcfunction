##任意正数的幂 - 开n次根

#data modify storage large_number:math exp_any.input.base set value 5.0d
#data modify storage large_number:math exp_any.input.expon set value 7.0d

#公式，a^(1/b) = e^(ln(a)/b)

data modify storage large_number:math temp_exp_any_input_base set from storage large_number:math exp_any.input.base
data modify storage large_number:math temp1 set string storage large_number:math temp_exp_any_input_base 0 1
execute store success score #1.expression_evaluation_test1 int if data storage large_number:math {temp1:"-"}
execute if score #1.expression_evaluation_test1 int matches 1 run function large_number:exp_any/nroot/macro1 with storage large_number:math

#ln(a)
data modify storage large_number:math ln_high_precision.input set from storage large_number:math temp_exp_any_input_base
function large_number:ln_high_precision/start

#ln(a)/b
data modify storage large_number:math float_division.input1 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math float_division.input2 set from storage large_number:math exp_any.input.expon
function large_number:division/float_12decimal/start

#e^(ln(a)/b)
data modify storage large_number:math exp_e^x.input set from storage large_number:math float_division.output
function large_number:exp_e.x/start
data modify storage large_number:math exp_any.output set from storage large_number:math exp_e^x.output

execute if score #1.expression_evaluation_test1 int matches 1 run function large_number:exp_any/nroot/macro2 with storage large_number:math exp_any
