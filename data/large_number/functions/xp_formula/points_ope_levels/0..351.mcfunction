data modify storage math xp_points_ope_levels.remaining_points set value [I;0,0,0,0,0]
scoreboard players operation #temp1 int = #xp_2.input[4] int
execute if score #xp_2.input[4] int matches 0..6 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players get #temp1 int
execute if score #xp_2.input[4] int matches 0..6 run return 0
execute if score #xp_2.input[4] int matches 7..15 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 7
execute if score #xp_2.input[4] int matches 7..15 run return 1
execute if score #xp_2.input[4] int matches 16..26 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 16
execute if score #xp_2.input[4] int matches 16..26 run return 2
execute if score #xp_2.input[4] int matches 27..39 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 27
execute if score #xp_2.input[4] int matches 27..39 run return 3
execute if score #xp_2.input[4] int matches 40..54 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 40
execute if score #xp_2.input[4] int matches 40..54 run return 4
execute if score #xp_2.input[4] int matches 55..71 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 55
execute if score #xp_2.input[4] int matches 55..71 run return 5
execute if score #xp_2.input[4] int matches 72..90 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 72
execute if score #xp_2.input[4] int matches 72..90 run return 6
execute if score #xp_2.input[4] int matches 91..111 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 91
execute if score #xp_2.input[4] int matches 91..111 run return 7
execute if score #xp_2.input[4] int matches 112..134 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 112
execute if score #xp_2.input[4] int matches 112..134 run return 8
execute if score #xp_2.input[4] int matches 135..159 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 135
execute if score #xp_2.input[4] int matches 135..159 run return 9
execute if score #xp_2.input[4] int matches 160..186 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 160
execute if score #xp_2.input[4] int matches 160..186 run return 10
execute if score #xp_2.input[4] int matches 187..215 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 187
execute if score #xp_2.input[4] int matches 187..215 run return 11
execute if score #xp_2.input[4] int matches 216..246 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 216
execute if score #xp_2.input[4] int matches 216..246 run return 12
execute if score #xp_2.input[4] int matches 247..279 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 247
execute if score #xp_2.input[4] int matches 247..279 run return 13
execute if score #xp_2.input[4] int matches 280..314 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 280
execute if score #xp_2.input[4] int matches 280..314 run return 14
execute if score #xp_2.input[4] int matches 315..351 store result storage math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players remove #temp1 int 315
execute if score #xp_2.input[4] int matches 315..351 run return 15
