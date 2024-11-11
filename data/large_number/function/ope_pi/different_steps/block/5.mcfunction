#除法
scoreboard players operation #large_list_div_const.divisor lan.pi_information = #loops lan.pi_information
scoreboard players operation #large_list_div_const.divisor lan.pi_information *= 2 const
scoreboard players add #large_list_div_const.divisor lan.pi_information 1
function large_number:ope_pi/different_steps/large_list_div_const/start
data modify storage large_number:pi_information stemp_sum_list append from storage large_number:pi_information sstemp2


scoreboard players add #loops lan.pi_information 1

scoreboard players set #if lan.pi_information 0
execute if score #loops lan.pi_information <= #length lan.pi_information unless score #pi.block2.times lan.pi_information matches 1231.. run scoreboard players set #if lan.pi_information 1

execute if score #if lan.pi_information matches 1 run scoreboard players set #pi.different_steps.mode lan.pi_information 2
execute if score #if lan.pi_information matches 1 run scoreboard players add #pi.block2.times lan.pi_information 1

execute if score #if lan.pi_information matches 0 run scoreboard players add #pi.different_steps.mode lan.pi_information 1

execute unless score #loops lan.pi_information <= #length lan.pi_information run scoreboard players set #pi.different_steps.mode lan.pi_information 12
