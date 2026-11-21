scoreboard players set #temp_int.composite_simpson-s_rule_diff.loop1 large_number.int 0
execute if score #loops large_number.int matches 1.. run function large_number:definite_integral/composite_simpson-s_rule/0_1/different_steps/loop

execute unless score #loops large_number.int matches 1.. run scoreboard players set #int.composite_simpson-s_rule_info large_number.int 3
