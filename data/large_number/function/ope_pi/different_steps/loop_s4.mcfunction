execute store result score #temp1 lan.pi_information run data get storage large_number:pi_information sstemp1[-1]
execute store result storage large_number:pi_information stemp1 int 1 run scoreboard players operation #temp1 lan.pi_information *= 4 const
data remove storage large_number:pi_information sstemp1[-1]
data modify storage large_number:pi_information sstemp2 prepend from storage large_number:pi_information stemp1
execute if data storage large_number:pi_information sstemp1[0] run function large_number:ope_pi/different_steps/loop_s4
