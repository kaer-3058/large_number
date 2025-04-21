##计算日月高度角

#The following code takes the time of day as input and outputs the angle of the Sun (multiplied by 100000 for precision). If the angle is 0, the Sun is directly east. Angle of 90, Sun is north, etc. The Moon's position is opposite of the sun (360-sun\_angle=moon\_angle).

#给定的代码输入一天中的时间，然后输出太阳的角度（为了精度，角度乘以了100000）。如果太阳的角度为0，则太阳位于正东方向；如果角度为90，太阳位于正北方向，依此类推。而月亮的位置与太阳相反（即月亮的角度 = 360 - 太阳的角度）。

#输入：execute store result score #sun_altitude_angle.input int run time query daytime

scoreboard players operation #sun_altitude_angle.input int *= 100 const
scoreboard players operation #sun_altitude_angle.input int /= 24 const
scoreboard players operation #sun_altitude_angle.input int -= 25000 const

scoreboard players operation #_b int = #sun_altitude_angle.input int
scoreboard players operation #_b int /= 100000 const
scoreboard players operation #_b int *= 100000 const

scoreboard players operation #sun_altitude_angle.input int -= #_b int

scoreboard players operation #sun_altitude_angle.output int = #sun_altitude_angle.input int
scoreboard players operation #sun_altitude_angle.output int *= 240 const

scoreboard players operation #sun_altitude_angle.input int *= 180 const
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:sun_altitude_angle/cos
scoreboard players operation #sun_altitude_angle.input int *= 60 const

scoreboard players operation #sun_altitude_angle.output int -= #sun_altitude_angle.input int
scoreboard players operation #sun_altitude_angle.output int += 15000000 const
scoreboard players operation #sun_altitude_angle.output int %= 36000000 const
