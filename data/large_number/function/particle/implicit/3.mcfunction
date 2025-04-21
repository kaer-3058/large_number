scoreboard players set #temp_implicit.loops int 0
execute unless score #implicit_Pos.loop1 int > #implicit.x_max int run function large_number:particle/implicit/loop2
execute if score #implicit_Pos.loop1 int > #implicit.x_max int run scoreboard players set #implicit_Pos.tick_start_deff2 int 2
