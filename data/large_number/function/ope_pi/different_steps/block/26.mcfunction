#进位
data modify storage large_number:pi_information sstemp3 set value []
execute if data storage large_number:pi_information sstemp2[1] run function large_number:ope_pi/different_steps/loop_s4.2
execute if data storage large_number:pi_information sstemp2[0] run function large_number:ope_pi/different_steps/loop_s4.3


scoreboard players add #pi.different_steps.mode lan.pi_information 1
