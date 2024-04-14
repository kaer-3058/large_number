execute if data storage math temp1[0] run function large_number:infinite_digit_multiply/loop
data modify storage math temp_addi_list prepend from storage math stemp1
data modify storage math stemp1 set value []

data modify storage math temp1 set from storage math Infinite_digit_multiply.input1

data remove storage math temp2[-1]
execute if data storage math temp2[0] run function large_number:infinite_digit_multiply/loop2
