#高精度浮点乘法

scoreboard players set #expression_evaluation.ope_3.mode int 3058

data modify storage large_number:math store_float_multiply_input1 set from storage large_number:math float_multiply.input1
data modify storage large_number:math store_float_multiply_input2 set from storage large_number:math float_multiply.input2

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math store_float_multiply_input1
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input1
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 1

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math store_float_multiply_input2
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input2
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 2

execute if score #expression_evaluation.ope_3.mode int matches 1..2 store result storage large_number:math temp8 int 1 run data get storage large_number:math store_float_multiply_input1
execute if score #expression_evaluation.ope_3.mode int matches 1..2 store result storage large_number:math temp9 int 1 run data get storage large_number:math store_float_multiply_input2


execute store result storage large_number:math temp1 double .1 run data get storage large_number:math store_float_multiply_input1 10
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input1
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 3

execute store result storage large_number:math temp1 double .1 run data get storage large_number:math store_float_multiply_input2 10
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input2
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 4

execute if score #expression_evaluation.ope_3.mode int matches 3..4 store result storage large_number:math temp8 int 1 run data get storage large_number:math store_float_multiply_input1 10
execute if score #expression_evaluation.ope_3.mode int matches 3..4 store result storage large_number:math temp9 int 1 run data get storage large_number:math store_float_multiply_input2 10


execute store result storage large_number:math temp1 double .01 run data get storage large_number:math store_float_multiply_input1 100
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input1
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 5

execute store result storage large_number:math temp1 double .01 run data get storage large_number:math store_float_multiply_input2 100
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input2
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 6

execute if score #expression_evaluation.ope_3.mode int matches 5..6 store result storage large_number:math temp8 int 1 run data get storage large_number:math store_float_multiply_input1 100
execute if score #expression_evaluation.ope_3.mode int matches 5..6 store result storage large_number:math temp9 int 1 run data get storage large_number:math store_float_multiply_input2 100


execute store result storage large_number:math temp1 double .001 run data get storage large_number:math store_float_multiply_input1 1000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input1
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 7

execute store result storage large_number:math temp1 double .001 run data get storage large_number:math store_float_multiply_input2 1000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input2
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 8

execute if score #expression_evaluation.ope_3.mode int matches 7..8 store result storage large_number:math temp8 int 1 run data get storage large_number:math store_float_multiply_input1 1000
execute if score #expression_evaluation.ope_3.mode int matches 7..8 store result storage large_number:math temp9 int 1 run data get storage large_number:math store_float_multiply_input2 1000


execute store result storage large_number:math temp1 double .0001 run data get storage large_number:math store_float_multiply_input1 10000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input1
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 9

execute store result storage large_number:math temp1 double .0001 run data get storage large_number:math store_float_multiply_input2 10000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input2
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 10

execute if score #expression_evaluation.ope_3.mode int matches 9..10 store result storage large_number:math temp8 int 1 run data get storage large_number:math store_float_multiply_input1 10000
execute if score #expression_evaluation.ope_3.mode int matches 9..10 store result storage large_number:math temp9 int 1 run data get storage large_number:math store_float_multiply_input2 10000


execute store result storage large_number:math temp1 double .00001 run data get storage large_number:math store_float_multiply_input1 100000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input1
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 11

execute store result storage large_number:math temp1 double .00001 run data get storage large_number:math store_float_multiply_input2 100000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input2
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 12

execute if score #expression_evaluation.ope_3.mode int matches 11..12 store result storage large_number:math temp8 int 1 run data get storage large_number:math store_float_multiply_input1 100000
execute if score #expression_evaluation.ope_3.mode int matches 11..12 store result storage large_number:math temp9 int 1 run data get storage large_number:math store_float_multiply_input2 100000


execute store result storage large_number:math temp1 double .000001 run data get storage large_number:math store_float_multiply_input1 1000000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input1
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 13

execute store result storage large_number:math temp1 double .000001 run data get storage large_number:math store_float_multiply_input2 1000000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input2
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 14

execute if score #expression_evaluation.ope_3.mode int matches 13..14 store result storage large_number:math temp8 int 1 run data get storage large_number:math store_float_multiply_input1 1000000
execute if score #expression_evaluation.ope_3.mode int matches 13..14 store result storage large_number:math temp9 int 1 run data get storage large_number:math store_float_multiply_input2 1000000


execute store result storage large_number:math temp1 double .0000001 run data get storage large_number:math store_float_multiply_input1 10000000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input1
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 15

execute store result storage large_number:math temp1 double .0000001 run data get storage large_number:math store_float_multiply_input2 10000000
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_float_multiply_input2
execute if score #1.expression_evaluation_test1 int matches 0 run scoreboard players set #expression_evaluation.ope_3.mode int 16

execute if score #expression_evaluation.ope_3.mode int matches 15..16 store result storage large_number:math temp8 int 1 run data get storage large_number:math store_float_multiply_input1 10000000
execute if score #expression_evaluation.ope_3.mode int matches 15..16 store result storage large_number:math temp9 int 1 run data get storage large_number:math store_float_multiply_input2 10000000


execute if score #expression_evaluation.ope_3.mode int matches 3058 run function large_number:float_mul.high_precision/3
execute unless score #expression_evaluation.ope_3.mode int matches 3058 run function large_number:float_mul.high_precision/2
