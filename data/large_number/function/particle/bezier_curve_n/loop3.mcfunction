##大循环
scoreboard players set #bezier_curve_N.1-t int 10000
scoreboard players operation #bezier_curve_N.1-t int -= #bezier_curve_N.t int


##计算x坐标
data modify storage large_number:math sstempa_s set from storage large_number:math sstempa
scoreboard players set #bezier_curve_N.loops int 0
scoreboard players operation #bezier_curve_N.loops2 int = #bezier_curve_N.order int
data modify storage large_number:math Store_temp_nCr set from storage large_number:math temp_nCr
data modify storage large_number:math temp_Pi set value []

execute if score #bezier_curve_N.loops int <= #bezier_curve_N.order int run function large_number:particle/bezier_curve_n/loop2

data modify storage large_number:math sstemps set from storage large_number:math temp_Pi
execute if data storage large_number:math sstemps[0] positioned .0 .0 .0 run function large_number:curve_length/univariate_function/loop3
data modify storage large_number:math buffer_all_xyz[0] set from storage large_number:math stemp9040cs99


##计算y坐标

data modify storage large_number:math sstempa_s set from storage large_number:math sstempb
scoreboard players set #bezier_curve_N.loops int 0
scoreboard players operation #bezier_curve_N.loops2 int = #bezier_curve_N.order int
data modify storage large_number:math Store_temp_nCr set from storage large_number:math temp_nCr
data modify storage large_number:math temp_Pi set value []

execute if score #bezier_curve_N.loops int <= #bezier_curve_N.order int run function large_number:particle/bezier_curve_n/loop2

data modify storage large_number:math sstemps set from storage large_number:math temp_Pi
execute if data storage large_number:math sstemps[0] positioned .0 .0 .0 run function large_number:curve_length/univariate_function/loop3
data modify storage large_number:math buffer_all_xyz[1] set from storage large_number:math stemp9040cs99


##计算z坐标

data modify storage large_number:math sstempa_s set from storage large_number:math sstempc
scoreboard players set #bezier_curve_N.loops int 0
scoreboard players operation #bezier_curve_N.loops2 int = #bezier_curve_N.order int
data modify storage large_number:math Store_temp_nCr set from storage large_number:math temp_nCr
data modify storage large_number:math temp_Pi set value []

execute if score #bezier_curve_N.loops int <= #bezier_curve_N.order int run function large_number:particle/bezier_curve_n/loop2

data modify storage large_number:math sstemps set from storage large_number:math temp_Pi
execute if data storage large_number:math sstemps[0] positioned .0 .0 .0 run function large_number:curve_length/univariate_function/loop3
data modify storage large_number:math buffer_all_xyz[2] set from storage large_number:math stemp9040cs99


data modify storage large_number:math bezier_curve_n_Pos append from storage large_number:math buffer_all_xyz
scoreboard players operation #bezier_curve_N.t int += #bezier_curve_N.t.size int
execute unless score #bezier_curve_N.t int matches 10001.. run function large_number:particle/bezier_curve_n/loop3
