data remove storage large_number:pi_information sstemp2[0]
execute store result score #temp1 lan.pi_information run data get storage large_number:pi_information sstemp2[0]
execute if score #temp1 lan.pi_information matches 0 if data storage large_number:pi_information sstemp2[1] run function large_number:ope_pi/different_steps/large_list_div_const/del_leading_zeros
