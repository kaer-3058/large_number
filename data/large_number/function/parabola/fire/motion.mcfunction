#missile:motion

#运动时间自增1刻
scoreboard players add @s t 1

#计算(x,y,z)
scoreboard players operation #temp int = @s vx
scoreboard players operation #temp int *= @s t
execute store result entity @s Pos[0] double 0.0001 run scoreboard players operation #temp int += @s x

scoreboard players operation #temp int = @s vy
scoreboard players operation #temp int *= @s t
scoreboard players operation #temp1 int = @s t
scoreboard players operation #temp1 int *= @s t
scoreboard players operation #temp1 int *= #g/2 const
scoreboard players operation #temp int -= #temp1 int
execute store result entity @s Pos[1] double 0.0001 run scoreboard players operation #temp int += @s y

scoreboard players operation #temp int = @s vz
scoreboard players operation #temp int *= @s t
execute store result entity @s Pos[2] double 0.0001 run scoreboard players operation #temp int += @s z

execute at @s run particle end_rod ~ ~ ~ 0.0 0.0 0.0 0 1 force

#命中处理
#execute if score @s t >= @s int run function large_number:parabola/fire/explode
