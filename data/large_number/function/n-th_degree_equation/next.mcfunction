#检查复数特征值
function large_number:n-th_degree_equation/test_complex_eigenvalue/start

#输出根
data modify storage large_number:math n-th_degree_equ_out set value []
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[0][0]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[1][1]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[2][2]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[3][3]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[4][4]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[5][5]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[6][6]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[7][7]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[8][8]
data modify storage large_number:math n-th_degree_equ_out append from storage large_number:math QR_factorization_R[9][9]

data modify storage large_number:math n-th_degree_equation.output set from storage large_number:math n-th_degree_equ_out

# storage large_number:math n-th_degree_equation.output

#根乘缩放因子
#data modify storage large_number:math list_multiply_const_inp set from storage large_number:math n-th_degree_equ_out
#data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_coe_m1
#execute if score #temp_suo_fang_nth large_number.int matches 1.. run function large_number:n-th_degree_equation/list_multiply_const_with_i/start
#execute if score #temp_suo_fang_nth large_number.int matches 1.. run data modify storage large_number:math n-th_degree_equ_out set from storage large_number:math list_multiply_const_out
#data modify storage large_number:math list_multiply_const_inp set from storage large_number:math n-th_degree_equ_out
#data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_coe_m2
#execute if score #temp_suo_fang_nth large_number.int matches 2.. run function large_number:n-th_degree_equation/list_multiply_const_with_i/start
#execute if score #temp_suo_fang_nth large_number.int matches 2.. run data modify storage large_number:math n-th_degree_equ_out set from storage large_number:math list_multiply_const_out
