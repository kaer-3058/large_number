##任意正数的幂 - 开n次根
#nroot(N,x)

#公式，a^(1/b) = e^(ln(a)/b)

#ln(a)
data modify storage large_number:math ln_high_precision.input set from storage large_number:math temp_coe_m
function large_number:ln_high_precision/start

#ln(a)/b
# storage large_number:math ln_high_precision.output
scoreboard players set #sstempv large_number.int 0
execute if score #n-th_degree_equ.n-th large_number.int matches 3 run function large_number:n-th_degree_equation/nroot/3_th_root with storage large_number:math ln_high_precision
execute if score #n-th_degree_equ.n-th large_number.int matches 4 run function large_number:n-th_degree_equation/nroot/4_th_root with storage large_number:math ln_high_precision
execute if score #n-th_degree_equ.n-th large_number.int matches 5 run function large_number:n-th_degree_equation/nroot/5_th_root with storage large_number:math ln_high_precision
execute if score #n-th_degree_equ.n-th large_number.int matches 6 run function large_number:n-th_degree_equation/nroot/6_th_root with storage large_number:math ln_high_precision
execute if score #n-th_degree_equ.n-th large_number.int matches 7 run function large_number:n-th_degree_equation/nroot/7_th_root with storage large_number:math ln_high_precision
execute if score #n-th_degree_equ.n-th large_number.int matches 8 run function large_number:n-th_degree_equation/nroot/8_th_root with storage large_number:math ln_high_precision
execute if score #n-th_degree_equ.n-th large_number.int matches 9 run function large_number:n-th_degree_equation/nroot/9_th_root with storage large_number:math ln_high_precision
execute if score #n-th_degree_equ.n-th large_number.int matches 10 run function large_number:n-th_degree_equation/nroot/10_th_root

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp large_number.int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players operation #_exp large_number.int -= #sstempv large_number.int
function large_number:gamma_function/stirling/macro1 with storage large_number:math

#e^(ln(a)/b)
data modify storage large_number:math exp_e^x.input set from storage large_number:math sstemp06
function large_number:exp_e.x/start
data modify storage large_number:math temp_coe_m set from storage large_number:math exp_e^x.output
