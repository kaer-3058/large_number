##double列表的最大值/最小值

#直接遍历法

#输入目标列表：data modify storage large_number:math double_extrema.input set value [7.0,1.0,81.0,-0.0017,18.2,-7.0,0.1111]
#输入搜索模式：data modify storage large_number:math double_extrema.mode set value "max"
#输入值为字符串，"max"是找最大值，"min"是找最小值

data modify storage large_number:math stempd set from storage large_number:math double_extrema.input
data modify storage large_number:math stempu set from storage large_number:math double_extrema.mode
data modify storage large_number:math float_comparison_sizes.B set from storage large_number:math stempd[0]

execute if data storage large_number:math stempd[1] run function large_number:list_operation/double_extrema/loop
data modify storage large_number:math double_extrema.output set from storage large_number:math float_comparison_sizes.B
