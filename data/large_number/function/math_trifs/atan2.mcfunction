#计算平面向量的方向角。
#给出两个值，计算该坐标下的反正切值
#输入：#y int  #x int
#公式：atan2d(y,x)

#计算：
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:math_trifs/atan2

#输出(角度制)：
#data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0]

tp @s .0 .0 .0 .0 .0
execute store result storage large_number:math buffer_all_xyz[0] double -0.0001 run scoreboard players get #y int
execute store result storage large_number:math buffer_all_xyz[2] double 0.0001 run scoreboard players get #x int
#tellraw @a [{"score":{"name": "#arcsin_cos.input","objective": "int"}}," ",{"score":{"name": "#y","objective": "int"}}," ",{"score":{"name": "#x","objective": "int"}}]
#tellraw @a {"nbt":"Pos","entity": "@s"}
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s .0 .0 .0 ~ ~
#tellraw @a {"nbt":"Rotation","entity": "@s"}

execute store result score #atan2d int run data get entity @s Rotation[0] 10000
execute if score #x int matches 0.. if score #y int matches 0.. unless score #atan2d int matches 0..900000 run scoreboard players add #atan2d int 3600000
execute if score #x int matches ..-1 if score #y int matches 0.. unless score #atan2d int matches 900000..1800000 run scoreboard players add #atan2d int 3600000
execute if score #x int matches ..-1 if score #y int matches ..-1 unless score #atan2d int matches -1800000..-900000 run scoreboard players remove #atan2d int 3600000
execute if score #x int matches 0.. if score #y int matches ..-1 unless score #atan2d int matches -900000..0 run scoreboard players remove #atan2d int 3600000
execute if score #atan2d int matches -1800000 run scoreboard players set #atan2d int 1800000


#复现条件：按顺序执行如下命令：
#scoreboard players set #arcsin_cos.input int -2300
#function large_number:math_trifs/arccos   -> 观察它的tellraw
#data modify storage large_number:math expression_evaluation.input set value "(exp2.1455)+(sin17.4)^3+(cos-16.5)²+(arcsin0.14)+(arccos-0.23)+(ln17.66E2)+(√54554.38802)/2.12"
#function large_number:expression_evaluation_scientific/to_rev_polish_notation  -> 执行后看到弹出提示再进行下一步
#function large_number:expression_evaluation_scientific/ope  -> 执行后看到弹出提示再进行下一步，然后观察它的tellraw
#function large_number:math_trifs/arccos   -> 观察它的tellraw

#tellraw有三行，第一行的三个值从左往右是：输入、atan2d的y值、atan2d的x值。第二行是实体进行set Pos后的Pos，第三行是tp后的实体的Rotation


#2024.11.2的紧急更新：出于1.21.3的Rotation的角度具有不稳定的特性，给atan2d和arctan函数加上了角度修正算法。
#不稳定的特性是指：比如让一个实体旋转45度然后获取它的角度，有时候是45度，有时候是-315度，虽然在朝向上他们是等价的，但是拿它来做数学运算是天差地别。
