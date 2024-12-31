function large_number:fourier_series_numerical/different_steps/macro2 with storage large_number:math expression_evaluation.definite_integral
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_p
function large_number:division/float/start
data modify storage large_number:math fourier_series_numerical.function_a append from storage large_number:math float_division.output
data modify storage large_number:math temp_a12 set string storage large_number:math float_division.output 0 -1

#B3
data modify storage large_number:math fourier_series_numerical.abnum set value "B12"
function large_number:fourier_series_numerical/different_steps/item_12/b2.macro with storage large_number:math
function large_number:fourier_series_numerical/to_rev_polish_notation

scoreboard players set #temp_fourier_series_numerical.tick.start int 1
