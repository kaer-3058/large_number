scoreboard players set #test_t int 0
data modify storage large_number:math sstemp2 set from storage large_number:math sstemp1
execute store result score #sstemp1 int run data get storage large_number:math sstemp2[0]
data remove storage large_number:math sstemp2[0]
execute if data storage large_number:math sstemp2[0] run function large_number:determinant/inversion_number/loop2

scoreboard players operation #invers_num.output int += #test_t int
data remove storage large_number:math sstemp1[0]
execute if data storage large_number:math sstemp1[0] run function large_number:determinant/inversion_number/loop1
