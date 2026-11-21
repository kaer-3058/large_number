#为了牛顿法进行特别判断的，若除数模长过小则截断
data modify storage large_number:math complex_operation.z1 set from storage large_number:math list_ope_const_inp_2[0]
function large_number:complex_operation/modulus
#这里是以模长的绝对值是否小于0.01进行界定
execute store result score #temp1 large_number.int run data get storage large_number:math complex_operation.output 100
execute if score #temp1 large_number.int matches -1..0 as b09e-44-fded-6-efa5ffffef64 run function large_number:n-th_degree_equation/newton.s_method/list_div_list_bijective_mapping/as_entity_1

data modify storage large_number:math complex_operation.z1 set from storage large_number:math list_ope_const_inp[0]
execute unless score #temp1 large_number.int matches -1..0 run data modify storage large_number:math complex_operation.z2 set from storage large_number:math list_ope_const_inp_2[0]

#除法
function large_number:complex_operation/division
data modify storage large_number:math temp_complex_ope_z1 set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_complex_ope_z1 merge from storage large_number:math complex_operation.z2
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_complex_ope_z1.x set from storage large_number:math complex_operation.z2
execute if data storage large_number:math temp_complex_ope_z1{x:0d,i:0d} run data modify storage large_number:math complex_operation.output set value {x:1.797693134862315807E308d,i:0d}
data modify storage large_number:math list_ope_const_out append from storage large_number:math complex_operation.output


data remove storage large_number:math list_ope_const_inp[0]
data remove storage large_number:math list_ope_const_inp_2[0]
scoreboard players remove #sstemprr1 large_number.int 1
execute if score #sstemprr1 large_number.int matches 1.. run function large_number:n-th_degree_equation/newton.s_method/list_div_list_bijective_mapping/loop1
