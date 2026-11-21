#loop1
#(0,1)开区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute if data storage large_number:math {random_number_0_1:0.0} store result storage large_number:math random_number_0_1 double .000000001 run random value 1..999999999
execute if data storage large_number:math {random_number_0_1:1.0} store result storage large_number:math random_number_0_1 double .000000001 run random value 1..999999999
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math random_number_0_1

#解析逆波兰式 - 实函数
function large_number:definite_integral/int_expression_ope
data modify storage large_number:math sstempr set from storage large_number:math expression_evaluation.output

scoreboard players remove #Store_expression_evaluation.definite_integral.loop large_number.int 1
execute if score #Store_expression_evaluation.definite_integral.loop large_number.int matches 1.. run function large_number:definite_integral/monte_carlo_method/0_1/loop1
