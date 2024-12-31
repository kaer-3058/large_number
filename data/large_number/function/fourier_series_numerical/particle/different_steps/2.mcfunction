scoreboard players set #temp_fourier_series_numerical_particle.loops int 0
execute unless score #loop1 int > #fourier_series_numerical_particle.b int run function large_number:fourier_series_numerical/particle/different_steps/loop1


execute if score #loop1 int > #fourier_series_numerical_particle.b int if score #fourier_series_numerical.tell_mode int matches 1..2 run tellraw @a {"translate":"large_number.fourier_series_numerical_particle.end","fallback":"\u00A77\u00A7o傅里叶级数展开式的图像绘制完成"}
execute if score #loop1 int > #fourier_series_numerical_particle.b int run scoreboard players set #fourier_series_numerical_particle.start int 3
