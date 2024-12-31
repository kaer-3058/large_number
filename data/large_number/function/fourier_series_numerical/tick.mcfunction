##解析信号以开启函数的对应部分

#开始
execute if score #temp_fourier_series_numerical.tick.start int matches 0 run function large_number:fourier_series_numerical/start

#定积分运算
execute if score #temp_fourier_series_numerical.tick.start int matches 1 run function large_number:fourier_series_numerical/int_diff/1
execute if score #temp_fourier_series_numerical.tick.start int matches 2 run function large_number:fourier_series_numerical/int_diff/2
execute if score #temp_fourier_series_numerical.tick.start int matches 3 run function large_number:fourier_series_numerical/int_diff/3

#A1
execute if score #temp_fourier_series_numerical.tick.start int matches 4 run function large_number:fourier_series_numerical/different_steps/2
execute if score #temp_fourier_series_numerical.tick.start int matches 5 run function large_number:fourier_series_numerical/different_steps/4
execute if score #temp_fourier_series_numerical.tick.start int matches 6 run function large_number:fourier_series_numerical/different_steps/5

#A2~A10
execute if score #temp_fourier_series_numerical.tick.start int matches 7 run function large_number:fourier_series_numerical/different_steps/item_2/4
execute if score #temp_fourier_series_numerical.tick.start int matches 8 run function large_number:fourier_series_numerical/different_steps/item_2/5
execute if score #temp_fourier_series_numerical.tick.start int matches 9 run function large_number:fourier_series_numerical/different_steps/item_3/4
execute if score #temp_fourier_series_numerical.tick.start int matches 10 run function large_number:fourier_series_numerical/different_steps/item_3/5
execute if score #temp_fourier_series_numerical.tick.start int matches 11 run function large_number:fourier_series_numerical/different_steps/item_4/4
execute if score #temp_fourier_series_numerical.tick.start int matches 12 run function large_number:fourier_series_numerical/different_steps/item_4/5
execute if score #temp_fourier_series_numerical.tick.start int matches 13 run function large_number:fourier_series_numerical/different_steps/item_5/4
execute if score #temp_fourier_series_numerical.tick.start int matches 14 run function large_number:fourier_series_numerical/different_steps/item_5/5
execute if score #temp_fourier_series_numerical.tick.start int matches 15 run function large_number:fourier_series_numerical/different_steps/item_6/4
execute if score #temp_fourier_series_numerical.tick.start int matches 16 run function large_number:fourier_series_numerical/different_steps/item_6/5
execute if score #temp_fourier_series_numerical.tick.start int matches 17 run function large_number:fourier_series_numerical/different_steps/item_7/4
execute if score #temp_fourier_series_numerical.tick.start int matches 18 run function large_number:fourier_series_numerical/different_steps/item_7/5
execute if score #temp_fourier_series_numerical.tick.start int matches 19 run function large_number:fourier_series_numerical/different_steps/item_8/4
execute if score #temp_fourier_series_numerical.tick.start int matches 20 run function large_number:fourier_series_numerical/different_steps/item_8/5
execute if score #temp_fourier_series_numerical.tick.start int matches 21 run function large_number:fourier_series_numerical/different_steps/item_9/4
execute if score #temp_fourier_series_numerical.tick.start int matches 22 run function large_number:fourier_series_numerical/different_steps/item_9/5
execute if score #temp_fourier_series_numerical.tick.start int matches 23 run function large_number:fourier_series_numerical/different_steps/item_10/4
execute if score #temp_fourier_series_numerical.tick.start int matches 24 run function large_number:fourier_series_numerical/different_steps/item_10/5

execute if score #temp_fourier_series_numerical.tick.start int matches 25 run function large_number:fourier_series_numerical/different_steps/item_11/4
execute if score #temp_fourier_series_numerical.tick.start int matches 26 run function large_number:fourier_series_numerical/different_steps/item_11/5
execute if score #temp_fourier_series_numerical.tick.start int matches 27 run function large_number:fourier_series_numerical/different_steps/item_12/4
execute if score #temp_fourier_series_numerical.tick.start int matches 28 run function large_number:fourier_series_numerical/different_steps/item_12/5
execute if score #temp_fourier_series_numerical.tick.start int matches 29 run function large_number:fourier_series_numerical/different_steps/item_13/4
execute if score #temp_fourier_series_numerical.tick.start int matches 30 run function large_number:fourier_series_numerical/different_steps/item_13/5
execute if score #temp_fourier_series_numerical.tick.start int matches 31 run function large_number:fourier_series_numerical/different_steps/item_14/4
execute if score #temp_fourier_series_numerical.tick.start int matches 32 run function large_number:fourier_series_numerical/different_steps/item_14/5
execute if score #temp_fourier_series_numerical.tick.start int matches 33 run function large_number:fourier_series_numerical/different_steps/item_15/4
execute if score #temp_fourier_series_numerical.tick.start int matches 34 run function large_number:fourier_series_numerical/different_steps/item_15/5

execute if score #temp_fourier_series_numerical.tick.start int matches 3058 run function large_number:fourier_series_numerical/different_steps/3058/start
