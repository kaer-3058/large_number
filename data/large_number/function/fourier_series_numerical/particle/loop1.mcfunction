execute store result storage large_number:math fourier_series_numerical.x double .001 run scoreboard players get #loop1 large_number.int

function large_number:fourier_series_numerical/ope/particle_ope_start
data modify storage large_number:math temp_xy[1] set from storage large_number:math list_sum.output

execute store result storage large_number:math temp_xy[0] double .001 run scoreboard players get #loop1 large_number.int
data modify storage large_number:math fourier_series_numerical_particle_Pos append from storage large_number:math temp_xy

scoreboard players operation #loop1 large_number.int += #fourier_series_numerical_particle.step large_number.int
execute unless score #loop1 large_number.int > #fourier_series_numerical_particle.b large_number.int run function large_number:fourier_series_numerical/particle/loop1
