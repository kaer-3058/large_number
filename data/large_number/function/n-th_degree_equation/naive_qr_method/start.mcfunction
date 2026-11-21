##朴素的QR方法迭代

#默认输入矩阵为上Hessenberg形式

#输入：data modify storage large_number:math naive_qr_method_input set value [[],[],[]]

#data modify storage large_number:math naive_qr_method_input set value [[8d,0d,29d,1d],\
                                                                       [6d,-5d,-2d,100d],\
                                                                       [0d,-13d,25d,15d],\
                                                                       [0d,0d,28d,188d]]

#function large_number:n-th_degree_equation/naive_qr_method/start

#输出：data get storage large_number:math naive_qr_method_RQ

#求R
data modify storage large_number:math naive_qr_method_R set value []
data modify storage large_number:math temp_zero_list set value []
data modify storage large_number:math temp_xz_c_list set value []
data modify storage large_number:math temp_xz_s_list set value []
execute store result score #naive_qr_method.matrix.scale large_number.int run data get storage large_number:math naive_qr_method_input
execute if score #naive_qr_method.matrix.scale large_number.int matches 3.. run function large_number:n-th_degree_equation/naive_qr_method/loop1

data modify storage large_number:math temp_zero_list append from storage large_number:math naive_qr_method_input[0][0]
data modify storage large_number:math naive_qr_method_R append from storage large_number:math temp_zero_list

#求R*Q
data modify storage large_number:math naive_qr_method_RQ set value []
execute store result score #temp large_number.int run data get storage large_number:math naive_qr_method_R
execute if score #temp large_number.int matches 10 run data modify storage large_number:math naive_qr_method_RQ set value [[],[],[],[],[],[],[],[],[],[]]
execute if score #temp large_number.int matches 9 run data modify storage large_number:math naive_qr_method_RQ set value [[],[],[],[],[],[],[],[],[]]
execute if score #temp large_number.int matches 8 run data modify storage large_number:math naive_qr_method_RQ set value [[],[],[],[],[],[],[],[]]
execute if score #temp large_number.int matches 7 run data modify storage large_number:math naive_qr_method_RQ set value [[],[],[],[],[],[],[]]
execute if score #temp large_number.int matches 6 run data modify storage large_number:math naive_qr_method_RQ set value [[],[],[],[],[],[]]
execute if score #temp large_number.int matches 5 run data modify storage large_number:math naive_qr_method_RQ set value [[],[],[],[],[]]
execute if score #temp large_number.int matches 4 run data modify storage large_number:math naive_qr_method_RQ set value [[],[],[],[]]
execute if score #temp large_number.int matches 3 run data modify storage large_number:math naive_qr_method_RQ set value [[],[],[]]
execute if score #temp large_number.int matches 2 run data modify storage large_number:math naive_qr_method_RQ set value [[],[]]
execute if score #temp large_number.int matches 1 run data modify storage large_number:math naive_qr_method_RQ set value [[]]

execute if data storage large_number:math temp_xz_c_list[0] run function large_number:n-th_degree_equation/naive_qr_method/loop2

#补回最后一列
data modify storage large_number:math naive_qr_method_RQ[0] append from storage large_number:math naive_qr_method_R[0][0]
data modify storage large_number:math naive_qr_method_RQ[1] append from storage large_number:math naive_qr_method_R[1][0]
data modify storage large_number:math naive_qr_method_RQ[2] append from storage large_number:math naive_qr_method_R[2][0]
data modify storage large_number:math naive_qr_method_RQ[3] append from storage large_number:math naive_qr_method_R[3][0]
data modify storage large_number:math naive_qr_method_RQ[4] append from storage large_number:math naive_qr_method_R[4][0]
data modify storage large_number:math naive_qr_method_RQ[5] append from storage large_number:math naive_qr_method_R[5][0]
data modify storage large_number:math naive_qr_method_RQ[6] append from storage large_number:math naive_qr_method_R[6][0]
data modify storage large_number:math naive_qr_method_RQ[7] append from storage large_number:math naive_qr_method_R[7][0]
data modify storage large_number:math naive_qr_method_RQ[8] append from storage large_number:math naive_qr_method_R[8][0]
data modify storage large_number:math naive_qr_method_RQ[9] append from storage large_number:math naive_qr_method_R[9][0]
