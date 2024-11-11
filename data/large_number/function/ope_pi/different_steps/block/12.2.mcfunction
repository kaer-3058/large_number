scoreboard players operation #temp_if_j lan.pi_information = #loops lan.pi_information
scoreboard players operation #temp_if_j lan.pi_information %= 2 const
execute if score #temp_if_j lan.pi_information matches 1 run function large_number:ope_pi/different_steps/loop_sum_if/subra
execute if score #temp_if_j lan.pi_information matches 0 run function large_number:ope_pi/different_steps/loop_sum_if/addi
#tellraw @a {"nbt":"temp9","storage": "large_number:pi_information"}

#去掉前导0
execute store result score #temp1 lan.pi_information run data get storage large_number:pi_information temp9[0]
execute if score #temp1 lan.pi_information matches 0 if data storage large_number:pi_information temp9[1] run function large_number:ope_pi/different_steps/loop_sum_if/del_leading_zeros

data remove storage large_number:pi_information stemp_sum_list[0]
data remove storage large_number:pi_information stemp_sum_list[0]
data modify storage large_number:pi_information stemp_sum_list prepend from storage large_number:pi_information temp9

scoreboard players add #loops lan.pi_information 1
