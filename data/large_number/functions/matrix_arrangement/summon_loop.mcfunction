data modify storage large_number:math stemp1 set from storage large_number:math temp1[0]
data modify storage large_number:math stemp2 set from storage large_number:math temp2[0]
function large_number:matrix_arrangement/summon.macro1 with storage large_number:math

data remove storage large_number:math temp1[0]
data remove storage large_number:math temp2[0]
execute if data storage large_number:math temp1[0] run function large_number:matrix_arrangement/summon_loop
