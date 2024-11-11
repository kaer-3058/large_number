##算出级数的每一项

#除法，除以常数
function large_number:ope_pi/different_steps/large_list_div_const_x1/start
function large_number:ope_pi/different_steps/large_list_div_const_x2/start

#递归减
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information temp_x1
data modify storage large_number:pi_information temp2 set from storage large_number:pi_information temp_x2
data modify storage large_number:pi_information temp9 set value []
execute if data storage large_number:pi_information temp1[-2] run function large_number:ope_pi/loop_subra/loop3.1
execute if data storage large_number:pi_information temp1[-1] run function large_number:ope_pi/loop_subra/loop3.2
data modify storage large_number:pi_information sstemp1 set from storage large_number:pi_information temp9

#除法
scoreboard players operation #large_list_div_const.divisor lan.pi_information = #loops lan.pi_information
scoreboard players operation #large_list_div_const.divisor lan.pi_information *= 2 const
scoreboard players add #large_list_div_const.divisor lan.pi_information 1
function large_number:ope_pi/different_steps/large_list_div_const/start
data modify storage large_number:pi_information stemp_sum_list append from storage large_number:pi_information sstemp2


scoreboard players add #loops lan.pi_information 1
execute if score #loops lan.pi_information <= #length lan.pi_information run function large_number:ope_pi/different_steps/loop_each_item
