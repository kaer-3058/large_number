execute unless score #implicit_Pos.loop2 large_number.int > #implicit.y_max large_number.int run function large_number:particle/implicit/loop1


execute unless score #large_number.all_tellraw_set large_number.int matches 1 if score #implicit_Pos.loop2 large_number.int > #implicit.y_max large_number.int run tellraw @a {"translate":"large_number.implicit.end","fallback":"\u00A77\u00A7o隐式方程图像绘制完成"}
execute if score #implicit_Pos.loop2 large_number.int > #implicit.y_max large_number.int run scoreboard players set #implicit_Pos.tick_start_deff2 large_number.int 5
