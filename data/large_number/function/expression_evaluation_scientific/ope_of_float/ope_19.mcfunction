#符号函数

data modify storage large_number:math _expressionss3 set value 1.0
data modify storage large_number:math temp2 set string storage large_number:math _expressionss2 0 1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math _expressionss3 set value -1.0
execute if data storage large_number:math {_expressionss2:0.0} run data modify storage large_number:math _expressionss3 set value 0.0
