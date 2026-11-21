scoreboard players set #Store_bezier_curve_n.diff_loops large_number.int 0

#大循环
execute if score #Store_bezier_curve_n.diff_loops large_number.int < #bezier_curve_n.diff_loops large_number.int run function large_number:particle/bezier_curve_n/different_steps/loop3

execute unless score #large_number.all_tellraw_set large_number.int matches 1 if score #bezier_curve_N.t large_number.int matches 10001.. run tellraw @a {"translate":"large_number.bezier_curve_n.end","fallback":"\u00A77\u00A7oN阶贝塞尔曲线求解完成"}
execute if score #bezier_curve_N.t large_number.int matches 10001.. run scoreboard players set #bezier_curve_n.diff_start large_number.int 30
