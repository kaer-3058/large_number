#传递信号，设定执行的运算是几元运算。
#1元运算，一个输入，一个输出
#2元运算，两个输入，一个输出
#3元运算，三个输入，一个输出
scoreboard players set #expression_evaluation_test2 large_number.int 1

#取出复数

data modify storage large_number:math s1 set value 0.0
data modify storage large_number:math s2 set value 0.0
data modify storage large_number:math stemp1 set value 0d
data modify storage large_number:math stemp2 set value 0d
data modify storage large_number:math _expressionss1 set value {x:0d,i:0d}
data modify storage large_number:math _expressionss2 set value {x:0d,i:0d}
data modify storage large_number:math _expressionss3 set value {x:0d,i:0d}

data modify storage large_number:math s1 set from storage large_number:math temp_expression_s1[-2]
data modify storage large_number:math s2 set from storage large_number:math temp_expression_s1[-1]
data modify storage large_number:math store_s1 set from storage large_number:math s1
data modify storage large_number:math store_s2 set from storage large_number:math s2

data modify storage large_number:math temp1 set value ""
data modify storage large_number:math temp2 set value ""
data modify storage large_number:math temp1 set string storage large_number:math s1 -1
data modify storage large_number:math temp2 set string storage large_number:math s2 -1
execute if data storage large_number:math {temp1:"I"} run data modify storage large_number:math s1 set string storage large_number:math s1 0 -1
execute if data storage large_number:math {temp2:"I"} run data modify storage large_number:math s2 set string storage large_number:math s2 0 -1

#把字符串里的数字用宏取出为double
function large_number:expre_evalu_sci_complex/ope_of_float/macro1 with storage large_number:math
function large_number:expre_evalu_sci_complex/ope_of_float/macro2 with storage large_number:math

execute unless data storage large_number:math {temp1:"I"} run data modify storage large_number:math _expressionss1.x set from storage large_number:math stemp1
execute if data storage large_number:math {temp1:"I"} run data modify storage large_number:math _expressionss1.i set from storage large_number:math stemp1
execute unless data storage large_number:math {temp2:"I"} run data modify storage large_number:math _expressionss2.x set from storage large_number:math stemp2
execute if data storage large_number:math {temp2:"I"} run data modify storage large_number:math _expressionss2.i set from storage large_number:math stemp2

execute if data storage large_number:math store_s1.x run data modify storage large_number:math _expressionss1 merge from storage large_number:math s1
execute if data storage large_number:math store_s2.x run data modify storage large_number:math _expressionss2 merge from storage large_number:math s2
execute if data storage large_number:math store_s1.i run data modify storage large_number:math _expressionss1 merge from storage large_number:math s1
execute if data storage large_number:math store_s2.i run data modify storage large_number:math _expressionss2 merge from storage large_number:math s2
execute if data storage large_number:math {store_s1:"I"} run data modify storage large_number:math _expressionss1 set value {x:0d,i:1d}
execute if data storage large_number:math {store_s2:"I"} run data modify storage large_number:math _expressionss2 set value {x:0d,i:1d}

data modify storage large_number:math s1 set from storage large_number:math temp_expression_s1[-2]
data modify storage large_number:math s2 set from storage large_number:math temp_expression_s1[-1]
execute if data storage large_number:math s1{is_variables:1b} run data modify storage large_number:math _expressionss1 set from storage large_number:math temp_expression_s1[-2]
execute if data storage large_number:math s2{is_variables:1b} run data modify storage large_number:math _expressionss2 set from storage large_number:math temp_expression_s1[-1]

#execute if data storage large_number:math s2{is_variables:1b} run tellraw @a [{storage:"large_number:math",nbt:"temp_expression_s1"}]
#tellraw @a [{storage:"large_number:math",nbt:"_expressionss1"}," ",{storage:"large_number:math",nbt:"_expressionss2"}]
#tellraw @a ["符号：",{storage:"large_number:math",nbt:"stemp_expression1"}]

#根据符号来启动对应的计算模块
function large_number:expre_evalu_sci_complex/ope_of_float/ope_index with storage large_number:math

#tellraw @a [{storage:"large_number:math",nbt:"stemp_expression1"}," ",{storage:"large_number:math",nbt:"_expressionss1"}," ",{storage:"large_number:math",nbt:"_expressionss2"}," ",{storage:"large_number:math",nbt:"_expressionss3"}]

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

execute if score #expression_evaluation_test2 large_number.int matches 1.. run data remove storage large_number:math temp_expression_s1[-1]
execute if score #expression_evaluation_test2 large_number.int matches 2.. run data remove storage large_number:math temp_expression_s1[-1]
#tellraw @a {"nbt":"_expressionss3","storage": "large_number:math"}
#data modify storage large_number:math _expressionss3 set string storage large_number:math _expressionss3 0 -1
data modify storage large_number:math temp_expression_s1 append from storage large_number:math _expressionss3

#tellraw @a {"nbt":"_expressionss3","storage": "large_number:math"}
