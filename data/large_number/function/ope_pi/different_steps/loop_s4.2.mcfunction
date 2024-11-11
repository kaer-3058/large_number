execute store result score #temp1 lan.pi_information store result score #temp2 lan.pi_information run data get storage large_number:pi_information sstemp2[-1]
execute store result storage large_number:pi_information stemp2 int 1 run scoreboard players operation #temp2 lan.pi_information %= 10000 const
data modify storage large_number:pi_information sstemp3 prepend from storage large_number:pi_information stemp2
execute store result score #temp3 lan.pi_information run data get storage large_number:pi_information sstemp2[-2]
scoreboard players operation #temp1 lan.pi_information /= 10000 const
execute store result storage large_number:pi_information stemp1 int 1 run scoreboard players operation #temp3 lan.pi_information += #temp1 lan.pi_information
data remove storage large_number:pi_information sstemp2[-1]
data remove storage large_number:pi_information sstemp2[-1]
data modify storage large_number:pi_information sstemp2 append from storage large_number:pi_information stemp1
execute if data storage large_number:pi_information sstemp2[1] run function large_number:ope_pi/different_steps/loop_s4.2
