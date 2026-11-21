##黎曼zeta函数的第N个非平凡零点

#输入[int]：data modify storage large_number:math zeta_zero.input set value 1
#必须是非零整数，不宜超过138000
#估值迭代次数：data modify storage large_number:math zeta_zero.valuation_loops set value 10
#计算迭代次数：data modify storage large_number:math zeta_zero.ope_loops set value 5
#一般来说，宜设置估值迭代次数为10，计算迭代次数为5。具体值可以输入临界线函数来测试是不是真的零点。

#function large_number:riemann_zeta_function/zeta_zero/start

data modify storage large_number:math zeta_zero.output set value {x:0.5,i:0d}

data modify storage large_number:math zeta_zero_inp set from storage large_number:math zeta_zero.input
data modify storage large_number:math stemp1 set string storage large_number:math zeta_zero_inp 0 1
scoreboard players set #temp_riemann_zeta_zero_inp_is- large_number.int 0
execute if data storage large_number:math {stemp1:"-"} run function large_number:riemann_zeta_function/zeta_zero/macro1 with storage large_number:math

#估值

#x-7/8
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:riemann_zeta_function/zeta_zero/as_entity_1

#W((x-7/8)/e)
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_x_subra_7_8
function large_number:gamma_function/robert_h_windschitl/mul_1_euler_e
data modify storage large_number:math lambertw.input set from storage large_number:math float_multiply.output
data modify storage large_number:math newton.s_method.loops set from storage large_number:math zeta_zero.valuation_loops
data modify storage large_number:math lambertw.branch set value 0
function large_number:lambertw/high_precision_no_tell
#tellraw @a {storage:"large_number:math",nbt:"lambertw"}

#2π(x-7/8)
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_x_subra_7_8
function large_number:gamma_function/robert_h_windschitl/mul_2pi

#(2π(x-7/8))/(W((x-7/8)/e))
data modify storage large_number:math float_division.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_division.input2 set from storage large_number:math lambertw.output
function large_number:division/float/start
data modify storage large_number:math temp_g_n set from storage large_number:math float_division.output

#设置初值

#ln(g(n))
data modify storage large_number:math ln_high_precision.input set from storage large_number:math temp_g_n
function large_number:ln_high_precision/start

#2π/(ln(g(n)))
data modify storage large_number:math float_reciprocal.input set from storage large_number:math ln_high_precision.output
function large_number:riemann_zeta_function/zeta_zero/2pi_div__

#g(n)-2π/(ln(g(n)))
#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_g_n
data modify storage large_number:math temp2 set from storage large_number:math float_reciprocal.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math temp_tn-1 set from storage large_number:math temp1
data modify storage large_number:math temp_tn set from storage large_number:math temp_g_n

#Z(t_{n-1})
data modify storage large_number:math riemann_zeta_z.input set from storage large_number:math temp_tn-1
function large_number:riemann_zeta_function/critical_line/z_start
data modify storage large_number:math temp_z_tn-1 set from storage large_number:math riemann_zeta_z.output

#Z(t_{n})
data modify storage large_number:math riemann_zeta_z.input set from storage large_number:math temp_tn
function large_number:riemann_zeta_function/critical_line/z_start
data modify storage large_number:math temp_z_tn set from storage large_number:math riemann_zeta_z.output

#tellraw @a "-------------------------------------------------"
#tellraw @a {storage:"large_number:math",nbt:"temp_tn"}
#tellraw @a {storage:"large_number:math",nbt:"temp_tn-1"}
#tellraw @a {storage:"large_number:math",nbt:"temp_z_tn"}
#tellraw @a {storage:"large_number:math",nbt:"temp_z_tn-1"}

execute store result score #temp_zeta_zero.ope_loops large_number.int run data get storage large_number:math zeta_zero.ope_loops
execute if score #temp_zeta_zero.ope_loops large_number.int matches 1.. run function large_number:riemann_zeta_function/zeta_zero/loop1

execute if score #temp_riemann_zeta_zero_inp_is- large_number.int matches 1 run function large_number:riemann_zeta_function/zeta_zero/macro2 with storage large_number:math
data modify storage large_number:math zeta_zero.output.i set from storage large_number:math temp_tn

execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate": "large_number.zeta_zero.ope_end","fallback": "\u00A77\u00A7o黎曼零点求解完成"}
