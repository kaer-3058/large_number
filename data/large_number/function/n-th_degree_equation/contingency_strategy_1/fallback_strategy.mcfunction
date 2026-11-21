#原始策略

#根据判别式符号决定是否要求位移值
data modify storage large_number:math temp_2_2_tzz_del_sign set string storage large_number:math temp_del 0 1
execute unless data storage large_number:math {temp_2_2_tzz_del_sign:"-"} run function large_number:n-th_degree_equation/2_2_matrix_tzz/start

#位移 - 前
execute unless data storage large_number:math {temp_2_2_tzz_del_sign:"-"} run function large_number:n-th_degree_equation/wilkinson_shift/subra.all

#tellraw @a {storage:"large_number:math",nbt:"naive_qr_method_input"}

#朴素QR方法迭代
function large_number:n-th_degree_equation/naive_qr_method/start
data modify storage large_number:math naive_qr_method_input set from storage large_number:math naive_qr_method_RQ

#tellraw @a {storage:"large_number:math",nbt:"naive_qr_method_input"}

#位移 - 后
execute unless data storage large_number:math {temp_2_2_tzz_del_sign:"-"} run function large_number:n-th_degree_equation/wilkinson_shift/add.all

#tellraw @a {storage:"large_number:math",nbt:"naive_qr_method_input"}
