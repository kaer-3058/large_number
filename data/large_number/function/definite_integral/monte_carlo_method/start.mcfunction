##定积分——蒙特卡洛方法

#需要积分区间变换到[0,1]区间

#只能求一重积分，被积函数在积分区间内必须"黎曼可积"，求出来的结果只能是个数（无法处理含参结果），取积分变量为ｘ
#前置算法："表达式求值 - 科学计算"

#积分区域 下限：data modify storage large_number:math expression_evaluation.definite_integral.a set value 2.0
#积分区域 上限：data modify storage large_number:math expression_evaluation.definite_integral.b set value 3.0
#取样次数：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 100
#取正整数，上限是1000000000，不宜太多
#被积函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式
#输出：storage large_number:math expression_evaluation.definite_integral.output

#蒙特卡洛积分法：https://zhuanlan.zhihu.com/p/659412180

data remove storage large_number:math expression_evaluation.definite_integral.output

#b-a
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.definite_integral.b
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.definite_integral.a
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math ssstemp_b_a set from storage large_number:math temp1


execute store result score #Store_expression_evaluation.definite_integral.loop int run data get storage large_number:math expression_evaluation.definite_integral.dx_times

data modify storage large_number:math sstempr set value []
execute if score #Store_expression_evaluation.definite_integral.loop int matches 1.. run function large_number:definite_integral/monte_carlo_method/loop1

execute if data storage large_number:math sstempr[0] positioned .0 .0 .0 run function large_number:definite_integral/riemann_integral/loop2

data modify storage large_number:math float_division.input1 set from storage large_number:math float_multiply.input1
execute store result storage large_number:math float_division.input2 double 1 run data get storage large_number:math expression_evaluation.definite_integral.dx_times
function large_number:division/float/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_division.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math ssstemp_b_a
function large_number:float_mul.high_precision/start
data modify storage large_number:math expression_evaluation.definite_integral.output set from storage large_number:math float_multiply.output

tellraw @a {"text":"\u00A77\u00A7o定积分求解完成"}



  