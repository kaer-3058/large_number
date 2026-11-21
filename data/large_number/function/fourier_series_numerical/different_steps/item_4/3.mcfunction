#A3
data modify storage large_number:math fourier_series_numerical.abnum set value "A4"
function large_number:fourier_series_numerical/different_steps/item_4/a2.macro with storage large_number:math
scoreboard players operation #lib.temp_all_tellraw_set large_number.int = #large_number.all_tellraw_set large_number.int
scoreboard players set #large_number.all_tellraw_set large_number.int 1
function large_number:expression_evaluation_scientific/to_rev_polish_notation
scoreboard players operation #large_number.all_tellraw_set large_number.int = #lib.temp_all_tellraw_set large_number.int
scoreboard players set #temp_fourier_series_numerical.tick.start large_number.int 1
