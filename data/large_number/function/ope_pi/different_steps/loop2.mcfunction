data modify storage large_number:pi_information temp_x2 append value 41
data modify storage large_number:pi_information temp_x2 append value 8410
data modify storage large_number:pi_information temp_x2 append value 418
data modify storage large_number:pi_information temp_x2 append value 4100
data modify storage large_number:pi_information temp_x2 append value 4184
data modify storage large_number:pi_information temp_x2 append value 1004
data modify storage large_number:pi_information temp_x2 append value 1841
scoreboard players remove #temp2 lan.pi_information 28
execute if score #temp2 lan.pi_information matches 29.. run function large_number:ope_pi/different_steps/loop2