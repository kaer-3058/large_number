execute store result score #sstemp2 int run data get storage large_number:math sstemp2[0]
execute if score #sstemp2 int < #sstemp1 int run scoreboard players add #test_t int 1
data remove storage large_number:math sstemp2[0]
execute if data storage large_number:math sstemp2[0] run function large_number:determinant/inversion_number/loop2
