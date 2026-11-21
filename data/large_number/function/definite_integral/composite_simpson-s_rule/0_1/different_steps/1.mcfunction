##定积分 - 复化辛普森求积公式 - [0,1]区间

#只能求一重积分，被积函数必须"黎曼可积"，求出来的结果只能是个数（无法处理含参结果），取积分变量为ｘ
#前置算法："表达式求值 - 科学计算"

#分割区间的份数：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 300
#取正整数，上限是99999999，不宜太多
#被积函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式
#输出：storage large_number:math expression_evaluation.definite_integral.output

#function large_number:definite_integral/composite_simpson-s_rule/0_1/start

#tellraw @a ["∫[",{"nbt":"expression_evaluation.definite_integral.a","storage":"large_number:math"},", ",{"nbt":"expression_evaluation.definite_integral.b","storage":"large_number:math"},"](",{"nbt":"expression_evaluation.input","storage":"large_number:math"},")dｘ≈",{"nbt":"expression_evaluation.definite_integral.output","storage":"large_number:math"}]

#单tick递归次数(不可小于1)：scoreboard players set #definite_integral.loops large_number.int 5
#开始信号：scoreboard players set #int.composite_simpson-s_rule_info large_number.int 1
#需要tick执行：function large_number:definite_integral/composite_simpson-s_rule/0_1/different_steps/tick

#未定义点的列表
data modify storage large_number:math definite_integral_error_x_list set value []

execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate":"large_number.definite_integral.start","fallback": "\u00A77\u00A7o定积分开始计算"}

execute store result score #int.n large_number.int run data get storage large_number:math expression_evaluation.definite_integral.dx_times
scoreboard players operation #loops large_number.int = #int.n large_number.int
scoreboard players remove #loops large_number.int 1

#计算各个求和项
data modify storage large_number:math temp1_sum_inp_1 set value []
data modify storage large_number:math temp1_sum_inp_2 set value []
scoreboard players operation #int_+decimal.input2 large_number.int = #int.n large_number.int
scoreboard players set #int.k large_number.int 1
scoreboard players set #int.composite_simpson-s_rule_info large_number.int 2
