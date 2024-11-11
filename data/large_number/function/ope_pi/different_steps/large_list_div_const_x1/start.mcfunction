##迭代法无穷位大数除法 - 无穷位数组整除五~六位整数


data modify storage large_number:pi_information sstemp1 set from storage large_number:pi_information temp_x1
data modify storage large_number:pi_information sstemp2 set value []

#递归
scoreboard players set #temp1 lan.pi_information 0
execute if data storage large_number:pi_information sstemp1[0] run function large_number:ope_pi/different_steps/large_list_div_const_x1/loop

#去掉前导0
execute store result score #temp1 lan.pi_information run data get storage large_number:pi_information sstemp2[0]
execute if score #temp1 lan.pi_information matches 0 if data storage large_number:pi_information sstemp2[1] run function large_number:ope_pi/different_steps/large_list_div_const_x1/del_leading_zeros

data modify storage large_number:pi_information temp_x1 set from storage large_number:pi_information sstemp2
