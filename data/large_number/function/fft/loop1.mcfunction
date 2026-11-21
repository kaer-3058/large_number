scoreboard players set #temp_dft.k large_number.int 0
scoreboard players set #temp_dft.loops_2 large_number.int 0
execute store result storage large_number:math temp_dft_span int 1 run scoreboard players operation #temp_dft.span large_number.int = #temp_dft.loops large_number.int
data modify storage large_number:math temp_order_2 set from storage large_number:math temp_order
execute if data storage large_number:math temp_order_2[0] run function large_number:fft/loop2

scoreboard players operation #temp_dft.n large_number.int *= 2 const
scoreboard players operation #temp_dft.loops large_number.int *= 2 const
execute if score #temp_dft.n large_number.int <= #temp_dft.N large_number.int run function large_number:fft/loop1
