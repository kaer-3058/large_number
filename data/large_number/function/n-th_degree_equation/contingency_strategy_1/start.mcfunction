#针对矩阵不收敛使用的补充策略，这是策略1

data modify storage large_number:math temp_2_2_tzz_del_sign set string storage large_number:math temp_del 0 1
execute if data storage large_number:math {temp_2_2_tzz_del_sign:"-"} run data modify storage large_number:math temp_tz_out_1 set value 0.5
execute unless data storage large_number:math {temp_2_2_tzz_del_sign:"-"} run function large_number:n-th_degree_equation/2_2_matrix_tzz/start
execute store result score #temp1 large_number.int run data get storage large_number:math temp_tz_out_1 1000000000
execute if score #temp1 large_number.int matches -500000000..499999999 run data modify storage large_number:math temp_tz_out_1 set value 0.5

#位移 - 前
function large_number:n-th_degree_equation/wilkinson_shift/subra.all

#朴素QR方法迭代
function large_number:n-th_degree_equation/naive_qr_method/start
data modify storage large_number:math naive_qr_method_input set from storage large_number:math naive_qr_method_RQ

#位移 - 后
function large_number:n-th_degree_equation/wilkinson_shift/add.all
