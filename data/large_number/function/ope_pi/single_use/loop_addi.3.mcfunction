execute store result score #temp1 lan.pi_information store result score #temp2 lan.pi_information run data get storage large_number:pi_information temp1[0]
execute store result storage large_number:pi_information stemp2 int 1 run scoreboard players operation #temp2 lan.pi_information %= 10000 const
execute store result storage large_number:pi_information stemp1 int 1 run scoreboard players operation #temp1 lan.pi_information /= 10000 const
data modify storage large_number:pi_information temp9 prepend from storage large_number:pi_information stemp2
data modify storage large_number:pi_information temp9 prepend from storage large_number:pi_information stemp1
