execute store result storage large_number:math temp_a int 1 run data get storage large_number:math temp_order[0]
function large_number:fft/macro3 with storage large_number:math

data remove storage large_number:math temp_order[0]
execute if data storage large_number:math temp_order[0] run function large_number:fft/loop4
