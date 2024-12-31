data modify storage large_number:math exp_any.input.base set from storage large_number:math _expressionss2
data modify storage large_number:math exp_any.input.expon set from storage large_number:math _expressionss1
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:exp_any/n_root
data modify storage large_number:math _expressionss3 set from storage large_number:math exp_any.output
