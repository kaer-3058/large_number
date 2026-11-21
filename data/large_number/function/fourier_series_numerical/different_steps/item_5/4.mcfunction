function large_number:fourier_series_numerical/different_steps/macro2 with storage large_number:math expression_evaluation.definite_integral
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_p
function large_number:division/float/start
data modify storage large_number:math fourier_series_numerical.function_a append from storage large_number:math float_division.output
data modify storage large_number:math temp_a5 set string storage large_number:math float_division.output 0 -1

#B3
data modify storage large_number:math fourier_series_numerical.abnum set value "B5"
function large_number:fourier_series_numerical/different_steps/item_5/b2.macro with storage large_number:math
scoreboard players operation #lib.temp_all_tellraw_set large_number.int = #large_number.all_tellraw_set large_number.int
scoreboard players set #large_number.all_tellraw_set large_number.int 1
function large_number:expression_evaluation_scientific/to_rev_polish_notation
scoreboard players operation #large_number.all_tellraw_set large_number.int = #lib.temp_all_tellraw_set large_number.int

scoreboard players set #temp_fourier_series_numerical.tick.start large_number.int 1
