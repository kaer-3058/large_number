data remove storage large_number:pi_information sstemp3[0]
execute store result score #temp1 lan.pi_information run data get storage large_number:pi_information sstemp3[0]
execute if score #temp1 lan.pi_information matches 0 if data storage large_number:pi_information sstemp3[1] run function large_number:ope_pi/single_use/s4_del_leading_zeros
