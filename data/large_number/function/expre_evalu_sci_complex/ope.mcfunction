#解析逆波兰式 - 复函数

data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
scoreboard players set #temp_expression_evaluation_error large_number.int -1
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expre_evalu_sci_complex/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
scoreboard players set #temp1 large_number.int 0
function large_number:expre_evalu_sci_complex/macro4.output with storage large_number:math
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math expression_evaluation.output set from storage large_number:math temp1

execute store result storage large_number:math expression_evaluation.error_type int 1 run scoreboard players get #temp_expression_evaluation_error large_number.int
execute if score #temp_expression_evaluation_error large_number.int matches 1.. run data modify storage large_number:math expression_evaluation.output set value "NaNd"

execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate":"large_number.expression_evaluation.end","fallback": "\u00A77\u00A7o表达式解析完成"}
