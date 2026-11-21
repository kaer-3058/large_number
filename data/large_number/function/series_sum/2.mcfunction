scoreboard players set #temp_series_sum.loops large_number.int 0
execute unless score #temp_series_sum.loop large_number.int > #series_sum.max large_number.int run function large_number:series_sum/loop1

execute if score #temp_series_sum.loop large_number.int > #series_sum.max large_number.int run scoreboard players set #series_sum.start large_number.int 3
