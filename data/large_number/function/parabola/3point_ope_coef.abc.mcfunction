##把三点坐标解析为二次函数表达式的abc
#解方程组法，用加减消元法解三点对应的三元一次方程组
#放大一千倍输出

#data modify storage large_number:math parabola_points set value [[0.0,0.0],[0.0,0.0],[0.0,0.0]]

execute store result score #a1 large_number.int run data get storage large_number:math parabola_points[0][0] 10
execute store result score #c1 large_number.int run data get storage large_number:math parabola_points[0][1] 10
execute store result score #a2 large_number.int run data get storage large_number:math parabola_points[1][0] 10
execute store result score #c2 large_number.int run data get storage large_number:math parabola_points[1][1] 10
execute store result score #a3 large_number.int run data get storage large_number:math parabola_points[2][0] 10
execute store result score #c3 large_number.int run data get storage large_number:math parabola_points[2][1] 10

scoreboard players operation #b1 large_number.int = #a1 large_number.int
scoreboard players operation #b2 large_number.int = #a2 large_number.int
scoreboard players operation #b3 large_number.int = #a3 large_number.int
scoreboard players operation #a1 large_number.int *= #a1 large_number.int
scoreboard players operation #a2 large_number.int *= #a2 large_number.int
scoreboard players operation #a3 large_number.int *= #a3 large_number.int

execute store result score #u2 large_number.int run scoreboard players operation #u1 large_number.int = #a1 large_number.int
execute store result score #v2 large_number.int run scoreboard players operation #v1 large_number.int = #b1 large_number.int
execute store result score #w2 large_number.int run scoreboard players operation #w1 large_number.int = #c1 large_number.int

scoreboard players operation #u1 large_number.int -= #a2 large_number.int
scoreboard players operation #v1 large_number.int -= #b2 large_number.int
scoreboard players operation #w1 large_number.int -= #c2 large_number.int
scoreboard players operation #u2 large_number.int -= #a3 large_number.int
scoreboard players operation #v2 large_number.int -= #b3 large_number.int
scoreboard players operation #w2 large_number.int -= #c3 large_number.int

scoreboard players operation #i1 large_number.int = #u1 large_number.int
scoreboard players operation #k1 large_number.int = #w1 large_number.int
scoreboard players operation #i2 large_number.int = #u2 large_number.int
scoreboard players operation #k2 large_number.int = #w2 large_number.int

scoreboard players operation #i1 large_number.int *= #v2 large_number.int
scoreboard players operation #k1 large_number.int *= #v2 large_number.int
scoreboard players operation #i2 large_number.int *= #v1 large_number.int
scoreboard players operation #k2 large_number.int *= #v1 large_number.int

scoreboard players operation #i1 large_number.int -= #i2 large_number.int
scoreboard players operation #k1 large_number.int -= #k2 large_number.int
scoreboard players operation #k1 large_number.int *= 10000 const
execute store result score #coef.a large_number.int run scoreboard players operation #k1 large_number.int /= #i1 large_number.int

scoreboard players operation #k1 large_number.int /= 10 const
scoreboard players operation #k1 large_number.int *= #u1 large_number.int
scoreboard players operation #coef.b large_number.int = #w1 large_number.int
scoreboard players operation #coef.b large_number.int *= 1000 const
scoreboard players operation #coef.b large_number.int -= #k1 large_number.int
scoreboard players operation #coef.b large_number.int /= #v1 large_number.int

scoreboard players operation #a1 large_number.int *= #coef.a large_number.int
scoreboard players operation #a1 large_number.int /= 100 const
scoreboard players operation #b1 large_number.int *= #coef.b large_number.int
scoreboard players operation #b1 large_number.int /= 10 const
scoreboard players operation #c1 large_number.int *= 100 const
scoreboard players operation #c1 large_number.int -= #a1 large_number.int
execute store result score #coef.c large_number.int run scoreboard players operation #c1 large_number.int -= #b1 large_number.int
