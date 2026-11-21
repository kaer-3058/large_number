#浮点减法

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math temp1 set from storage large_number:math _expressionss1
data modify storage large_number:math temp2 set from storage large_number:math _expressionss2
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math _expressionss3 set from storage large_number:math temp1

#减法溢出
data modify storage large_number:math temp2 set value ""
data modify storage large_number:math temp2 set string storage large_number:math temp1 -9 -1
execute if data storage large_number:math {temp2:"Infinity"} run scoreboard players set #temp_expression_evaluation_error large_number.int 1104
