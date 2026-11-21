##离散傅里叶变换 DFT 整体变换

#输入变换的目标序列x[n]：data modify storage large_number:math discrete_fourier_transform.input set value [1d,2d,3d,4d,5d,6d,7d,8d,9d,10d]
#列表里的每一项可以是实数，也可以是虚数、复数

execute store result score #DFT.N large_number.int run data get storage large_number:math discrete_fourier_transform.input
scoreboard players operation #DFT.loops large_number.int = #DFT.N large_number.int
scoreboard players remove #DFT.loops large_number.int 1
scoreboard players operation #Divisor_float_int0 large_number.int = #DFT.N large_number.int
function large_number:discrete_fourier_transform/once/180_div_n
execute store result score #DFT.inverse large_number.int run data get storage large_number:math discrete_fourier_transform.inverse

#对每个k值作一次单点变换
data modify storage large_number:math discrete_fourier_transform_out set value []
scoreboard players set #DFT.k large_number.int 0
execute if score #DFT.k large_number.int <= #DFT.loops large_number.int run function large_number:discrete_fourier_transform/all/loop1

#最终结果
data modify storage large_number:math discrete_fourier_transform.output set from storage large_number:math discrete_fourier_transform_out
