data modify storage large_number:math sstemp1 set from storage large_number:math temp1[0][0]
data modify storage large_number:math sstemp2 set from storage large_number:math temp1[0][1]
data modify storage large_number:math sstemp3 set from storage large_number:math temp1[0][2]
function large_number:particle/3d_block_hsphere/set/set with storage large_number:math

data remove storage large_number:math temp1[0]
execute if data storage large_number:math temp1[0] run function large_number:particle/3d_block_hsphere/set/loop
