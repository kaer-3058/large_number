data modify entity @s Pos[1] set from storage large_number:math temp_stirling_series_times_2
execute at @s run function large_number:gamma_function/stirling_of_large_number/macro7 with storage large_number:math
execute at @s run function large_number:gamma_function/stirling_of_large_number/macro8 with storage large_number:math
execute at @s run function large_number:gamma_function/stirling_of_large_number/macro9 with storage large_number:math
execute at @s run function large_number:gamma_function/stirling_of_large_number/macro10 with storage large_number:math
execute at @s run tp ~ ~1.0 ~
data modify storage large_number:math temp_stirling_series set from entity @s Pos[1]
tp .0 .0 .0
