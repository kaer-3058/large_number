#递归减
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information temp_x1
data modify storage large_number:pi_information temp2 set from storage large_number:pi_information temp_x2
data modify storage large_number:pi_information temp9 set value []
execute if data storage large_number:pi_information temp1[-2] run function large_number:ope_pi/loop_subra/loop3.1
execute if data storage large_number:pi_information temp1[-1] run function large_number:ope_pi/loop_subra/loop3.2
data modify storage large_number:pi_information sstemp1 set from storage large_number:pi_information temp9

scoreboard players add #pi.different_steps.mode lan.pi_information 1