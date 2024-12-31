data modify storage large_number:math list_sum.input set from storage large_number:math series_sum_sum
function large_number:list_operation/sum/start
data modify storage large_number:math series_sum_output set from storage large_number:math list_sum.output

scoreboard players set #series_sum.of_array.start int 4
tellraw @a {"translate":"large_number.series_sum.diff_end","fallback":"\u00A77\u00A7o级数求和计算完成"}
