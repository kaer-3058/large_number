##定积分——蒙特卡洛方法 - [0,1]区间

#只能求一重积分，被积函数在积分区间内必须"黎曼可积"，求出来的结果只能是个数（无法处理含参结果），取积分变量为ｘ
#前置算法："表达式求值 - 科学计算"

#取样次数：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 100
#取正整数，上限是1000000000，不宜太多
#被积函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式
#输出：storage large_number:math expression_evaluation.definite_integral.output

data remove storage large_number:math expression_evaluation.definite_integral.output

execute store result score #Store_expression_evaluation.definite_integral.loop int run data get storage large_number:math expression_evaluation.definite_integral.dx_times

data modify storage large_number:math sstempr set value []
execute if score #Store_expression_evaluation.definite_integral.loop int matches 1.. run function large_number:definite_integral/monte_carlo_method/0_1/loop1

execute if data storage large_number:math sstempr[0] positioned .0 .0 .0 run function large_number:definite_integral/riemann_integral/loop2

data modify storage large_number:math float_division.input1 set from storage large_number:math float_multiply.input1
execute store result storage large_number:math float_division.input2 double 1 run data get storage large_number:math expression_evaluation.definite_integral.dx_times
function large_number:division/float/start
data modify storage large_number:math expression_evaluation.definite_integral.output set from storage large_number:math float_division.output

tellraw @a {"text":"\u00A77\u00A7o定积分求解完成"}
