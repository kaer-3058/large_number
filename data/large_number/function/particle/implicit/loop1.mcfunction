execute store result storage large_number:math expression_evaluation_variables."ｙ" double .001 run scoreboard players get #implicit_Pos.loop2 int

execute store result storage large_number:math temp_xy[1] double .001 run scoreboard players get #implicit_Pos.loop2 int
scoreboard players operation #implicit_Pos.loop1 int = #implicit.x_min int
execute unless score #implicit_Pos.loop1 int > #implicit.x_max int run scoreboard players set #implicit_Pos.tick_start_deff2 int 3
execute if score #implicit_Pos.loop1 int > #implicit.x_max int run scoreboard players set #implicit_Pos.tick_start_deff2 int 2

scoreboard players operation #implicit_Pos.loop2 int += #implicit.step int
