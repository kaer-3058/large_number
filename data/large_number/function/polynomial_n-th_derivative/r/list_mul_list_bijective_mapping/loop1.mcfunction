data modify storage large_number:math temp_z1 set from storage large_number:math list_ope_const_inp[0]

#乘法
execute store result storage large_number:math temp_z2 int 1 run scoreboard players get #temp_n-th.n large_number.int
execute unless score #temp_n-th.n large_number.int matches 1 run function large_number:polynomial_n-th_derivative/r/list_mul_list_bijective_mapping/macro1 with storage large_number:math
data modify storage large_number:math list_ope_const_out append from storage large_number:math temp_z1

scoreboard players remove #temp_n-th.n large_number.int 1

data remove storage large_number:math list_ope_const_inp[0]
execute if data storage large_number:math list_ope_const_inp[0] run function large_number:polynomial_n-th_derivative/r/list_mul_list_bijective_mapping/loop1
