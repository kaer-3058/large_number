##指数函数  e^x

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math exp_e^x.input
execute store success score #expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math exp_e^x.input
execute if score #expression_evaluation_test1 int matches 0 run function large_number:exp_e.x/1
execute if score #expression_evaluation_test1 int matches 1 run function large_number:exp_e.x/2

execute if data storage large_number:math exp_e^x{input:1.0d} run data modify storage large_number:math exp_e^x.output set value 2.71828182845904523536028747135266249775724709369995d
execute if data storage large_number:math exp_e^x{input:0.0d} run data modify storage large_number:math exp_e^x.output set value 1.0d
