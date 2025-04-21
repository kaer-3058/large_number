##反正切 (角度制)

#公式：arctan(x)=atan2(x,1)

#data modify storage large_number:math arctan.input set value 20.47
#输入值必须是double

#计算：execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/arctan/start

tp @s .0 .0 .0 .0 .0
data modify storage large_number:math temp_x set from storage large_number:math arctan.input
data modify storage large_number:math temp_01 set value ""

#判断输入值是不是整数
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math temp_x
execute store success score #expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math temp_x
execute if score #expression_evaluation_test1 int matches 0 run data modify storage large_number:math temp_01 set value ".0"

function large_number:math_trifs/arctan/1.5 with storage large_number:math
