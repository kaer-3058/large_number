#递归减
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information stemp_sum_list[0]
data modify storage large_number:pi_information temp2 set from storage large_number:pi_information stemp_sum_list[1]
data modify storage large_number:pi_information temp9 set value []
execute if data storage large_number:pi_information temp1[-2] run function large_number:ope_pi/loop_subra/loop3.1
execute if data storage large_number:pi_information temp1[-1] run function large_number:ope_pi/loop_subra/loop3.2
