##单位向量法测距离 - 任意两点

#输入
#data modify storage large_number:math unit_vector2.P1 set value [0.0,0.0,0.0]
#data modify storage large_number:math unit_vector2.P2 set value [0.0,0.0,0.0]

#执行
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:unit_vector_for_distance

rotate @s .0 .0
execute store result score #v1.x large_number.int run data get storage large_number:math unit_vector2.P1[0] 100.0
execute store result score #v1.y large_number.int run data get storage large_number:math unit_vector2.P1[1] 100.0
execute store result score #v1.z large_number.int run data get storage large_number:math unit_vector2.P1[2] 100.0

execute store result score #v2.x large_number.int run data get storage large_number:math unit_vector2.P2[0] 100.0
execute store result score #v2.y large_number.int run data get storage large_number:math unit_vector2.P2[1] 100.0
execute store result score #v2.z large_number.int run data get storage large_number:math unit_vector2.P2[2] 100.0

execute store result storage large_number:math buffer_all_xyz[0] double 0.0001 run scoreboard players operation #v2.x large_number.int -= #v1.x large_number.int
execute store result storage large_number:math buffer_all_xyz[1] double 0.0001 run scoreboard players operation #v2.y large_number.int -= #v1.y large_number.int
execute store result storage large_number:math buffer_all_xyz[2] double 0.0001 run scoreboard players operation #v2.z large_number.int -= #v1.z large_number.int

data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage large_number:math buffer_all_xyz set from entity @s Pos

execute store result score #i.x large_number.int run data get storage large_number:math buffer_all_xyz[0] 10000.0
execute store result score #i.y large_number.int run data get storage large_number:math buffer_all_xyz[1] 10000.0
execute store result score #i.z large_number.int run data get storage large_number:math buffer_all_xyz[2] 10000.0

execute if score #v2.x large_number.int matches ..-1 run scoreboard players operation #v2.x large_number.int *= -1 const
execute if score #v2.y large_number.int matches ..-1 run scoreboard players operation #v2.y large_number.int *= -1 const
execute if score #v2.z large_number.int matches ..-1 run scoreboard players operation #v2.z large_number.int *= -1 const
execute if score #i.x large_number.int matches ..-1 run scoreboard players operation #i.x large_number.int *= -1 const
execute if score #i.y large_number.int matches ..-1 run scoreboard players operation #i.y large_number.int *= -1 const
execute if score #i.z large_number.int matches ..-1 run scoreboard players operation #i.z large_number.int *= -1 const

scoreboard players operation #v2.x large_number.int += #v2.y large_number.int
execute store result score #temp1 large_number.int run scoreboard players operation #v2.x large_number.int += #v2.z large_number.int
scoreboard players operation #i.x large_number.int += #i.y large_number.int
scoreboard players operation #i.x large_number.int += #i.z large_number.int

#模除
scoreboard players operation #v2.x large_number.int /= #i.x large_number.int
scoreboard players operation #v2.x large_number.int *= 1000 const
scoreboard players operation #temp1 large_number.int %= #i.x large_number.int
scoreboard players operation #temp1 large_number.int *= 1000 const
scoreboard players operation #temp1 large_number.int /= #i.x large_number.int
execute store result score #distance large_number.int run scoreboard players operation #v2.x large_number.int += #temp1 large_number.int


#最后的除法应该这么算
#比如被除数是a，除数是b
#temp = a
#a /= b
#a *= 1000
#temp %= b
#temp *= 1000
#temp /= b
#a += temp

#b是单位向量的曼哈顿距离，所以它不超过✓3
#比如当成2吧
#如果b的倍率是10000
#temp %b以后不会超过b
#所以再乘一次1000倍率，最大也就20000000，不会溢出
