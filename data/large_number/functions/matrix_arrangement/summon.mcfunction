##显示

data modify storage large_number:math temp1 set from storage large_number:math matrix_arrangement_X
data modify storage large_number:math temp2 set from storage large_number:math matrix_arrangement_Z

execute if data storage large_number:math temp1[0] if data storage large_number:math temp2[0] run function large_number:matrix_arrangement/summon_loop
