##定积分 - 黎曼积分法 - 每tick计算n个小矩形

#只能求一重积分，被积函数必须"黎曼可积"，求出来的结果只能是个数（无法处理含参结果），取积分变量为ｘ
#前置算法："表达式求值 - 科学计算"

#积分区域 下限：data modify storage large_number:math expression_evaluation.definite_integral.a set value 2.0
#积分区域 上限：data modify storage large_number:math expression_evaluation.definite_integral.b set value 3.0
#积分区间内小矩形的数量：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 300
#取正整数，上限是1000000000，不宜太多
#被积函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式
#输出：storage large_number:math expression_evaluation.definite_integral.output

#单tick递归次数(不可小于1)：scoreboard players set #definite_integral.loops large_number.int 5
#开始信号：scoreboard players set #temp_fourier_series_numerical.tick.start large_number.int 1
#需要tick执行：function large_number:fourier_series_numerical/tick

#公式 (梯形法则)：∫[a,b]f(x)dx ≈ ((b-a)/k)*((f(a)+f(b))/2+Σ[n=1,k-1]f(a+((b-a)/k)*n)))
#其中k是区间内小矩形的数量。这里的小矩形的高度取的是小区间右端的函数值。

execute unless score #large_number.all_tellraw_set large_number.int matches 1 if score #fourier_series_numerical.tell_mode large_number.int matches 1 run tellraw @a [{"translate":"large_number.fourier_series_numerical.diff_start","fallback":"\u00A77\u00A7o傅里叶级数：%1$s\u00A77\u00A7o的积分开始计算","with": [{"nbt":"fourier_series_numerical.abnum","storage":"large_number:math","color":"#dbdbdb","italic":true}]}]

data remove storage large_number:math expression_evaluation.definite_integral.output


#未定义点的列表
data modify storage large_number:math definite_integral_error_x_list set value []

execute store result score #int.n large_number.int run data get storage large_number:math expression_evaluation.definite_integral.dx_times
scoreboard players operation #loops large_number.int = #int.n large_number.int
scoreboard players remove #loops large_number.int 1
data modify storage large_number:math temp_int_a set from storage large_number:math expression_evaluation.definite_integral.a
data modify storage large_number:math temp_int_b set from storage large_number:math expression_evaluation.definite_integral.b

#b-a
#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_int_b
data modify storage large_number:math temp2 set from storage large_number:math temp_int_a
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math temp_int_b_a set from storage large_number:math temp1

#计算各个求和项
data modify storage large_number:math temp1_sum_inp_1 set value []
data modify storage large_number:math temp1_sum_inp_2 set value []
scoreboard players set #int.k large_number.int 1


scoreboard players set #Store_expression_evaluation.definite_integral.loop large_number.int 1
scoreboard players set #temp_fourier_series_numerical.tick.start large_number.int 2
