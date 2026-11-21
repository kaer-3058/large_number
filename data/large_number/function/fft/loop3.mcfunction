data remove storage large_number:math temp_order_2[0]
scoreboard players add #temp1 large_number.int 1
execute if score #temp1 large_number.int < #temp_dft.span large_number.int run function large_number:fft/loop3
