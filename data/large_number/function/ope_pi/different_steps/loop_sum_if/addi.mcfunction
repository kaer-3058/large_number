#递归加
execute store result score #temp1 lan.pi_information run data get storage large_number:pi_information stemp_sum_list[0]
execute store result score #temp2 lan.pi_information run data get storage large_number:pi_information stemp_sum_list[1]
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information stemp_sum_list[0]
data modify storage large_number:pi_information temp2 set from storage large_number:pi_information stemp_sum_list[1]
execute if score #temp2 lan.pi_information > #temp1 lan.pi_information run data modify storage large_number:pi_information temp1 set from storage large_number:pi_information stemp_sum_list[1]
execute if score #temp2 lan.pi_information > #temp1 lan.pi_information run data modify storage large_number:pi_information temp2 set from storage large_number:pi_information stemp_sum_list[0]
data modify storage large_number:pi_information temp9 set value []
execute if data storage large_number:pi_information temp2[0] run function large_number:ope_pi/different_steps/loop_addi

#剩余元素的进位
execute if data storage large_number:pi_information temp1[1] run function large_number:ope_pi/different_steps/loop_addi.2
execute if data storage large_number:pi_information temp1[0] run function large_number:ope_pi/different_steps/loop_addi.3
