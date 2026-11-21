scoreboard players set #temp_series_sum.of_array.loops large_number.int 0
execute unless score #temp_series_sum.of_array.loop large_number.int > #series_sum.of_score.max large_number.int run function large_number:series_sum/of_array/loop1

execute if score #temp_series_sum.of_array.loop large_number.int > #series_sum.of_score.max large_number.int run scoreboard players set #series_sum.of_array.start large_number.int 3
