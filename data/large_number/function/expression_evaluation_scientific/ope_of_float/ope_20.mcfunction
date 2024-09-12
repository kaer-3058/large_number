#取整函数 - 向下取整

data modify storage large_number:math round_double.input set from storage large_number:math _expressionss2
scoreboard players set #round_towards_zero int 0
function large_number:round_double/start
data modify storage large_number:math _expressionss3 set from storage large_number:math round_double.output
