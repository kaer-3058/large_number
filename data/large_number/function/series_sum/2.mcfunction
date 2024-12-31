scoreboard players set #temp_series_sum.loops int 0
execute unless score #temp_series_sum.loop int > #series_sum.max int run function large_number:series_sum/loop1

execute if score #temp_series_sum.loop int > #series_sum.max int run scoreboard players set #series_sum.start int 3
