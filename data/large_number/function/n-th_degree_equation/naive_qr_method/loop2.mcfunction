#R矩阵左乘Q矩阵的循环

data modify storage large_number:math temp_xz_c set from storage large_number:math temp_xz_c_list[0]
data remove storage large_number:math temp_xz_c_list[0]
data modify storage large_number:math temp_xz_s set from storage large_number:math temp_xz_s_list[0]
data remove storage large_number:math temp_xz_s_list[0]
data modify storage large_number:math givens.i set value []
data modify storage large_number:math givens.i append from storage large_number:math naive_qr_method_R[][0]
data modify storage large_number:math givens.j set value []
data modify storage large_number:math givens.j append from storage large_number:math naive_qr_method_R[][1]
function large_number:n-th_degree_equation/givens/spe_2/start

data remove storage large_number:math naive_qr_method_R[][0]
execute if data storage large_number:math temp_xz_c_list[0] run function large_number:n-th_degree_equation/naive_qr_method/loop2
