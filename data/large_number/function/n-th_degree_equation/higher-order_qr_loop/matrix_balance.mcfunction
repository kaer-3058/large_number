#进一步检查是否符合平衡的条件
execute store result score #temp1 large_number.int run data get storage large_number:math list_abs_num_out 1000000
execute if score #temp1 large_number.int matches -5..4 run return 0
data modify storage large_number:math temp_l_c set from storage large_number:math list_abs_num_out
#tellraw @a "---------------------------------"
#tellraw @a [{storage:"large_number:math",nbt:"temp_index"}," --> index"]
#tellraw @a {storage:"large_number:math",nbt:"temp_l_c"}
data modify storage large_number:math list_abs_num_inp set from storage large_number:math r_list
function large_number:n-th_degree_equation/higher-order_qr_loop/list_abs_num/start
execute unless data storage large_number:math list_abs_num_out run return 0
execute store result score #temp1 large_number.int run data get storage large_number:math list_abs_num_out 1000000
execute if score #temp1 large_number.int matches -5..4 run return 0
data modify storage large_number:math temp_l_r set from storage large_number:math list_abs_num_out
#tellraw @a {storage:"large_number:math",nbt:"temp_l_r"}

#矩阵平衡的缩放因子
function large_number:n-th_degree_equation/higher-order_qr_loop/round_lnc_lnr_div_ln4
execute if score #temp_approk_k large_number.int matches -1..0 run return 0
execute store result storage large_number:math temp1 int 1 run scoreboard players get #temp_approk_k large_number.int
#tellraw @a {score:{name:"#temp_approk_k",objective:"int"}}
execute if score #temp_approk_k large_number.int matches ..-101 run data modify storage large_number:math temp_f_approx set value 7.8886090522101180541E-31d
execute if score #temp_approk_k large_number.int matches 201.. run data modify storage large_number:math temp_f_approx set value 1.6069380442589902755E60d
execute if score #temp_approk_k large_number.int matches -100..200 run function large_number:n-th_degree_equation/higher-order_qr_loop/macro1 with storage large_number:math

#矩阵平衡，行乘列除
data modify storage large_number:math list_multiply_const_inp set from storage large_number:math r_list
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_f_approx
function large_number:n-th_degree_equation/higher-order_qr_loop/list_multiply_const/start
data modify storage large_number:math r_list set from storage large_number:math list_multiply_const_out
#tellraw @a {storage:"large_number:math",nbt:"temp_f_approx"}
#tellraw @a {storage:"large_number:math",nbt:"list_multiply_const_out"}

data modify storage large_number:math list_div_const_inp set from storage large_number:math c_list
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_f_approx
function large_number:n-th_degree_equation/higher-order_qr_loop/list_div_const/start
data modify storage large_number:math c_list set from storage large_number:math list_div_const_out
#tellraw @a {storage:"large_number:math",nbt:"list_div_const_out"}

#此索引下的行和列已更新
scoreboard players set #converged large_number.int 1
scoreboard players set #temp_balanceing large_number.int 1
