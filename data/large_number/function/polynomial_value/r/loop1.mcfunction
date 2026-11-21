#实数列表乘列表 (一一对应的乘法)
data modify storage large_number:math list_ope_const_inp_2 set from storage large_number:math store_list_ope_const_inp
function large_number:polynomial_value/r/list_mul_list_bijective_mapping/start
data modify storage large_number:math list_ope_const_inp set from storage large_number:math list_ope_const_out

#实数列表加常数
data modify storage large_number:math temp_float_addi_2 set from storage large_number:math Store_f_value_coef[0]
function large_number:polynomial_value/r/list_addi_const/start
data modify storage large_number:math list_ope_const_inp set from storage large_number:math list_ope_const_out


data remove storage large_number:math Store_f_value_coef[0]
execute if data storage large_number:math Store_f_value_coef[0] run function large_number:polynomial_value/r/loop1
