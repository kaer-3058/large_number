data modify storage large_number:math temp_z1 set from storage large_number:math list_ope_const_inp[0]

#乘法
#把输入值转化为标准格式的复数
data modify storage large_number:math temp_complex_ope_z1 set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_complex_ope_z1 merge from storage large_number:math temp_z1
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z1.x set from storage large_number:math temp_z1
execute store result storage large_number:math temp_complex_ope_z1.z2 int 1 run scoreboard players get #temp_n-th.n large_number.int
execute unless score #temp_n-th.n large_number.int matches 1 run function large_number:polynomial_n-th_derivative/c/list_mul_list_bijective_mapping/macro1 with storage large_number:math temp_complex_ope_z1
data remove storage large_number:math temp_complex_ope_z1.z2
data modify storage large_number:math list_ope_const_out append from storage large_number:math temp_complex_ope_z1

scoreboard players remove #temp_n-th.n large_number.int 1

data remove storage large_number:math list_ope_const_inp[0]
execute if data storage large_number:math list_ope_const_inp[0] run function large_number:polynomial_n-th_derivative/c/list_mul_list_bijective_mapping/loop1
