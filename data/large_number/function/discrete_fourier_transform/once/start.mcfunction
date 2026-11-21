##离散傅里叶变换 DFT 单点变换

#输入变换的目标序列x[n]：data modify storage large_number:math discrete_fourier_transform.input set value [1d,2d,3d,4d,5d,6d,7d,8d,9d,10d]
#列表里的每一项可以是实数，也可以是虚数、复数

execute store result score #DFT.k large_number.int run data get storage large_number:math discrete_fourier_transform.k

execute store result score #DFT.N large_number.int run data get storage large_number:math discrete_fourier_transform.input
scoreboard players operation #DFT.loops large_number.int = #DFT.N large_number.int
scoreboard players remove #DFT.loops large_number.int 1
execute store result score #DFT.inverse large_number.int run data get storage large_number:math discrete_fourier_transform.inverse

#计算各项指数缩放因子
data modify storage large_number:math dft_exp_list set value []
scoreboard players operation #Divisor_float_int0 large_number.int = #DFT.N large_number.int
function large_number:discrete_fourier_transform/once/180_div_n
scoreboard players set #DFT.n large_number.int 0
execute if score #DFT.n large_number.int <= #DFT.loops large_number.int run function large_number:discrete_fourier_transform/once/loop1

#相乘
data modify storage large_number:math temp_sum_list set value []
data modify storage large_number:math dft_x_n_list set from storage large_number:math discrete_fourier_transform.input
execute if data storage large_number:math dft_exp_list[0] run function large_number:discrete_fourier_transform/once/loop2

#求和
data modify storage large_number:math list_sum.input set from storage large_number:math temp_sum_list
function large_number:complex_integral/list_sum_of_c/start
data modify storage large_number:math discrete_fourier_transform.output set from storage large_number:math complex_operation.output
