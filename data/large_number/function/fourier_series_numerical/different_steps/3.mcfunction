#A1
data modify storage large_number:math fourier_series_numerical.abnum set value "A1"
function large_number:fourier_series_numerical/different_steps/macro1 with storage large_number:math
function large_number:fourier_series_numerical/to_rev_polish_notation
scoreboard players set #temp_fourier_series_numerical.tick.start int 1
