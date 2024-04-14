data modify entity @s Pos[1] set from storage math store_exp_e_x_input
execute at @s run tp @s ~ ~1.0 ~
data modify storage math store_exp_e_x_input set from entity @s Pos[1]
tp @s 0.0 0.0 0.0