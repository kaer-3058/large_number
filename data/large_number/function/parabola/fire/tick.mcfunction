#missile:tick

execute as @e[tag=missile_shot] unless score @s t >= @s int run function large_number:parabola/fire/motion
