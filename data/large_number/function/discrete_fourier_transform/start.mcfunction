##离散傅里叶变换 DFT

#输入变换的目标序列x[n]：data modify storage large_number:math discrete_fourier_transform.input set value [1d,2d,3d,4d,5d,6d,7d,8d,9d,10d]
#列表里的每一项可以是实数，也可以是虚数、复数

#输入k：data modify storage large_number:math discrete_fourier_transform.k set value 1
#或省略k：data remove storage large_number:math discrete_fourier_transform.k
#若k值存在，则为单点离散傅里叶变换，输出的是一个复数
#若k值不存在则为对所有k值进行计算，输出的是一个与目标序列等长的复数列表

#指数符号：data modify storage large_number:math discrete_fourier_transform.inverse set value 1b
#值为1就是正号，否则是负号，默认是负号

#function large_number:discrete_fourier_transform/start

execute if data storage large_number:math discrete_fourier_transform.k run function large_number:discrete_fourier_transform/once/start
execute unless data storage large_number:math discrete_fourier_transform.k run function large_number:discrete_fourier_transform/all/start

execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate":"large_number.discrete_fourier_transform.end","fallback": "\u00A77\u00A7o离散傅里叶变换计算完成"}
