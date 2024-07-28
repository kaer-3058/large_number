scoreboard players set #bezier_curve_II.2t(1-t) int 10000
scoreboard players operation #bezier_curve_II.2t(1-t) int -= #bezier_curve_II.t int
scoreboard players operation #bezier_curve_II.2t(1-t) int *= #bezier_curve_II.t int
execute store result storage large_number:math sstemp1 double 0.00000000001 run scoreboard players operation #bezier_curve_II.2t(1-t) int *= 2 const

scoreboard players operation #bezier_curve_II.t^2 int = #bezier_curve_II.t int
execute store result storage large_number:math sstemp2 double 0.00000000001 run scoreboard players operation #bezier_curve_II.t^2 int *= #bezier_curve_II.t^2 int

function large_number:particle/bezier_curve_2/macro1 with storage large_number:math
data modify storage large_number:math buffer_all_xyz[0] set from storage large_number:math sstemp11
data modify storage large_number:math buffer_all_xyz[1] set from storage large_number:math sstemp21
data modify storage large_number:math buffer_all_xyz[2] set from storage large_number:math sstemp31
execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/bezier_curve_2/as_entity

data modify storage large_number:math bezier_curve_II_list append from storage large_number:math buffer_all_xyz

scoreboard players operation #bezier_curve_II.t int += #bezier_curve_II.t.size int
execute unless score #bezier_curve_II.t int matches 10001.. run function large_number:particle/bezier_curve_2/loop
