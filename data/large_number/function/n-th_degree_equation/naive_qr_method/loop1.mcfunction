#求解R矩阵的循环

data modify storage large_number:math givens.i set from storage large_number:math naive_qr_method_input[0]
data modify storage large_number:math givens.j set from storage large_number:math naive_qr_method_input[1]
data modify storage large_number:math givens.a set from storage large_number:math givens.i[0]
data modify storage large_number:math givens.b set from storage large_number:math givens.j[0]
function large_number:n-th_degree_equation/givens/start
data modify storage large_number:math temp3 set from storage large_number:math temp_zero_list
data modify storage large_number:math temp3 append from storage large_number:math givens.out_i[]
data modify storage large_number:math naive_qr_method_R append from storage large_number:math temp3
data remove storage large_number:math naive_qr_method_input[0]
data modify storage large_number:math naive_qr_method_input[0] set from storage large_number:math givens.out_j
data remove storage large_number:math naive_qr_method_input[][0]
data modify storage large_number:math temp_zero_list append value 0d

data modify storage large_number:math temp_xz_c_list append from storage large_number:math temp_xz_c
data modify storage large_number:math temp_xz_s_list append from storage large_number:math temp_xz_s

scoreboard players remove #naive_qr_method.matrix.scale large_number.int 1
execute if score #naive_qr_method.matrix.scale large_number.int matches 2.. run function large_number:n-th_degree_equation/naive_qr_method/loop1
