execute store result storage large_number:math sstemp1 double .001 run scoreboard players operation #temp1 int += #3d_straight_line.density int
data modify storage large_number:math 3d_straight_line_Pos append from storage large_number:math sstemp1
execute unless score #temp1 int > #3d_straight_line.length int run function large_number:particle/3d_straight_line/loop
