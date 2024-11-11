function large_number:particle/equiangular_spiral/macro.float_multiply_out/1 with storage large_number:math
execute rotated as @s run function large_number:particle/equiangular_spiral/macro.float_multiply_out/2 with storage large_number:math
data modify storage large_number:math equiangular_spiral_out_listX append from entity @s Pos[2]
data modify storage large_number:math equiangular_spiral_out_listY append from entity @s Pos[0]
tp .0 .0 .0
