function large_number:ope_pi/different_steps/block/11.2
execute unless score #loops lan.pi_information <= #length lan.pi_information run scoreboard players set #pi.different_steps.mode lan.pi_information 12
execute if score #loops lan.pi_information <= #length lan.pi_information run function large_number:ope_pi/different_steps/block/11.2