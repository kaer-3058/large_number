##N阶贝塞尔曲线 - 多tick绘制法

#data modify storage large_number:math bezier_curve_N_input set value []
#data modify storage large_number:math bezier_curve_N_input set value [[80.53327412400547d, 70.0d, -10.415578849420953d], [80.48320434763545d, 81.0d, -10.45320665493354d], [72.4587502815431d, 82.0d, 0.4828503464197471d], [72.46377528715864d, 70.0d, 0.4513856142506847d], [65.42754948340058d, 70.0d, 12.69010062208451d], [65.29733593096364d, 91.0d, 12.673135434650552d]]
#按顺序输入各个控制点的三维坐标，阶数=点数-1
#支持1~33阶

#单tick绘制几个点(不可小于1)：scoreboard players set #bezier_curve_n.diff_loops int 3
#开始信号：scoreboard players set #bezier_curve_n.diff_start int 1
#需要tick执行：function large_number:particle/bezier_curve_n/different_steps/tick

#scoreboard players set #bezier_curve_N.t.size int 100

tellraw @a {"translate":"large_number.bezier_curve_n.diff_start","fallback":"\u00A77\u00A7oN阶贝塞尔曲线开始计算"}

execute store result score #bezier_curve_N.order int if data storage large_number:math bezier_curve_N_input[]
scoreboard players remove #bezier_curve_N.order int 1

#把各个点都换算成以第一个点为原点的相对坐标
data modify storage large_number:math sstempa set value [0d]
data modify storage large_number:math sstempb set value [0d]
data modify storage large_number:math sstempc set value [0d]
data modify storage large_number:math sstempa0 set value []
data modify storage large_number:math sstempb0 set value []
data modify storage large_number:math sstempc0 set value []
data modify storage large_number:math sstempa0 append from storage large_number:math bezier_curve_N_input[][0]
data modify storage large_number:math sstempb0 append from storage large_number:math bezier_curve_N_input[][1]
data modify storage large_number:math sstempc0 append from storage large_number:math bezier_curve_N_input[][2]
data modify storage large_number:math bezier_curve_n_Pos set value [[0d,0d,0d]]

data modify storage large_number:math temp_1c1x5s5_x set from storage large_number:math sstempa0[0]
data modify storage large_number:math temp_1c1x5s5_y set from storage large_number:math sstempb0[0]
data modify storage large_number:math temp_1c1x5s5_z set from storage large_number:math sstempc0[0]
data remove storage large_number:math sstempa0[0]
data remove storage large_number:math sstempb0[0]
data remove storage large_number:math sstempc0[0]
execute if data storage large_number:math sstempa0[0] run function large_number:particle/bezier_curve_n/loop0

#t
scoreboard players operation #bezier_curve_N.t int = #bezier_curve_N.t.size int

#计算系数
scoreboard players set #bezier_curve_N.loops int 0
scoreboard players operation #combinations.n int = #bezier_curve_N.order int
data modify storage large_number:math temp_nCr set value []
execute if score #bezier_curve_N.loops int <= #bezier_curve_N.order int run function large_number:particle/bezier_curve_n/loop1

scoreboard players set #bezier_curve_n.diff_start int 2
