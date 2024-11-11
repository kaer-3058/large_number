#s*4
data modify storage large_number:pi_information sstemp2 set value []
execute if data storage large_number:pi_information sstemp1[0] run function large_number:ope_pi/different_steps/loop_s4


scoreboard players add #pi.different_steps.mode lan.pi_information 1
