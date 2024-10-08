data modify storage large_number:math temp0 set from storage large_number:math temp_lnb_points[0]
data modify storage large_number:math stemp1 set from storage large_number:math temp0[0]
data modify storage large_number:math stemp2 set from storage large_number:math temp0[1]
data modify storage large_number:math stemp3 set from storage large_number:math temp0[2]
function large_number:particle/bezier_curve_2/particle.macro1 with storage large_number:math
data remove storage large_number:math temp_lnb_points[0]