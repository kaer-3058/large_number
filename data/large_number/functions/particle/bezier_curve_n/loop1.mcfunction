#组合数，二项式系数
scoreboard players operation #combinations.k int = #bezier_curve_N.loops int
execute store result storage large_number:math temp1 double 1 run function large_number:combinations/start
data modify storage large_number:math temp_nCr append from storage large_number:math temp1

scoreboard players add #bezier_curve_N.loops int 1
execute if score #bezier_curve_N.loops int <= #bezier_curve_N.order int run function large_number:particle/bezier_curve_n/loop1
