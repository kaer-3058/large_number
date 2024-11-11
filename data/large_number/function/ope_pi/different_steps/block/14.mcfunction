execute if data storage large_number:pi_information stemp_sum_list[1] run function large_number:ope_pi/different_steps/block/12.2
execute store success score #is- lan.pi_information if score #loops lan.pi_information matches 4201..
execute unless data storage large_number:pi_information stemp_sum_list[1] run scoreboard players set #pi.different_steps.mode lan.pi_information 23
execute if data storage large_number:pi_information stemp_sum_list[1] run function large_number:ope_pi/different_steps/block/12.2
execute store success score #is- lan.pi_information if score #loops lan.pi_information matches 4201..
execute if score #is- lan.pi_information matches 1 run scoreboard players add #pi.different_steps.mode lan.pi_information 8
execute unless data storage large_number:pi_information stemp_sum_list[1] run scoreboard players set #pi.different_steps.mode lan.pi_information 23
