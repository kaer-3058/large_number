data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp_series_sum_of_array[0]

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:series_sum/of_array/macro1 with storage large_number:math

data modify storage large_number:math series_sum_sum append from storage large_number:math temp1

scoreboard players add #temp_series_sum.of_array.loops int 1
scoreboard players add #temp_series_sum.of_array.loop int 1
data remove storage large_number:math temp_series_sum_of_array[0]
execute if data storage large_number:math temp_series_sum_of_array[0] if score #temp_series_sum.of_array.loops int < #series_sum.of_score.loops int run function large_number:series_sum/of_array/loop1
