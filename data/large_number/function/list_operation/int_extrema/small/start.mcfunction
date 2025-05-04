##int列表的最大值/最小值 - 任意两个元素之差不会超出int范围

#直接遍历法

#输入目标列表：data modify storage large_number:math int_extrema.input set value [-8, 6, 17, 38, 0, 6, -23, 18]
#输入搜索模式：data modify storage large_number:math int_extrema.mode set value "max"
#输入值为字符串，"max"是找最大值，"min"是找最小值

data modify storage large_number:math stempd set from storage large_number:math int_extrema.input
data modify storage large_number:math stempu set from storage large_number:math int_extrema.mode
execute store result score #float_comparison_sizes_B int run data get storage large_number:math stempd[0]

execute if data storage large_number:math stempd[1] run function large_number:list_operation/int_extrema/small/loop
execute store result storage large_number:math int_extrema.output int 1 run scoreboard players get #float_comparison_sizes_B int
