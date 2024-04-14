##把三点坐标解析为二次函数表达式的abc
#解方程组法，用加减消元法解三点对应的三元一次方程组
#放大一千倍输出

#data modify storage math parabola_points set value [[0.0,0.0],[0.0,0.0],[0.0,0.0]]

execute store result score #a1 int run data get storage math parabola_points[0][0] 10
execute store result score #c1 int run data get storage math parabola_points[0][1] 10
execute store result score #a2 int run data get storage math parabola_points[1][0] 10
execute store result score #c2 int run data get storage math parabola_points[1][1] 10
execute store result score #a3 int run data get storage math parabola_points[2][0] 10
execute store result score #c3 int run data get storage math parabola_points[2][1] 10

scoreboard players operation #b1 int = #a1 int
scoreboard players operation #b2 int = #a2 int
scoreboard players operation #b3 int = #a3 int
scoreboard players operation #a1 int *= #a1 int
scoreboard players operation #a2 int *= #a2 int
scoreboard players operation #a3 int *= #a3 int

execute store result score #u2 int run scoreboard players operation #u1 int = #a1 int
execute store result score #v2 int run scoreboard players operation #v1 int = #b1 int
execute store result score #w2 int run scoreboard players operation #w1 int = #c1 int

scoreboard players operation #u1 int -= #a2 int
scoreboard players operation #v1 int -= #b2 int
scoreboard players operation #w1 int -= #c2 int
scoreboard players operation #u2 int -= #a3 int
scoreboard players operation #v2 int -= #b3 int
scoreboard players operation #w2 int -= #c3 int

scoreboard players operation #i1 int = #u1 int
scoreboard players operation #k1 int = #w1 int
scoreboard players operation #i2 int = #u2 int
scoreboard players operation #k2 int = #w2 int

scoreboard players operation #i1 int *= #v2 int
scoreboard players operation #k1 int *= #v2 int
scoreboard players operation #i2 int *= #v1 int
scoreboard players operation #k2 int *= #v1 int

scoreboard players operation #i1 int -= #i2 int
scoreboard players operation #k1 int -= #k2 int
scoreboard players operation #k1 int *= 10000 const
execute store result score #coef.a int run scoreboard players operation #k1 int /= #i1 int

scoreboard players operation #k1 int /= 10 const
scoreboard players operation #k1 int *= #u1 int
scoreboard players operation #coef.b int = #w1 int
scoreboard players operation #coef.b int *= 1000 const
scoreboard players operation #coef.b int -= #k1 int
scoreboard players operation #coef.b int /= #v1 int

scoreboard players operation #a1 int *= #coef.a int
scoreboard players operation #a1 int /= 100 const
scoreboard players operation #b1 int *= #coef.b int
scoreboard players operation #b1 int /= 10 const
scoreboard players operation #c1 int *= 100 const
scoreboard players operation #c1 int -= #a1 int
execute store result score #coef.c int run scoreboard players operation #c1 int -= #b1 int
