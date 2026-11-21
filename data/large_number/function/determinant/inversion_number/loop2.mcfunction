execute store result score #sstemp2 large_number.int run data get storage large_number:math sstemp2[0]
execute if score #sstemp2 large_number.int < #sstemp1 large_number.int run scoreboard players add #test_t large_number.int 1
data remove storage large_number:math sstemp2[0]
execute if data storage large_number:math sstemp2[0] run function large_number:determinant/inversion_number/loop2
