execute store result score #temp2 int run scoreboard players operation #temp1 int = #heart-shaped_line.t2 int
scoreboard players operation #temp1 int -= #loop int
scoreboard players operation #temp1 int *= 1800000 const

#x坐标

#cos
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/heart-shaped_line/3

scoreboard players operation #temp1 int *= -1 const
execute store result storage large_number:math q3 double -.00000001 store result storage large_number:math q0 double .00000001 run scoreboard players add #temp1 int 10000
execute store result storage large_number:math q1 int 1 run scoreboard players get #r/2 int
function large_number:particle/heart-shaped_line/macro2 with storage large_number:math
data modify storage large_number:math sstemp0[0] set from storage large_number:math q0

#y坐标
scoreboard players operation #temp1 int = #heart-shaped_line.r int
execute store result storage large_number:math temp1 int -3.1415926535897932384626 run scoreboard players operation #temp1 int *= #loop int
execute store result score #temp1 int run data get storage large_number:math temp1
scoreboard players operation #temp2 int *= 2 const
execute store result storage large_number:math sstemp0[1] double .0001 run scoreboard players operation #temp1 int /= #temp2 int
data modify storage large_number:math heart-shaped_line_Pos append from storage large_number:math sstemp0

#轴对称点
function large_number:particle/heart-shaped_line/macro3 with storage large_number:math
data modify storage large_number:math sstemp0[0] set from storage large_number:math q0
data modify storage large_number:math heart-shaped_line_Pos append from storage large_number:math sstemp0

scoreboard players add #loop int 1
execute if score #loop int <= #heart-shaped_line.t2 int run function large_number:particle/heart-shaped_line/loop2
