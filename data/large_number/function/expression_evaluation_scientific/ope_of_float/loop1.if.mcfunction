#把数字代入变量
execute if data storage large_number:math {stemp_expression1:"α"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."α" 0 -1
execute if data storage large_number:math {stemp_expression1:"β"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."β" 0 -1
execute if data storage large_number:math {stemp_expression1:"δ"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."δ" 0 -1
execute if data storage large_number:math {stemp_expression1:"ε"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."ε" 0 -1
execute if data storage large_number:math {stemp_expression1:"η"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."η" 0 -1
execute if data storage large_number:math {stemp_expression1:"λ"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."λ" 0 -1
execute if data storage large_number:math {stemp_expression1:"μ"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."μ" 0 -1
execute if data storage large_number:math {stemp_expression1:"ξ"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."ξ" 0 -1
execute if data storage large_number:math {stemp_expression1:"ω"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."ω" 0 -1
execute if data storage large_number:math {stemp_expression1:"ｘ"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."ｘ" 0 -1
execute if data storage large_number:math {stemp_expression1:"ｙ"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."ｙ" 0 -1
execute if data storage large_number:math {stemp_expression1:"ｚ"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."ｚ" 0 -1
execute if data storage large_number:math {stemp_expression1:"ｔ"} run data modify storage large_number:math stemp_expression1 set string storage large_number:math expression_evaluation_variables."ｔ" 0 -1
execute if data storage large_number:math {stemp_expression1:""} run data modify storage large_number:math stemp_expression1 set value "0.0"

#代入常数
execute if data storage large_number:math {stemp_expression1:"π"} run data modify storage large_number:math stemp_expression1 set value "3.14159265358979323846264338327950288419716939937510"
execute if data storage large_number:math {stemp_expression1:"ｅ"} run data modify storage large_number:math stemp_expression1 set value "2.71828182845904523536028747135266249775724709369995"
execute if data storage large_number:math {stemp_expression1:"γ"} run data modify storage large_number:math stemp_expression1 set value "0.57721566490153286060651209008240243104215933593992"
execute if data storage large_number:math {stemp_expression1:"τ"} run data modify storage large_number:math stemp_expression1 set value "6.283185307179586476925286766559005768394338798750211"

data modify storage large_number:math temp_expression_s1 append from storage large_number:math stemp_expression1
