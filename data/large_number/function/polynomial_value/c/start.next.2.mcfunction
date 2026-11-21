data modify storage large_number:math list_ope_const_out set from storage large_number:math polynomial_value.x_list

#把输入值转化为标准格式的复数
data modify storage large_number:math temp_complex_ope_z1 set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_complex_ope_z1 merge from storage large_number:math Store_f_value_coef[0]
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z1.x set from storage large_number:math Store_f_value_coef[0]

data modify storage large_number:math list_ope_const_out[] set from storage large_number:math temp_complex_ope_z1
