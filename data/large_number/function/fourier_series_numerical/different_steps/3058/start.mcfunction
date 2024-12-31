execute store result score #temp_fourier_series_numerical.items int run data get storage large_number:math fourier_series_numerical.items

execute if score #temp_fourier_series_numerical.items int matches 1.. run function large_number:fourier_series_numerical/different_steps/3058/macro1 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 2.. run function large_number:fourier_series_numerical/different_steps/3058/macro2 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 3.. run function large_number:fourier_series_numerical/different_steps/3058/macro3 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 4.. run function large_number:fourier_series_numerical/different_steps/3058/macro4 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 5.. run function large_number:fourier_series_numerical/different_steps/3058/macro5 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 6.. run function large_number:fourier_series_numerical/different_steps/3058/macro6 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 7.. run function large_number:fourier_series_numerical/different_steps/3058/macro7 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 8.. run function large_number:fourier_series_numerical/different_steps/3058/macro8 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 9.. run function large_number:fourier_series_numerical/different_steps/3058/macro9 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 10.. run function large_number:fourier_series_numerical/different_steps/3058/macro10 with storage large_number:math

execute if score #temp_fourier_series_numerical.items int matches 11.. run function large_number:fourier_series_numerical/different_steps/3058/macro11 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 12.. run function large_number:fourier_series_numerical/different_steps/3058/macro12 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 13.. run function large_number:fourier_series_numerical/different_steps/3058/macro13 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 14.. run function large_number:fourier_series_numerical/different_steps/3058/macro14 with storage large_number:math
execute if score #temp_fourier_series_numerical.items int matches 15.. run function large_number:fourier_series_numerical/different_steps/3058/macro15 with storage large_number:math

data modify storage large_number:math fourier_series_numerical.expression set from storage large_number:math test233

scoreboard players set #temp_fourier_series_numerical.tick.start int -7
