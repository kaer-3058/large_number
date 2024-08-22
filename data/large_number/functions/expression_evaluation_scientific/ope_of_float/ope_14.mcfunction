#整数阶乘+伽玛函数

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math _expressionss2
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math _expressionss2
execute if score #1.expression_evaluation_test1 int matches 0 run function large_number:expression_evaluation_scientific/ope_of_float/ope_14.1
execute if score #1.expression_evaluation_test1 int matches 1 run function large_number:expression_evaluation_scientific/ope_of_float/ope_14.2
