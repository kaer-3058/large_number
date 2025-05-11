#x^p
execute store result storage large_number:math exp_any.input.base double .0001 run scoreboard players get #loop int
function large_number:exp_any/2

#浮点减法  r^p-x^p
data modify storage large_number:math temp1 set from storage large_number:math temp_r_p
data modify storage large_number:math temp2 set from storage large_number:math exp_any.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

#n次方根  (r^p-x^p)^(1/p)
data modify storage large_number:math exp_any.input.base set from storage large_number:math temp1
function large_number:exp_any/n_root

#星形线可拆分为八个相同部分，因此是一次性算好八个点
data modify storage large_number:math sstempu set value [[0d,0d],[0d,0d],[0d,0d],[0d,0d],[0d,0d],[0d,0d],[0d,0d],[0d,0d]]
execute store result storage large_number:math sstempu[0][0] double .0001 store result storage large_number:math sstempu[1][0] double .0001 run scoreboard players get #loop int
execute store result storage large_number:math sstempu[2][0] double -.0001 store result storage large_number:math sstempu[3][0] double -.0001 run scoreboard players get #loop int
execute store result storage large_number:math sstempu[0][1] double .0001 store result storage large_number:math sstempu[2][1] double .0001 run data get storage large_number:math exp_any.output 10000
execute store result storage large_number:math sstempu[1][1] double -.0001 store result storage large_number:math sstempu[3][1] double -.0001 run data get storage large_number:math exp_any.output 10000
execute store result storage large_number:math sstempu[4][1] double .0001 store result storage large_number:math sstempu[5][1] double .0001 run scoreboard players get #loop int
execute store result storage large_number:math sstempu[6][1] double -.0001 store result storage large_number:math sstempu[7][1] double -.0001 run scoreboard players get #loop int
execute store result storage large_number:math sstempu[4][0] double .0001 store result storage large_number:math sstempu[6][0] double .0001 run data get storage large_number:math exp_any.output 10000
execute store result storage large_number:math sstempu[5][0] double -.0001 store result storage large_number:math sstempu[7][0] double -.0001 run data get storage large_number:math exp_any.output 10000

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/star_line/as_entity_1

data modify storage large_number:math star_line_Pos append from storage large_number:math sstempu[]

scoreboard players operation #loop int += #star_line.step int
execute unless score #loop int > #temp_cut.point int run function large_number:particle/star_line/loop2
