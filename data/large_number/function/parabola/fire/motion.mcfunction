#missile:motion

#运动时间自增1刻
scoreboard players add @s t 1

#计算(x,y,z)
scoreboard players operation #temp large_number.int = @s vx
scoreboard players operation #temp large_number.int *= @s t
execute store result entity @s Pos[0] double 0.0001 run scoreboard players operation #temp large_number.int += @s x

scoreboard players operation #temp large_number.int = @s vy
scoreboard players operation #temp large_number.int *= @s t
scoreboard players operation #temp1 large_number.int = @s t
scoreboard players operation #temp1 large_number.int *= @s t
scoreboard players operation #temp1 large_number.int *= #g/2 const
scoreboard players operation #temp large_number.int -= #temp1 large_number.int
execute store result entity @s Pos[1] double 0.0001 run scoreboard players operation #temp large_number.int += @s y

scoreboard players operation #temp large_number.int = @s vz
scoreboard players operation #temp large_number.int *= @s t
execute store result entity @s Pos[2] double 0.0001 run scoreboard players operation #temp large_number.int += @s z

execute at @s run particle end_rod ~ ~ ~ 0.0 0.0 0.0 0 1 force

#命中处理
#execute if score @s t >= @s int run function large_number:parabola/fire/explode
