execute store result score #temp2 lan.pi_information run data get storage large_number:pi_information sstemp1[0]
scoreboard players operation #temp1 lan.pi_information *= 10000 const
execute store result score #temp3 lan.pi_information run scoreboard players operation #temp1 lan.pi_information += #temp2 lan.pi_information
execute store result storage large_number:pi_information temp int 1 run scoreboard players operation #temp3 lan.pi_information /= #large_list_div_const.divisor lan.pi_information
data modify storage large_number:pi_information sstemp2 append from storage large_number:pi_information temp
scoreboard players operation #temp1 lan.pi_information %= #large_list_div_const.divisor lan.pi_information

data remove storage large_number:pi_information sstemp1[0]
execute if data storage large_number:pi_information sstemp1[0] run function large_number:ope_pi/single_use/large_list_div_const/loop
