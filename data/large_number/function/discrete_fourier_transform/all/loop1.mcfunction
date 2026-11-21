#计算各项指数缩放因子
data modify storage large_number:math dft_exp_list set value []
scoreboard players set #DFT.n large_number.int 0
execute if score #DFT.n large_number.int <= #DFT.loops large_number.int run function large_number:discrete_fourier_transform/once/loop1

#相乘
data modify storage large_number:math temp_sum_list set value []
data modify storage large_number:math dft_x_n_list set from storage large_number:math discrete_fourier_transform.input
execute if data storage large_number:math dft_exp_list[0] run function large_number:discrete_fourier_transform/once/loop2

#求和
data modify storage large_number:math list_sum.input set from storage large_number:math temp_sum_list
function large_number:complex_integral/list_sum_of_c/start
data modify storage large_number:math discrete_fourier_transform_out append from storage large_number:math complex_operation.output

scoreboard players add #DFT.k large_number.int 1
execute if score #DFT.k large_number.int <= #DFT.loops large_number.int run function large_number:discrete_fourier_transform/all/loop1
