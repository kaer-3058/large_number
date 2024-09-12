##定积分 - 黎曼积分法

#只能求一重积分，被积函数必须"黎曼可积"，求出来的结果只能是个数（无法处理含参结果），取积分变量为ｘ
#前置算法："表达式求值 - 科学计算"

#积分区域 下限：data modify storage large_number:math expression_evaluation.definite_integral.a set value 2.0
#积分区域 上限：data modify storage large_number:math expression_evaluation.definite_integral.b set value 3.0
#积分区间内小矩形的数量：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 300
#取正整数，上限是1000000000，不宜太多
#被积函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式
#输出：storage large_number:math expression_evaluation.definite_integral.output

#公式 (梯形法则)：∫[a,b]f(x)dx ≈ ((b-a)/k)*((f(a)+f(b))/2+Σ[n=1,k-1]f(a+((b-a)/k)*n)))
#其中k是区间内小矩形的数量。这里的小矩形的高度取的是小区间右端的函数值。

data remove storage large_number:math expression_evaluation.definite_integral.output

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.definite_integral.b
data modify storage large_number:math temp2 set from storage large_number:math expression_evaluation.definite_integral.a
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute store success score #input+- int if data storage large_number:math {stemp1:"-"}
execute if score #input+- int matches 1 run data modify storage large_number:math temp2 set string storage large_number:math temp2 1 -1
execute if score #input+- int matches 1 run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute if score #input+- int matches 0 run data modify storage large_number:math temp3 set value "-"
function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:definite_integral/riemann_integral/float_subtra

execute store result score #expression_evaluation.definite_integral.dx_times int run data get storage large_number:math expression_evaluation.definite_integral.dx_times
scoreboard players operation #Store_expression_evaluation.definite_integral.dx_times int = #expression_evaluation.definite_integral.dx_times int
scoreboard players remove #Store_expression_evaluation.definite_integral.dx_times int 1

scoreboard players set #sstemp1 int 1000000000
scoreboard players operation #sstemp1 int /= #expression_evaluation.definite_integral.dx_times int
function large_number:definite_integral/riemann_integral/macro5 with storage large_number:math

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math sstemp_a_b_divx set from storage large_number:math sstemp06
data modify storage large_number:math sstempr set value []
scoreboard players set #Store_expression_evaluation.definite_integral.loop int 1
execute unless score #Store_expression_evaluation.definite_integral.loop int > #Store_expression_evaluation.definite_integral.dx_times int run function large_number:definite_integral/riemann_integral/loop


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
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/as_entity_1

#double除以2
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro4 with storage large_number:math
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 1
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro5 with storage large_number:math

execute if data storage large_number:math sstempr[0] positioned .0 .0 .0 run function large_number:definite_integral/riemann_integral/loop2

data modify storage large_number:math float_multiply.input2 set from storage large_number:math sstemp_a_b_divx
function large_number:float_mul.high_precision/start
data modify storage large_number:math expression_evaluation.definite_integral.output set from storage large_number:math float_multiply.output

tellraw @a {"text":"\u00A77\u00A7o定积分求解完成"}
