#逻辑运算：是否小于等于

#是则输出1，不是则输出0

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math float_comparison_sizes.A set from storage large_number:math _expressionss1
data modify storage large_number:math float_comparison_sizes.B set from storage large_number:math _expressionss2
function large_number:float_comparison_sizes/start
data modify storage large_number:math _expressionss3 set value 0.0
execute if data storage large_number:math float_comparison_sizes{output:"-"} run data modify storage large_number:math _expressionss3 set value 1.0
execute if data storage large_number:math float_comparison_sizes{output:"="} run data modify storage large_number:math _expressionss3 set value 1.0

