# round((lnc-lnr)/ln4)
# function large_number:n-th_degree_equation/higher-order_qr_loop/round_lnc_lnr_div_ln4

data modify storage large_number:math ln_double.input set from storage large_number:math temp_l_c
function large_number:ln_double/start
scoreboard players operation #ln_c large_number.int = #ln_double.output large_number.int
data modify storage large_number:math ln_double.input set from storage large_number:math temp_l_r
function large_number:ln_double/start
execute store result storage large_number:math temp1 int 0.721347520444481703679962340500 run scoreboard players operation #ln_c large_number.int -= #ln_double.output large_number.int
execute store result score #temp_approk_k large_number.int run data get storage large_number:math temp1
scoreboard players operation #temp2 large_number.int = #temp_approk_k large_number.int
scoreboard players operation #temp2 large_number.int %= 10000 const
scoreboard players operation #temp_approk_k large_number.int /= 10000 const
execute if score #temp2 large_number.int matches 5000.. run scoreboard players add #temp_approk_k large_number.int 1
