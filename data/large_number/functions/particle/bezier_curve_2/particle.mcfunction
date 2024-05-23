##显示

data modify storage large_number:math temp1 set from storage large_number:math bezier_curve_II_list
execute if data storage large_number:math temp1[0] run function large_number:particle/bezier_curve_2/particle_loop
