##N阶矩阵的吉文斯旋转 - 直接就上次旋转的信息继续沿用

#循环
data modify storage large_number:math temp_i set from storage large_number:math givens.i
data modify storage large_number:math temp_j set from storage large_number:math givens.j
data modify storage large_number:math temp_o_i set value []
data modify storage large_number:math temp_o_j set value []
execute if data storage large_number:math temp_i[0] run function large_number:n-th_degree_equation/givens/loop

#输出
data modify storage large_number:math givens.out_i set from storage large_number:math temp_o_i
data modify storage large_number:math givens.out_j set from storage large_number:math temp_o_j
