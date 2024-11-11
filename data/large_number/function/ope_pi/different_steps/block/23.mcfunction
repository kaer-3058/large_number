#三部分相加

#递归减
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information temp_s1
data modify storage large_number:pi_information temp2 set from storage large_number:pi_information temp_s2
data modify storage large_number:pi_information temp9 set value []
execute if data storage large_number:pi_information temp1[-2] run function large_number:ope_pi/loop_subra/loop3.1
execute if data storage large_number:pi_information temp1[-1] run function large_number:ope_pi/loop_subra/loop3.2
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information temp9


scoreboard players add #pi.different_steps.mode lan.pi_information 1
