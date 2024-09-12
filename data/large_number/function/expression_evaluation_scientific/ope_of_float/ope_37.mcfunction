#逻辑运算：是否小于

#是则输出1，不是则输出0

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math float_comparison_sizes.A set from storage large_number:math _expressionss1
data modify storage large_number:math float_comparison_sizes.B set from storage large_number:math _expressionss2
function large_number:float_comparison_sizes/start
execute store success storage large_number:math _expressionss3 double 1 if data storage large_number:math float_comparison_sizes{output:"-"}
