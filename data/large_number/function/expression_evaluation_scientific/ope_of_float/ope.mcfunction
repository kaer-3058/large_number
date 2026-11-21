#传递信号，设定执行的运算是几元运算。
#1元运算，一个输入，一个输出
#2元运算，两个输入，一个输出
#3元运算，三个输入，一个输出
scoreboard players set #expression_evaluation_test2 large_number.int 1

data modify storage large_number:math s1 set value 0.0
data modify storage large_number:math s2 set value 0.0
data modify storage large_number:math s3 set value 0.0

data modify storage large_number:math s1 set from storage large_number:math temp_expression_s1[-2]
data modify storage large_number:math s2 set from storage large_number:math temp_expression_s1[-1]
data modify storage large_number:math s3 set from storage large_number:math temp_expression_s1[-3]

#把字符串里的数字用宏取出为double
function large_number:expression_evaluation_scientific/ope_of_float/macro1 with storage large_number:math
function large_number:expression_evaluation_scientific/ope_of_float/macro2 with storage large_number:math
function large_number:expression_evaluation_scientific/ope_of_float/macro3 with storage large_number:math

#根据符号来启动对应的计算模块
function large_number:expression_evaluation_scientific/ope_of_float/ope_index with storage large_number:math

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

execute if score #expression_evaluation_test2 large_number.int matches 1.. run data remove storage large_number:math temp_expression_s1[-1]
execute if score #expression_evaluation_test2 large_number.int matches 2.. run data remove storage large_number:math temp_expression_s1[-1]
execute if score #expression_evaluation_test2 large_number.int matches 3 run data remove storage large_number:math temp_expression_s1[-1]
#tellraw @a {"nbt":"_expressionss3","storage": "large_number:math"}
execute if data storage large_number:math temp_expression_s2[1] run data modify storage large_number:math _expressionss3 set string storage large_number:math _expressionss3 0 -1
data modify storage large_number:math temp_expression_s1 append from storage large_number:math _expressionss3

#tellraw @a {"nbt":"_expressionss3","storage": "large_number:math"}
