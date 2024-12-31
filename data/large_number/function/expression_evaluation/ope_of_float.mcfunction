#解析逆波兰式 - 浮点数算法
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:expression_evaluation/macro4.output with storage large_number:math

tellraw @a {"translate":"large_number.expression_evaluation.end","fallback": "\u00A77\u00A7o表达式解析完成"}
