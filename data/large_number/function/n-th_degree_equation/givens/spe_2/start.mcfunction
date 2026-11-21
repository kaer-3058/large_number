##N阶矩阵的吉文斯旋转

#a：data modify storage large_number:math givens.a set value 2.5
#b：data modify storage large_number:math givens.b set value 7.3
#第一行/列：data modify storage large_number:math givens.i set value []
#第二行/列：data modify storage large_number:math givens.j set value []

# large_number:math temp_xz_c
# large_number:math temp_xz_s

#function large_number:n-th_degree_equation/givens/spe_2/start

scoreboard players set #temp_order large_number.int 0

#循环
data modify storage large_number:math temp_i set from storage large_number:math givens.i
data modify storage large_number:math temp_j set from storage large_number:math givens.j
data modify storage large_number:math temp_o_i set value []
data modify storage large_number:math temp_o_j set value []
execute if data storage large_number:math temp_i[0] run function large_number:n-th_degree_equation/givens/spe_2/loop

#输出
#data modify storage large_number:math givens.out_i set from storage large_number:math temp_o_i
#data modify storage large_number:math givens.out_j set from storage large_number:math temp_o_j
