execute store result score #temp lan.pi_information run data get storage large_number:pi_information sstemp3[-1]
execute store result storage large_number:pi_information temp1 int 1 run scoreboard players add #temp lan.pi_information 10000
data modify storage large_number:pi_information temp1 set string storage large_number:pi_information temp1 1
data modify storage large_number:pi_information pi prepend from storage large_number:pi_information temp1

data remove storage large_number:pi_information sstemp3[-1]
execute if data storage large_number:pi_information sstemp3[1] run function large_number:ope_pi/single_use/loop_to_string
