##定积分 - [0,1]区间的积分

#只能求一重积分，被积函数在积分区间内必须"黎曼可积"，求出来的结果只能是个数（无法处理含参结果），取积分变量为ｘ
#前置算法："表达式求值 - 科学计算"

#积分区域 下限：data modify storage large_number:math expression_evaluation.definite_integral.a set value 2.0
#积分区域 上限：data modify storage large_number:math expression_evaluation.definite_integral.b set value 3.0
#积分网格密度：data modify storage large_number:math expression_evaluation.definite_integral.dx_times set value 100
#取正整数，上限是1000000000，不宜太多
#被积函数直接取"表达式求值 - 科学计算"解析出来的逆波兰式
#输出：storage large_number:math expression_evaluation.definite_integral.output

#公式：定义g(x)=((b-a)/x)*Σ[n=1,x]f(a+((b-a)/x)*n))，则 ∫[a,b]f(x)dx = lim[x→∞]g(x)
#g(x)就是黎曼积分法的小区间的面积和，自变量就是总区间分成的小区间的个数。这里的小区间的网格取的是区间右端。

data remove storage large_number:math expression_evaluation.definite_integral.output

execute store result score #expression_evaluation.definite_integral.dx_times int run data get storage large_number:math expression_evaluation.definite_integral.dx_times
scoreboard players operation #Store_expression_evaluation.definite_integral.dx_times int = #expression_evaluation.definite_integral.dx_times int
scoreboard players remove #Store_expression_evaluation.definite_integral.dx_times int 1

scoreboard players set #sstemp_last_div int 1000000000
execute store result storage large_number:math sstemp_a_b_divx double .000000001 run scoreboard players operation #sstemp_last_div int /= #expression_evaluation.definite_integral.dx_times int

data modify storage large_number:math sstempr set value []
scoreboard players set #Store_expression_evaluation.definite_integral.loop int 1
execute unless score #Store_expression_evaluation.definite_integral.loop int >= #Store_expression_evaluation.definite_integral.dx_times int run function large_number:definite_integral/riemann_integral/0_1/loop

#(f(0)+f(1))/2

data modify storage large_number:math expression_evaluation_variables."ｘ" set value 0.0

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/fa_addi_fb_div2/macro1 with storage large_number:math

data modify storage large_number:math expression_evaluation_variables."ｘ" set value 1.0

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

function large_number:definite_integral/riemann_integral/0_1/macro3 with storage large_number:math float_multiply
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
function large_number:definite_integral/riemann_integral/0_1/macro2 with storage large_number:math
data modify storage large_number:math expression_evaluation.definite_integral.output set from storage large_number:math temp4

tellraw @a {"text":"\u00A77\u00A7o定积分求解完成"}
