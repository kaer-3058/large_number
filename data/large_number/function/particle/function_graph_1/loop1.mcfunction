execute store result storage large_number:math expression_evaluation_variables."ｘ" double .001 run scoreboard players get #loop1 large_number.int

#解析逆波兰式 - 实函数
function large_number:expression_evaluation_scientific/ope_no_tell
data modify storage large_number:math temp_xy[1] set from storage large_number:math expression_evaluation.output

execute store result storage large_number:math temp_xy[0] double .001 run scoreboard players get #loop1 large_number.int

#值域限制
data modify storage large_number:math float_comparison_sizes.A set from storage large_number:math temp_xy[1]
execute store result storage large_number:math float_comparison_sizes.B double .001 run scoreboard players get #function_graph_1.max_y large_number.int
function large_number:float_comparison_sizes/start
data modify storage large_number:math temp_comparison_sizes_max set from storage large_number:math float_comparison_sizes.output
execute store result storage large_number:math float_comparison_sizes.B double .001 run scoreboard players get #function_graph_1.min_y large_number.int
function large_number:float_comparison_sizes/start
data modify storage large_number:math temp_comparison_sizes_min set from storage large_number:math float_comparison_sizes.output
execute unless score #function_graph_1.max_y large_number.int = #function_graph_1.max_y large_number.int run data modify storage large_number:math temp_comparison_sizes_max set value "-"
execute unless score #function_graph_1.min_y large_number.int = #function_graph_1.min_y large_number.int run data modify storage large_number:math temp_comparison_sizes_min set value "+"

scoreboard players set #temp0 large_number.int 1
execute if data storage large_number:math {temp_comparison_sizes_max:"+"} run scoreboard players set #temp0 large_number.int 0
execute if data storage large_number:math {temp_comparison_sizes_min:"-"} run scoreboard players set #temp0 large_number.int 0

#如果报错则此点不绘制
execute if data storage large_number:math expression_evaluation{output:"NaNd"} run scoreboard players set #temp0 large_number.int 0

execute if score #temp0 large_number.int matches 1 run data modify storage large_number:math function_graph_1_Pos append from storage large_number:math temp_xy


scoreboard players operation #loop1 large_number.int += #function_graph_1.step large_number.int
execute unless score #loop1 large_number.int > #function_graph_1.b large_number.int run function large_number:particle/function_graph_1/loop1
