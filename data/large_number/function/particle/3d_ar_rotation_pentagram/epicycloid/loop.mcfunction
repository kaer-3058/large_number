execute store result entity @s Rotation[0] float .0001 run scoreboard players get #temp1 int
execute store result storage large_number:math temp1 double .0001 run scoreboard players get #temp_center_r int
function large_number:particle/3d_ar_rotation_pentagram/epicycloid/macro1 with storage large_number:math

#进行圆周运动
scoreboard players operation #temp1 int -= #3d.pentagram_epi_circu.speed int
scoreboard players add #loops int 1
execute store result entity @s Rotation[0] float .0001 run scoreboard players operation #Store_θ int += #3d.pentagram_epi.speed int

execute if score #loops int <= #temp_max_loop int positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_rotation_pentagram/epicycloid/loop
