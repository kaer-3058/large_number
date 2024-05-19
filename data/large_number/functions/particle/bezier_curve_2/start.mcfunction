##二阶贝塞尔曲线

#一千倍输入三点坐标，一万倍输入t的步长，输出相对坐标列表

#scoreboard players set #bezier_curve_II.P0.x int 0
#scoreboard players set #bezier_curve_II.P0.y int 0
#scoreboard players set #bezier_curve_II.P0.z int 0

#scoreboard players set #bezier_curve_II.P1.x int 0
#scoreboard players set #bezier_curve_II.P1.y int 0
#scoreboard players set #bezier_curve_II.P1.z int 0

#scoreboard players set #bezier_curve_II.P2.x int 0
#scoreboard players set #bezier_curve_II.P2.y int 0
#scoreboard players set #bezier_curve_II.P2.z int 0

#scoreboard players set #bezier_curve_II.t.size int 0

scoreboard players operation #sstemp1.x int = #bezier_curve_II.P1.x int
scoreboard players operation #sstemp1.y int = #bezier_curve_II.P1.y int
scoreboard players operation #sstemp1.z int = #bezier_curve_II.P1.z int

scoreboard players operation #sstemp1.x int -= #bezier_curve_II.P0.x int
scoreboard players operation #sstemp1.y int -= #bezier_curve_II.P0.y int
scoreboard players operation #sstemp1.z int -= #bezier_curve_II.P0.z int

scoreboard players operation #sstemp2.x int = #bezier_curve_II.P2.x int
scoreboard players operation #sstemp2.y int = #bezier_curve_II.P2.y int
scoreboard players operation #sstemp2.z int = #bezier_curve_II.P2.z int

scoreboard players operation #sstemp2.x int -= #bezier_curve_II.P0.x int
scoreboard players operation #sstemp2.y int -= #bezier_curve_II.P0.y int
scoreboard players operation #sstemp2.z int -= #bezier_curve_II.P0.z int

data modify storage large_number:math bezier_curve_II_list set value []

scoreboard players set #bezier_curve_II.t int 0
function large_number:particle/bezier_curve_2/loop
