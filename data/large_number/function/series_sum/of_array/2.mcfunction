scoreboard players set #temp_series_sum.of_array.loops large_number.int 0

scoreboard players set #sstempb large_number.int 0
execute if data storage large_number:math temp_series_sum_of_array[0] unless score #temp_series_sum.of_array.loop large_number.int > #series_sum.of_score.max large_number.int run scoreboard players set #sstempb large_number.int 1
execute if score #sstempb large_number.int matches 1 run function large_number:series_sum/of_array/loop1

execute if score #sstempb large_number.int matches 0 run scoreboard players set #series_sum.of_array.start large_number.int 3
