##反正切 (角度制)

#公式：arctan(x)=atan2(x,1)

#data modify storage large_number:math arctan.input set value 20.47
#输入值必须是double

#计算：execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/arctan/start with storage large_number:math arctan

execute rotated ~ .0 run tp @s .0 .0 .0 ~ ~
execute store result storage large_number:math arctan.output float -.0000001 run data get entity @s Rotation[0] 10000000
