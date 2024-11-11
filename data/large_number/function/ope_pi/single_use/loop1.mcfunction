scoreboard players remove #temp1 lan.pi_information 4
data modify storage large_number:pi_information temp_x1 prepend value 0
execute if score #temp1 lan.pi_information matches 5.. run function large_number:ope_pi/single_use/loop1