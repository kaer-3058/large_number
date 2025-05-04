scoreboard players set #temp_int.composite_simpson-s_rule_diff.loop1 int 0
execute if score #int.composite_simpson-s_rule_diff.loop1 int <= #int.composite_simpson-s_rule.n int run function large_number:definite_integral/composite_simpson-s_rule/different_steps/loop

execute unless score #int.composite_simpson-s_rule_diff.loop1 int <= #int.composite_simpson-s_rule.n int run scoreboard players set #int.composite_simpson-s_rule_info int 3
