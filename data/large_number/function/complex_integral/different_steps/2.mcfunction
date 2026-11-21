scoreboard players set #temp_int.composite_simpson-s_rule_diff.loop1 large_number.int 0
execute if score #complex_integral_method1_diff.loop1 large_number.int <= #complex_integral_method1.n large_number.int run function large_number:complex_integral/different_steps/loop

execute unless score #complex_integral_method1_diff.loop1 large_number.int <= #complex_integral_method1.n large_number.int run scoreboard players set #complex_integral_method1_info large_number.int 3
