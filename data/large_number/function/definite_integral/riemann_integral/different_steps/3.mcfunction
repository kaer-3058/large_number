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

tellraw @a {"translate":"large_number.definite_integral.end","fallback": "\u00A77\u00A7o定积分求解完成"}
scoreboard players set ##definite_integral.different_steps.start int 4
