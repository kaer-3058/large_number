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


#经过长达半个多月的数值解N次方程的研究，我发现了下列规律：
#1.若方程存在两两相对距离过于紧凑的根，数学语言描述为|r_{i}-r_{j}|/(|r_{i}|∨|r_{j}|)<ε，其中ε是一个较小的正值，例如0.1，则这两个根的QR迭代就会变慢。
#2.存在一种矩阵(例如单位根矩阵)，其多项式构造的友矩阵分解得到的R矩阵(三角矩阵)极其接近单位矩阵，此时按一定频率搅动一次矩阵(把位移值设置为max(0.5,旧位移值))，可使QR迭代收敛。
#3.双步位移法在低精度环境会失效，其迭代得到的矩阵的吉文斯旋转角度会越来越小，最终小到可以视为浮点误差继而导致迭代停滞。
#4.矩阵平衡算法在低精度环境会放大QR迭代产生的误差扰动，导致QR迭代中的龙格现象（越迭代误差越大）。
#5.QR迭代的速度与多项式系数的绝对值的大小无关，与根的密集程度有关。似乎是根的密集程度小于0.1就越来越慢了。

#目前设计出来的N次方程计算器对于根的相对距离比较紧密的方程仍然存在缺陷，待我日后技术进步了再优化
#数据包里这一块的文件很多是因为我试错得到的废案很多，包括：矩阵平衡、系数缩放、补充策略


data modify storage large_number:math n-th_degree_equation.output set value []
data modify storage large_number:math n-th_degree_equation.is_potentially_convergent set value 0b
scoreboard players set #QR.times large_number.int 0
#scoreboard players set #next_mb_countdown large_number.int 5
#scoreboard players set #temp_suo_fang_nth large_number.int 0

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

#系数缩放算法
#execute if score #n-th_degree_equ.n-th large_number.int matches 3.. run function large_number:n-th_degree_equation/coefficient_scaling/start

##迭代核心，QR分解
data modify storage large_number:math naive_qr_method_input set from storage large_number:math companion_matrix
scoreboard players operation #Store_n-th_degree_equ.QR_all_loop_times large_number.int = #n-th_degree_equ.QR_all_loop_times large_number.int
execute if score #n-th_degree_equ.n-th large_number.int matches 3.. if score #Store_n-th_degree_equ.QR_all_loop_times large_number.int matches 1.. run function large_number:n-th_degree_equation/qr_loop
#execute if score #n-th_degree_equ.n-th large_number.int matches 3.. if score #Store_n-th_degree_equ.QR_all_loop_times large_number.int matches 1.. run function large_number:n-th_degree_equation/higher-order_qr_loop/start
data modify storage large_number:math QR_factorization_R set from storage large_number:math naive_qr_method_input

#尾处理
execute if score #n-th_degree_equ.n-th large_number.int matches 3.. run function large_number:n-th_degree_equation/next
data modify storage large_number:math n-th_degree_equation.input set from storage large_number:math Store_n-th_degree_equation_input

#使用牛顿迭代法增加精度
scoreboard players operation #temp_newton.s_method.loops large_number.int = #n-th_degree_equ.newton.s_method.loops large_number.int
execute if score #n-th_degree_equ.n-th large_number.int matches 2.. if score #temp_newton.s_method.loops large_number.int matches 1.. run function large_number:n-th_degree_equation/newton.s_method/start

#计算牛顿迭代步进差
function large_number:n-th_degree_equation/newton.s_method/step_length_abs

#计算回代误差
function large_number:n-th_degree_equation/newton.s_method/residual_error_abs


tellraw @a {"translate":"large_number.n-th_degree_equation.end","fallback": "\u00A77\u00A7oN次方程求解完成！"}


#矩阵平衡算法的最大迭代次数：scoreboard players set #n-th_degree_equ.matrix_balance.max_loops large_number.int 20

#测试内容：

#出现了相邻两个次对角线大于阈值的情况，可能未收敛

#报告收敛性，测试是否有复数根，把单次QR迭代也拆开，优化到可以算10次方程为止，尝试提高收敛速度

#10次方程，收敛困难，2500次算了10分钟未收敛
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-10d,45d,-120d,210d,-252d,210d,-120d,45d,-10d,1d]

#六次方程，100次迭代已足够
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-21d,175d,-735d,1624d,-1764d,720d]

#data modify storage large_number:math n-th_degree_equation.input set value [1d,-7d,3d,81d,-183d,-105d,713d,-581d,-318d,612d,-216d]

#data modify storage large_number:math n-th_degree_equation.input set value [1d,-55d,1320d,-18150d,157773d,-902055d,3416930d,-8409500d,12753576d,-10628640d,3628800d]

#系数太大，迭代到1万次也没能收敛
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-2157780d,470994626084d,-27141199423607040d]

#10次左右
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-6d,11d,-6d]

#七次方程，100次迭代足够
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-35d,511d,-4025d,18424d,-48860d,69264d,-40320d]

#十次方程，根为 1, 2, 3, 4, -2
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-16d,94d,-200d,-247d,1912d,-2648d,-1600d,7696d,-7296d,2304]

#四次方程
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-145d,6130d,-66840d,149184d]


#测试根的紧密性
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-12d,47d,-60d]
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-303d,30602d,-1030200d]
#data modify storage large_number:math n-th_degree_equation.input set value [1d,-3.003,2.006003,-0.002003001]
