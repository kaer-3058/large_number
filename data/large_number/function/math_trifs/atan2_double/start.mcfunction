#计算平面向量的方向角。
#给出两个值，计算该坐标下的反正切值
#公式：atan2d(y,x)
#data modify storage large_number:math atan2_double.y set value 1.0
#data modify storage large_number:math atan2_double.x set value 1.0
#可以是double或float

#计算：
#execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/atan2_double/start

#输出(角度制)：
#storage large_number:math atan2_double.output

tp @s .0 .0 .0 .0 .0
data modify storage large_number:math temp_x set from storage large_number:math atan2_double.x
data modify storage large_number:math temp_y set from storage large_number:math atan2_double.y
data modify storage large_number:math temp_01 set value ""
data modify storage large_number:math temp_02 set value ""

#判断输入值是不是整数
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math temp_x
execute store success score #expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math temp_x
execute if score #expression_evaluation_test1 int matches 0 run data modify storage large_number:math temp_01 set value ".0"

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math temp_y
execute store success score #expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math temp_y
execute if score #expression_evaluation_test1 int matches 0 run data modify storage large_number:math temp_02 set value ".0"

function large_number:math_trifs/atan2_double/1.5 with storage large_number:math
