scoreboard players set #temp_series_sum.of_array.loops int 0
execute unless score #temp_series_sum.of_array.loop int > #series_sum.of_score.max int run function large_number:series_sum/of_array/loop1

execute if score #temp_series_sum.of_array.loop int > #series_sum.of_score.max int run scoreboard players set #series_sum.of_array.start int 3
