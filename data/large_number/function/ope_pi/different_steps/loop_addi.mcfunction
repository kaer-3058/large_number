execute store result score #temp1 lan.pi_information run data get storage large_number:pi_information temp1[-1]
execute store result score #temp2 lan.pi_information run data get storage large_number:pi_information temp2[-1]
execute store result score #5.4 lan.pi_information run scoreboard players operation #temp1 lan.pi_information += #temp2 lan.pi_information
scoreboard players operation #5.4 lan.pi_information /= 10000 const
execute store result storage large_number:pi_information stemp2 int 1 run scoreboard players operation #temp1 lan.pi_information %= 10000 const
execute store result score #5.3 lan.pi_information run data get storage large_number:pi_information temp1[-2]
execute store result storage large_number:pi_information stemp1 int 1 run scoreboard players operation #5.3 lan.pi_information += #5.4 lan.pi_information
data remove storage large_number:pi_information temp1[-1]
data remove storage large_number:pi_information temp1[-1]
data remove storage large_number:pi_information temp2[-1]
data modify storage large_number:pi_information temp1 append from storage large_number:pi_information stemp1
data modify storage large_number:pi_information temp9 prepend from storage large_number:pi_information stemp2
execute if data storage large_number:pi_information temp2[0] run function large_number:ope_pi/different_steps/loop_addi
