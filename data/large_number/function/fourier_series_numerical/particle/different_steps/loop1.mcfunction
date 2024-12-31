execute store result storage large_number:math fourier_series_numerical.x double .001 run scoreboard players get #loop1 int

function large_number:fourier_series_numerical/ope/particle_ope_start
data modify storage large_number:math temp_xy[1] set from storage large_number:math list_sum.output

execute store result storage large_number:math temp_xy[0] double .001 run scoreboard players get #loop1 int
data modify storage large_number:math fourier_series_numerical_particle_Pos append from storage large_number:math temp_xy

scoreboard players add #temp_fourier_series_numerical_particle.loops int 1
scoreboard players operation #loop1 int += #fourier_series_numerical_particle.step int
execute unless score #loop1 int > #fourier_series_numerical_particle.b int if score #temp_fourier_series_numerical_particle.loops int < #fourier_series_numerical_particle.loops int run function large_number:fourier_series_numerical/particle/different_steps/loop1
