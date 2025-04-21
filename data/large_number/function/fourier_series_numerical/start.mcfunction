##一元实函数的傅里叶级数展开 - 数值方法求解

#前置算法：#表达式求值 - 科学计算
#求解过程中会用到表达式求值和定积分运算相关的接口，注意数据保存。

#输入目标函数：data modify storage large_number:math fourier_series_numerical.input set value ""
#输入规则等同于"#表达式求值 - 科学计算"

#输入目标函数单个周期的两端的x值
#data modify storage large_number:math fourier_series_numerical.a set value 0.0
#data modify storage large_number:math fourier_series_numerical.b set value 2.0

#因为是采用了多tick计算定积分的算法，所以需要tick执行：function large_number:fourier_series_numerical/tick
#定积分的单tick计算小矩形的数量(不可小于1)：scoreboard players set #definite_integral.loops int 5
#定积分的积分区间内小矩形的数量：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 300

#展开的级数项数：data modify storage large_number:math fourier_series_numerical.items set value 5
#范围为1~15。
#文本播报模式 (1为开启所有，2为仅开启开始和结束提示语，为其他值则无提示)：scoreboard players set #fourier_series_numerical.tell_mode int 1

#开始信号：scoreboard players set #temp_fourier_series_numerical.tick.start int 0

#data modify storage large_number:math expression_evaluation.input set from storage large_number:math fourier_series_numerical.expression

data modify storage large_number:math fourier_series_numerical.function_a set value []
data modify storage large_number:math fourier_series_numerical.function_b set value []

execute unless score #large_number.all_tellraw_set int matches 1 if score #fourier_series_numerical.tell_mode int matches 1..2 run tellraw @a {"translate":"large_number.fourier_series_numerical.start","fallback": "\u00A77\u00A7o傅里叶级数开始计算"}

#计算p

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math fourier_series_numerical.b
data modify storage large_number:math temp2 set from storage large_number:math fourier_series_numerical.a
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int -= #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.6 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math temp_p set from storage large_number:math temp1
data modify storage large_number:math fourier_series_numerical.p set from storage large_number:math temp1

#计算a0
data modify storage large_number:math fourier_series_numerical.abnum set value "A0"

data modify storage large_number:math expression_evaluation.input set from storage large_number:math fourier_series_numerical.input
function large_number:fourier_series_numerical/to_rev_polish_notation
data modify storage large_number:math expression_evaluation.definite_integral.a set from storage large_number:math fourier_series_numerical.a
data modify storage large_number:math expression_evaluation.definite_integral.b set from storage large_number:math fourier_series_numerical.b
#输出：storage large_number:math expression_evaluation.definite_integral.output

scoreboard players set #temp_fourier_series_numerical.tick.start int 1
