#ln(a)
data modify storage large_number:math ln_high_precision.input set from storage large_number:math store_cube_root_inp
function large_number:ln_high_precision/start
#tellraw @a ["1 -> ",{storage:"large_number:math",nbt:"ln_high_precision"}]

#ln(a)/3
data modify storage large_number:math float_multiply.input1 set from storage large_number:math ln_high_precision.output
function large_number:cube_root_double/mul_1_3
#tellraw @a ["2 -> ",{storage:"large_number:math",nbt:"float_multiply"}]

#e^(ln(a)/b)
data modify storage large_number:math exp_e^x.input set from storage large_number:math float_multiply.output
function large_number:exp_e.x/start
data modify storage large_number:math cube_root.output set from storage large_number:math exp_e^x.output
#tellraw @a ["3 -> ",{storage:"large_number:math",nbt:"exp_e^x"}]
