##直线

#总长度：#3d_straight_line.length int
#点的间隔：#3d_straight_line.density int

data modify storage large_number:math 3d_straight_line_Pos set value [0.0]
scoreboard players set #temp1 int 0
function large_number:particle/3d_straight_line/loop
data remove storage large_number:math 3d_straight_line_Pos[-1]
