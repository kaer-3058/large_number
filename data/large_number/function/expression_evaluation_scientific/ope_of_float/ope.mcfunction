#传递信号，设定执行的运算是几元运算。
#1元运算，一个输入，一个输出
#2元运算，两个输入，一个输出
#3元运算，三个输入，一个输出
scoreboard players set #expression_evaluation_test2 int 1

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
execute if data storage large_number:math {stemp_expression1:"+"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_1
execute if data storage large_number:math {stemp_expression1:"-"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_2
execute if data storage large_number:math {stemp_expression1:"*"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_3
execute if data storage large_number:math {stemp_expression1:"·"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_3
execute if data storage large_number:math {stemp_expression1:"/"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_4
execute if data storage large_number:math {stemp_expression1:"^"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_5
execute if data storage large_number:math {stemp_expression1:"exp"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_6
execute if data storage large_number:math {stemp_expression1:"log"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_7
execute if data storage large_number:math {stemp_expression1:"sin"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_8
execute if data storage large_number:math {stemp_expression1:"cos"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_9
execute if data storage large_number:math {stemp_expression1:"arcsin"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_10
execute if data storage large_number:math {stemp_expression1:"arccos"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_11
execute if data storage large_number:math {stemp_expression1:"ln"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_12
execute if data storage large_number:math {stemp_expression1:"√"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_13
execute if data storage large_number:math {stemp_expression1:"Γ"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_14
execute if data storage large_number:math {stemp_expression1:"┕"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_15
execute if data storage large_number:math {stemp_expression1:"ºLambertW"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_16
execute if data storage large_number:math {stemp_expression1:"¹LambertW"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_17
execute if data storage large_number:math {stemp_expression1:"||"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_18
execute if data storage large_number:math {stemp_expression1:"sgn"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_19
execute if data storage large_number:math {stemp_expression1:"[]"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_20
execute if data storage large_number:math {stemp_expression1:"—"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_21 with storage large_number:math
execute if data storage large_number:math {stemp_expression1:"atan"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_22
execute if data storage large_number:math {stemp_expression1:"ψ"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_23
execute if data storage large_number:math {stemp_expression1:"Σ[1/n]n→"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_24
execute if data storage large_number:math {stemp_expression1:"eunorm₂"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_25
execute if data storage large_number:math {stemp_expression1:"eunorm₃"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_26
execute if data storage large_number:math {stemp_expression1:"²"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_27
execute if data storage large_number:math {stemp_expression1:"arctan"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_28
execute if data storage large_number:math {stemp_expression1:"[0]"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_29
execute if data storage large_number:math {stemp_expression1:"<="} run function large_number:expression_evaluation_scientific/ope_of_float/ope_30
execute if data storage large_number:math {stemp_expression1:">="} run function large_number:expression_evaluation_scientific/ope_of_float/ope_31
execute if data storage large_number:math {stemp_expression1:"=="} run function large_number:expression_evaluation_scientific/ope_of_float/ope_32
execute if data storage large_number:math {stemp_expression1:"≈≈"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_33
execute if data storage large_number:math {stemp_expression1:">/<"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_34
execute if data storage large_number:math {stemp_expression1:">-<"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_35
execute if data storage large_number:math {stemp_expression1:">>"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_36
execute if data storage large_number:math {stemp_expression1:"<<"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_37
execute if data storage large_number:math {stemp_expression1:"≥≥"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_38
execute if data storage large_number:math {stemp_expression1:"≤≤"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_39
execute if data storage large_number:math {stemp_expression1:"nroot"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_40
execute if data storage large_number:math {stemp_expression1:"ºsinh"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_41
execute if data storage large_number:math {stemp_expression1:"ºcosh"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_42
execute if data storage large_number:math {stemp_expression1:"ºtanh"} run function large_number:expression_evaluation_scientific/ope_of_float/ope_43


execute if score #expression_evaluation_test2 int matches 1.. run data remove storage large_number:math temp_expression_s1[-1]
execute if score #expression_evaluation_test2 int matches 2.. run data remove storage large_number:math temp_expression_s1[-1]
execute if score #expression_evaluation_test2 int matches 3.. run data remove storage large_number:math temp_expression_s1[-1]
data modify storage large_number:math _expressionss3 set string storage large_number:math _expressionss3 0 -1
data modify storage large_number:math temp_expression_s1 append from storage large_number:math _expressionss3

#tellraw @a {"nbt":"_expressionss3","storage": "large_number:math"}
