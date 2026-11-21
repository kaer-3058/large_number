#逻辑运算：是否相等

#是则输出1，不是则输出0

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math temp1 set from storage large_number:math _expressionss1
execute store success score #temp1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math _expressionss2
data modify storage large_number:math _expressionss3 set value 0.0
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math _expressionss3 set value 1.0

