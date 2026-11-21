##复变函数 - 指数函数 - 任意幂
#可指定分支

#data modify storage large_number:math exp_any.input.base set value {x:4.0,i:-7.0}
#data modify storage large_number:math exp_any.input.expon set value {x:2.0,i:3.0}
#scoreboard players set #complex_function_k large_number.int 0

#function large_number:elem_complex_function/exp_any/start

data modify storage large_number:math store_exp_any_input set from storage large_number:math exp_any.input

#把输入值转化为标准格式的复数
data modify storage large_number:math temp_comp_exp_any_base set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_comp_exp_any_base merge from storage large_number:math exp_any.input.base
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_comp_exp_any_base.x set from storage large_number:math exp_any.input.base
data modify storage large_number:math temp_comp_exp_any_expon set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_comp_exp_any_expon merge from storage large_number:math exp_any.input.expon
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_comp_exp_any_expon.x set from storage large_number:math exp_any.input.expon

execute if data storage large_number:math temp_comp_exp_any_expon{i:0.0} run return run function large_number:elem_complex_function/exp_any/exp_only_re/start
execute if data storage large_number:math temp_comp_exp_any_expon{x:0.0} run return run function large_number:elem_complex_function/exp_any/exp_only_im/start
function large_number:elem_complex_function/exp_any/exp_rest/start
