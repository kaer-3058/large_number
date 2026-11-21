##一元N次方程

#原理：构建N次多项式对应的友矩阵M，利用吉文斯旋转对M进行QR分解迭代，最终矩阵会收敛于类上三角矩阵的实schur型矩阵，实schur型矩阵的对角线元素就是N次多项式的根。
#对于一次和二次方程是直接应用求根公式，三次方程开始使用QR分解迭代

#输入方程系数，从高次到低次
#data modify storage large_number:math n-th_degree_equation.input set value []
#data modify storage large_number:math n-th_degree_equation.input set value [7.0,6.0,-2.1,7.8,6.233]
#首项系数不可为零

#输入QR迭代次数：scoreboard players set #n-th_degree_equ.QR_all_loop_times large_number.int 30

#设精度范围。若要取的精度为1e-6，那么就设置为-6。一般来说取-6即可。
scoreboard players set #n-th_degree_equation.precision_range large_number.int -6

#搅动矩阵的频率 (每隔n次搅动一次)：scoreboard players set #n-th_degree_equation.stirring_frequency large_number.int 20
#不可过于频繁，推荐设置为0/10/20，该值只有设置为大于等于3时才会生效
#搅动矩阵是指把位移值设置为max(0.5,位移值)，防止矩阵迭代错误的停滞

#使用牛顿迭代法把根精确化计算，迭代的次数：scoreboard players set #n-th_degree_equ.newton.s_method.loops large_number.int 20

#计算：function large_number:n-th_degree_equation/start

#输出根的列表：data get storage large_number:math n-th_degree_equation.output
#为什么要引入复数：因为友矩阵QR迭代算法是一次性找到所有根，找到复数根也就是顺手的事。

#最后一次迭代得到的矩阵：data get storage large_number:math naive_qr_method_input
#显示最后一次迭代得到的矩阵：function large_number:n-th_degree_equation/tell


#牛顿迭代法下一步的步进长：data get storage large_number:math n-th_degree_equation.error.newton_method_step_size
#值较大表示牛顿迭代法步进很长，可能误差较大

#方程根的回代误差：data get storage large_number:math n-th_degree_equation.error.residual_error_abs
#这个最直接，但也会因为多项式在0点附近行为的影响。比如部分多项式在0点部分的值波动剧烈，导致估计根看起来距离零点很远。

#方程的根对应的导数值：data get storage large_number:math n-th_degree_equation.error.d_f(x)
#若出现了重根，但是对应的导数值却并不接近0，那么就说明还有没找到的根，应增加QR迭代次数


#多tick计算需要设置的：
#单tick迭代次数(不可小于1)：scoreboard players set #n-th_degree_equation.diff_tick_loops large_number.int 2
#开始信号：scoreboard players set #n-th_degree_equation.diff_info large_number.int 1
#需要tick执行：function large_number:n-th_degree_equation/different_steps/tick


tellraw @a {"translate":"large_number.n-th_degree_equation.diff_start","fallback": "\u00A77\u00A7oN次方程求解开始"}

data modify storage large_number:math n-th_degree_equation.output set value []
data modify storage large_number:math n-th_degree_equation.is_potentially_convergent set value 0b
scoreboard players set #QR.times large_number.int 0

#降阶算法
data modify storage large_number:math Store_n-th_degree_equation_input set from storage large_number:math n-th_degree_equation.input
data modify storage large_number:math sstempu set from storage large_number:math Store_n-th_degree_equation_input
data modify storage large_number:math temp1 set from storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
scoreboard players set #temp1 large_number.int 1000
execute store result score #temp1 large_number.int run data get storage large_number:math sstempu[-1] 1000000
execute if score #temp1 large_number.int matches -5..4 run data modify storage large_number:math n-th_degree_equation.output append value {x:0d}
execute if score #temp1 large_number.int matches -5..4 run data remove storage large_number:math sstempu[-1]
data modify storage large_number:math n-th_degree_equation.input set from storage large_number:math sstempu

#根据系数构造友矩阵
execute store result score #n-th_degree_equ.n-th large_number.int run data get storage large_number:math n-th_degree_equation.input
scoreboard players remove #n-th_degree_equ.n-th large_number.int 1
execute if score #n-th_degree_equ.n-th large_number.int matches 1 run function large_number:n-th_degree_equation/1/start
execute if score #n-th_degree_equ.n-th large_number.int matches 2 run function large_number:n-th_degree_equation/2/start
execute if score #n-th_degree_equ.n-th large_number.int matches 3 run function large_number:n-th_degree_equation/n-th.3
execute if score #n-th_degree_equ.n-th large_number.int matches 4 run function large_number:n-th_degree_equation/n-th.4
execute if score #n-th_degree_equ.n-th large_number.int matches 5 run function large_number:n-th_degree_equation/n-th.5
execute if score #n-th_degree_equ.n-th large_number.int matches 6 run function large_number:n-th_degree_equation/n-th.6
execute if score #n-th_degree_equ.n-th large_number.int matches 7 run function large_number:n-th_degree_equation/n-th.7
execute if score #n-th_degree_equ.n-th large_number.int matches 8 run function large_number:n-th_degree_equation/n-th.8
execute if score #n-th_degree_equ.n-th large_number.int matches 9 run function large_number:n-th_degree_equation/n-th.9
execute if score #n-th_degree_equ.n-th large_number.int matches 10 run function large_number:n-th_degree_equation/n-th.10

##迭代核心，QR分解
data modify storage large_number:math naive_qr_method_input set from storage large_number:math companion_matrix
scoreboard players operation #Store_n-th_degree_equ.QR_all_loop_times large_number.int = #n-th_degree_equ.QR_all_loop_times large_number.int
execute if score #n-th_degree_equ.n-th large_number.int matches 3.. run scoreboard players add #n-th_degree_equation.diff_info large_number.int 1
execute unless score #n-th_degree_equ.n-th large_number.int matches 3.. run scoreboard players set #n-th_degree_equation.diff_info large_number.int 6
