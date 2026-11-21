scoreboard players set #temp_implicit.loops large_number.int 0
execute unless score #implicit_Pos.loop1 large_number.int > #implicit.x_max large_number.int run function large_number:particle/implicit/loop2
execute if score #implicit_Pos.loop1 large_number.int > #implicit.x_max large_number.int run scoreboard players set #implicit_Pos.tick_start_deff2 large_number.int 2
