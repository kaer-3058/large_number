execute store result storage large_number:math expression_evaluation_variables."ｘ" double 1 run scoreboard players get #temp_series_sum.loop large_number.int

#解析逆波兰式 - 实函数
function large_number:expression_evaluation_scientific/ope_no_tell
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.output

data modify storage large_number:math series_sum_sum append from storage large_number:math temp1

scoreboard players add #temp_series_sum.loops large_number.int 1
scoreboard players operation #temp_series_sum.loop large_number.int += #series_sum.step large_number.int
execute unless score #temp_series_sum.loop large_number.int > #series_sum.max large_number.int if score #temp_series_sum.loops large_number.int < #series_sum.loops large_number.int run function large_number:series_sum/loop1
