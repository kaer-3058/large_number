execute store result entity @s Rotation[0] float .0001 run scoreboard players get #temp1 large_number.int
execute store result storage large_number:math temp1 double .0001 run scoreboard players get #temp_center_r large_number.int
function large_number:particle/3d_ar_rotation_pentagram/epicycloid/macro1 with storage large_number:math

#进行圆周运动
scoreboard players operation #temp1 large_number.int -= #3d.pentagram_epi_circu.speed large_number.int
scoreboard players add #loops large_number.int 1
execute store result entity @s Rotation[0] float .0001 run scoreboard players operation #Store_θ large_number.int += #3d.pentagram_epi.speed large_number.int

execute if score #loops large_number.int <= #temp_max_loop large_number.int positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_rotation_pentagram/epicycloid/loop
