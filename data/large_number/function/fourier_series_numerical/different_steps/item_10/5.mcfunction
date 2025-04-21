scoreboard players add #temp_fourier_series_numerical.items int 1

function large_number:fourier_series_numerical/different_steps/macro2 with storage large_number:math expression_evaluation.definite_integral
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_p
function large_number:division/float/start
data modify storage large_number:math fourier_series_numerical.function_b append from storage large_number:math float_division.output
data modify storage large_number:math temp_b10 set string storage large_number:math float_division.output 0 -1


execute if score #temp_fourier_series_numerical.items int <= #temp_fourier_series_numerical.items.max int run function large_number:fourier_series_numerical/different_steps/item_11/3
execute unless score #large_number.all_tellraw_set int matches 1 unless score #temp_fourier_series_numerical.items int <= #temp_fourier_series_numerical.items.max int if score #fourier_series_numerical.tell_mode int matches 1..2 run tellraw @a {"translate":"large_number.fourier_series_numerical.end","fallback": "\u00A77\u00A7o傅里叶级数计算完成！"}
execute unless score #temp_fourier_series_numerical.items int <= #temp_fourier_series_numerical.items.max int run scoreboard players set #temp_fourier_series_numerical.tick.start int 3058
