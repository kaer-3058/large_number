#把数字代入变量
data remove storage large_number:math stemp_expression09
execute if data storage large_number:math {stemp_expression1:"α"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."α"
execute if data storage large_number:math {stemp_expression1:"β"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."β"
execute if data storage large_number:math {stemp_expression1:"δ"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."δ"
execute if data storage large_number:math {stemp_expression1:"ε"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."ε"
execute if data storage large_number:math {stemp_expression1:"η"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."η"
execute if data storage large_number:math {stemp_expression1:"λ"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."λ"
execute if data storage large_number:math {stemp_expression1:"μ"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."μ"
execute if data storage large_number:math {stemp_expression1:"ξ"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."ξ"
execute if data storage large_number:math {stemp_expression1:"ω"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."ω"
execute if data storage large_number:math {stemp_expression1:"ｘ"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."ｘ"
execute if data storage large_number:math {stemp_expression1:"ｙ"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."ｙ"
execute if data storage large_number:math {stemp_expression1:"ｚ"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."ｚ"
execute if data storage large_number:math {stemp_expression1:"ｔ"} run data modify storage large_number:math stemp_expression09 set from storage large_number:math expression_evaluation_variables."ｔ"
execute if data storage large_number:math {stemp_expression1:""} run data modify storage large_number:math stemp_expression09 set value {x:0d,i:0d}

#代入常数
execute if data storage large_number:math {stemp_expression1:"π"} run data modify storage large_number:math stemp_expression09 set value {x:3.14159265358979323846264338327950288419716939937510,i:0d}
execute if data storage large_number:math {stemp_expression1:"ｅ"} run data modify storage large_number:math stemp_expression09 set value {x:2.71828182845904523536028747135266249775724709369995,i:0d}
execute if data storage large_number:math {stemp_expression1:"γ"} run data modify storage large_number:math stemp_expression09 set value {x:0.57721566490153286060651209008240243104215933593992,i:0d}
execute if data storage large_number:math {stemp_expression1:"τ"} run data modify storage large_number:math stemp_expression09 set value {x:6.283185307179586476925286766559005768394338798750211,i:0d}

#转化为标准复数并加以标记
data modify storage large_number:math temp1 set value {x:0d,i:0d,is_variables:1b}
execute store success score #sstemp1 large_number.int run data modify storage large_number:math temp1.x set from storage large_number:math stemp_expression09.x
execute store success score #sstemp2 large_number.int run data modify storage large_number:math temp1.i set from storage large_number:math stemp_expression09.i
execute if score #sstemp1 large_number.int matches 0 if score #sstemp2 large_number.int matches 0 run data modify storage large_number:math temp1.x set from storage large_number:math stemp_expression09

execute if data storage large_number:math stemp_expression09 run data modify storage large_number:math temp_expression_s1 append from storage large_number:math temp1
execute unless data storage large_number:math stemp_expression09 run data modify storage large_number:math temp_expression_s1 append from storage large_number:math stemp_expression1
