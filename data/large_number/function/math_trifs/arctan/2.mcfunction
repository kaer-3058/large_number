##反正切 (角度制)

#公式：arctan(x)=atan2(x,1)

#data modify storage large_number:math arctan.input set value 20.47
#输入值必须是double

#计算：execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/arctan/start with storage large_number:math arctan

execute rotated ~ .0 run tp @s .0 .0 .0 ~ ~
execute store result score #atan2d int run data get entity @s Rotation[0] -10000

data modify storage large_number:math ty set string storage large_number:math arctan.input 0 1
execute unless data storage large_number:math {ty:"-"} unless score #atan2d int matches 0..1800000 run scoreboard players add #atan2d int 3600000
execute if data storage large_number:math {ty:"-"} unless score #atan2d int matches -1800000..0 run scoreboard players remove #atan2d int 3600000
execute store result storage large_number:math arctan.output double .0001 run scoreboard players get #atan2d int
