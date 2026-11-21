##N阶贝塞尔曲线

#新算法 - 把递归拆成穷举

#data modify storage large_number:math bezier_curve_N_input set value []
#data modify storage large_number:math bezier_curve_N_input set value [[80.53327412400547d, 70.0d, -10.415578849420953d], [80.48320434763545d, 81.0d, -10.45320665493354d], [72.4587502815431d, 82.0d, 0.4828503464197471d], [72.46377528715864d, 70.0d, 0.4513856142506847d], [65.42754948340058d, 70.0d, 12.69010062208451d], [65.29733593096364d, 91.0d, 12.673135434650552d]]
#按顺序输入各个控制点的三维坐标，阶数=点数-1
#支持1~33阶

#scoreboard players set #bezier_curve_N.t.size large_number.int 100

execute store result score #bezier_curve_N.order large_number.int run data get storage large_number:math bezier_curve_N_input
scoreboard players remove #bezier_curve_N.order large_number.int 1


