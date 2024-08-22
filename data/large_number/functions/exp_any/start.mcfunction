##任意正数的幂

#判断输入值是不是整数
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math exp_any.input.expon
execute store success score #expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math exp_any.input.expon
execute if score #expression_evaluation_test1 int matches 0 run function large_number:exp_any/1
execute if score #expression_evaluation_test1 int matches 1 run function large_number:exp_any/2
