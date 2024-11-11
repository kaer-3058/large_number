#loop1
#(0,1)开区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute if data storage large_number:math {random_number_0_1:0.0} store result storage large_number:math random_number_0_1 double .000000001 run random value 1..999999999
execute if data storage large_number:math {random_number_0_1:1.0} store result storage large_number:math random_number_0_1 double .000000001 run random value 1..999999999
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math random_number_0_1

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/macro3 with storage large_number:math

scoreboard players remove #Store_expression_evaluation.definite_integral.loop int 1
execute if score #Store_expression_evaluation.definite_integral.loop int matches 1.. run function large_number:definite_integral/monte_carlo_method/0_1/loop1
