##快速傅里叶变换 FFT

#输入变换的目标序列x[n]：data modify storage large_number:math discrete_fourier_transform.input set value [1d,2d,3d,4d,5d,6d,7d,8d]
#列表里的每一项可以是实数，也可以是虚数、复数
#此为以2为基底的fft，项数只能是区间[8,4096]内的2的整数幂个
#也就是说，项数只能是：8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096

#3基fft：9, 27, 81, 243, 729, 2187, 6561
#5基fft：25, 125, 625, 3125
#7基fft：7, 49, 343, 2401

#指数符号：data modify storage large_number:math discrete_fourier_transform.inverse set value 1b
#值为1就是正号，否则是负号，默认是负号

# function large_number:fft/start

#data get storage large_number:math discrete_fourier_transform

#data modify storage large_number:math discrete_fourier_transform.input set value [{i:8d,x:2d},{i:7d,x:3d},{i:6d,x:9d},{i:5d,x:6d},{i:4d},{i:3d},{i:2d},{i:1d},3d,0d,5d,8d,{x:3d},{x:0d},{x:5d},{x:8d}]
#data modify storage large_number:math discrete_fourier_transform.input set value [2.2, 3.3, 5.5, 7.7, 11.11, 13.13, 17.17, 19.19]

data modify storage large_number:math temp_dft_inp set from storage large_number:math discrete_fourier_transform.input

#1.重排序
data modify storage large_number:math temp_order set value []
execute store result score #temp_dft.N large_number.int run data get storage large_number:math temp_dft_inp
function large_number:fft/reorder

#2.逐级进行fft，级数=log_2(N)
execute store result score #temp_dft_inverse large_number.int run data get storage large_number:math discrete_fourier_transform.inverse
scoreboard players set #temp_dft.n large_number.int 2
scoreboard players set #temp_dft.loops large_number.int 1
execute if score #temp_dft.n large_number.int < #temp_dft.N large_number.int run function large_number:fft/loop1

#最后，把顺序排回去
data modify storage large_number:math temp_dft_out set value []
execute if data storage large_number:math temp_order[0] run function large_number:fft/loop4
data modify storage large_number:math discrete_fourier_transform.output set from storage large_number:math temp_dft_out
