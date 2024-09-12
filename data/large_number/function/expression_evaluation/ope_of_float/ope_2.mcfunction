data modify storage large_number:math float_add_subtra.input1 set from storage large_number:math _expressionss1
data modify storage large_number:math float_add_subtra.input2 set from storage large_number:math _expressionss2
scoreboard players set #float_add_subtra_ope_mode int 2
function large_number:float_add_subtra/start
data modify storage large_number:math _expressionss3 set from storage large_number:math float_add_subtra.output