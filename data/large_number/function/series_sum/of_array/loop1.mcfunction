data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp_series_sum_of_array[0]

#解析逆波兰式 - 实函数
function large_number:expression_evaluation_scientific/ope_no_tell
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.output

data modify storage large_number:math series_sum_sum append from storage large_number:math temp1

scoreboard players add #temp_series_sum.of_array.loops large_number.int 1
scoreboard players add #temp_series_sum.of_array.loop large_number.int 1
data remove storage large_number:math temp_series_sum_of_array[0]
execute if data storage large_number:math temp_series_sum_of_array[0] if score #temp_series_sum.of_array.loops large_number.int < #series_sum.of_score.loops large_number.int run function large_number:series_sum/of_array/loop1
