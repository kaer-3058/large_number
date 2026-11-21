execute store result storage large_number:math expression_evaluation_variables."ｙ" double .001 run scoreboard players get #implicit_Pos.loop2 large_number.int

execute store result storage large_number:math temp_xy[1] double .001 run scoreboard players get #implicit_Pos.loop2 large_number.int
scoreboard players operation #implicit_Pos.loop1 large_number.int = #implicit.x_min large_number.int
execute unless score #implicit_Pos.loop1 large_number.int > #implicit.x_max large_number.int run scoreboard players set #implicit_Pos.tick_start_deff2 large_number.int 3
execute if score #implicit_Pos.loop1 large_number.int > #implicit.x_max large_number.int run scoreboard players set #implicit_Pos.tick_start_deff2 large_number.int 2

scoreboard players operation #implicit_Pos.loop2 large_number.int += #implicit.step large_number.int
