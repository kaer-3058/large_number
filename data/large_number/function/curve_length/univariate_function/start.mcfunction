##曲线长度 - 一元函数在[a,b]内的图像长度

#前置算法："表达式求值 - 科学计算"

#采用折线拟合的方法，只能处理连续函数

#区域 下限：data modify storage large_number:math expression_evaluation.definite_integral.a set value 2.0
#区域 上限：data modify storage large_number:math expression_evaluation.definite_integral.b set value 3.0
#区间内取样数量：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 200
#取正整数，上限是1000000000，不宜太多
#被积函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式
#输出：storage large_number:math expression_evaluation.univariate_function_length

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.definite_integral.b
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.definite_integral.a
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

execute store result score #expression_evaluation.definite_integral.dx_times int run data get storage large_number:math expression_evaluation.definite_integral.dx_times
scoreboard players add #expression_evaluation.definite_integral.dx_times int 1

scoreboard players set #sstemp1 int 1000000000
scoreboard players operation #sstemp1 int /= #expression_evaluation.definite_integral.dx_times int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #sstemp1 int
function large_number:curve_length/univariate_function/macro1 with storage large_number:math

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math
data modify storage large_number:math sstemp05 set from storage large_number:math expression_evaluation.definite_integral.a

data modify storage large_number:math sstempr set value []
data modify storage large_number:math sstemps set value [0.0,0.0]
scoreboard players set #Store_expression_evaluation.definite_integral.loop int 0
execute unless score #Store_expression_evaluation.definite_integral.loop int > #expression_evaluation.definite_integral.dx_times int run function large_number:curve_length/univariate_function/loop1

data modify storage large_number:math sstemps set value []
execute if data storage large_number:math sstempr[1] run function large_number:curve_length/univariate_function/loop2

execute if data storage large_number:math sstemps[0] positioned .0 .0 .0 run function large_number:curve_length/univariate_function/loop3
data modify storage large_number:math expression_evaluation.univariate_function_length set from storage large_number:math stemp9040cs99

tellraw @a {"text":"\u00A77\u00A7o曲线长度计算完成"}
