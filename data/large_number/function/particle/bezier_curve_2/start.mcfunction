##二阶贝塞尔曲线

#一千倍输入三点坐标，一万倍输入t的步长，输出相对坐标列表

#scoreboard players set #bezier_curve_II.P0.x large_number.int 0
#scoreboard players set #bezier_curve_II.P0.y large_number.int 0
#scoreboard players set #bezier_curve_II.P0.z large_number.int 0

#scoreboard players set #bezier_curve_II.P1.x large_number.int 0
#scoreboard players set #bezier_curve_II.P1.y large_number.int 0
#scoreboard players set #bezier_curve_II.P1.z large_number.int 0

#scoreboard players set #bezier_curve_II.P2.x large_number.int 0
#scoreboard players set #bezier_curve_II.P2.y large_number.int 0
#scoreboard players set #bezier_curve_II.P2.z large_number.int 0

#scoreboard players set #bezier_curve_II.t.size large_number.int 0

scoreboard players operation #sstemp1.x large_number.int = #bezier_curve_II.P1.x large_number.int
scoreboard players operation #sstemp1.y large_number.int = #bezier_curve_II.P1.y large_number.int
scoreboard players operation #sstemp1.z large_number.int = #bezier_curve_II.P1.z large_number.int

scoreboard players operation #sstemp1.x large_number.int -= #bezier_curve_II.P0.x large_number.int
scoreboard players operation #sstemp1.y large_number.int -= #bezier_curve_II.P0.y large_number.int
scoreboard players operation #sstemp1.z large_number.int -= #bezier_curve_II.P0.z large_number.int

scoreboard players operation #sstemp2.x large_number.int = #bezier_curve_II.P2.x large_number.int
scoreboard players operation #sstemp2.y large_number.int = #bezier_curve_II.P2.y large_number.int
scoreboard players operation #sstemp2.z large_number.int = #bezier_curve_II.P2.z large_number.int

scoreboard players operation #sstemp2.x large_number.int -= #bezier_curve_II.P0.x large_number.int
scoreboard players operation #sstemp2.y large_number.int -= #bezier_curve_II.P0.y large_number.int
scoreboard players operation #sstemp2.z large_number.int -= #bezier_curve_II.P0.z large_number.int

data modify storage large_number:math bezier_curve_II_list set value []

scoreboard players set #bezier_curve_II.t large_number.int 0
function large_number:particle/bezier_curve_2/loop
