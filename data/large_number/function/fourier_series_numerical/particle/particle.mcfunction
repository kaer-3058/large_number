##显示

data modify storage large_number:math temp1 set from storage large_number:math fourier_series_numerical_particle_Pos
execute if data storage large_number:math temp1[0] run function large_number:fourier_series_numerical/particle/particle_loop
