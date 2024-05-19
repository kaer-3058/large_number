execute if data storage large_number:math temp1[0] run function large_number:infinite_digit_multiply/loop
data modify storage large_number:math temp_addi_list prepend from storage large_number:math stemp1
data modify storage large_number:math stemp1 set value []

data modify storage large_number:math temp1 set from storage large_number:math Infinite_digit_multiply.input1

data remove storage large_number:math temp2[-1]
execute if data storage large_number:math temp2[0] run function large_number:infinite_digit_multiply/loop2
