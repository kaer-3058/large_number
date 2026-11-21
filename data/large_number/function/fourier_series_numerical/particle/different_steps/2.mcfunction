scoreboard players set #temp_fourier_series_numerical_particle.loops large_number.int 0
execute unless score #loop1 large_number.int > #fourier_series_numerical_particle.b large_number.int run function large_number:fourier_series_numerical/particle/different_steps/loop1


execute unless score #large_number.all_tellraw_set large_number.int matches 1 if score #loop1 large_number.int > #fourier_series_numerical_particle.b large_number.int if score #fourier_series_numerical.tell_mode large_number.int matches 1..2 run tellraw @a {"translate":"large_number.fourier_series_numerical_particle.end","fallback":"\u00A77\u00A7o傅里叶级数展开式的图像绘制完成"}
execute if score #loop1 large_number.int > #fourier_series_numerical_particle.b large_number.int run scoreboard players set #fourier_series_numerical_particle.start large_number.int 3
