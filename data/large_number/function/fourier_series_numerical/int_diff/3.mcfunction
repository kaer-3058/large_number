#(f(a)+f(b))/2

data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math expression_evaluation.definite_integral.a

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro1 with storage large_number:math

data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math expression_evaluation.definite_integral.b

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro2 with storage large_number:math

function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro3 with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/as_entity_1

#double除以2
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro4 with storage large_number:math
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 1
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro5 with storage large_number:math

execute if data storage large_number:math sstempr[0] positioned .0 .0 .0 run function large_number:definite_integral/riemann_integral/loop2

data modify storage large_number:math float_multiply.input2 set from storage large_number:math sstemp_a_b_divx
function large_number:float_mul.high_precision/start
data modify storage large_number:math expression_evaluation.definite_integral.output set from storage large_number:math float_multiply.output


#传递信号
execute if data storage large_number:math fourier_series_numerical{abnum:"A0"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 4
execute if data storage large_number:math fourier_series_numerical{abnum:"A1"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 5
execute if data storage large_number:math fourier_series_numerical{abnum:"B1"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 6
execute if data storage large_number:math fourier_series_numerical{abnum:"A2"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 7
execute if data storage large_number:math fourier_series_numerical{abnum:"B2"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 8
execute if data storage large_number:math fourier_series_numerical{abnum:"A3"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 9
execute if data storage large_number:math fourier_series_numerical{abnum:"B3"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 10
execute if data storage large_number:math fourier_series_numerical{abnum:"A4"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 11
execute if data storage large_number:math fourier_series_numerical{abnum:"B4"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 12
execute if data storage large_number:math fourier_series_numerical{abnum:"A5"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 13
execute if data storage large_number:math fourier_series_numerical{abnum:"B5"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 14
execute if data storage large_number:math fourier_series_numerical{abnum:"A6"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 15
execute if data storage large_number:math fourier_series_numerical{abnum:"B6"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 16
execute if data storage large_number:math fourier_series_numerical{abnum:"A7"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 17
execute if data storage large_number:math fourier_series_numerical{abnum:"B7"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 18
execute if data storage large_number:math fourier_series_numerical{abnum:"A8"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 19
execute if data storage large_number:math fourier_series_numerical{abnum:"B8"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 20
execute if data storage large_number:math fourier_series_numerical{abnum:"A9"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 21
execute if data storage large_number:math fourier_series_numerical{abnum:"B9"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 22
execute if data storage large_number:math fourier_series_numerical{abnum:"A10"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 23
execute if data storage large_number:math fourier_series_numerical{abnum:"B10"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 24

execute if data storage large_number:math fourier_series_numerical{abnum:"A11"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 25
execute if data storage large_number:math fourier_series_numerical{abnum:"B11"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 26
execute if data storage large_number:math fourier_series_numerical{abnum:"A12"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 27
execute if data storage large_number:math fourier_series_numerical{abnum:"B12"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 28
execute if data storage large_number:math fourier_series_numerical{abnum:"A13"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 29
execute if data storage large_number:math fourier_series_numerical{abnum:"B13"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 30
execute if data storage large_number:math fourier_series_numerical{abnum:"A14"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 31
execute if data storage large_number:math fourier_series_numerical{abnum:"B14"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 32
execute if data storage large_number:math fourier_series_numerical{abnum:"A15"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 33
execute if data storage large_number:math fourier_series_numerical{abnum:"B15"} run scoreboard players set #temp_fourier_series_numerical.tick.start int 34


execute if score #fourier_series_numerical.tell_mode int matches 1 run tellraw @a [{"translate":"large_number.fourier_series_numerical.diff_end","fallback":"\u00A77\u00A7o傅里叶级数：%1$s\u00A77\u00A7o的积分求解完成","with": [{"nbt":"fourier_series_numerical.abnum","storage":"large_number:math","color":"#dbdbdb","italic":true}]}]
