data modify storage large_number:math QR_factorization_R set from storage large_number:math naive_qr_method_input

#尾处理
execute if score #n-th_degree_equ.n-th large_number.int matches 3.. run function large_number:n-th_degree_equation/next
data modify storage large_number:math n-th_degree_equation.input set from storage large_number:math Store_n-th_degree_equation_input

#使用牛顿迭代法增加精度
scoreboard players operation #temp_newton.s_method.loops large_number.int = #n-th_degree_equ.newton.s_method.loops large_number.int
execute if score #n-th_degree_equ.n-th large_number.int matches 2.. if score #temp_newton.s_method.loops large_number.int matches 1.. run scoreboard players add #n-th_degree_equation.diff_info large_number.int 1




