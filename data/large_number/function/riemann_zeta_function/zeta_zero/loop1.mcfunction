#迭代

data modify storage large_number:math float_division.input1 set from storage large_number:math temp_z_tn-1
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_z_tn
function large_number:division/float/start

#浮点减法
data modify storage large_number:math temp1 set value 1.0
data modify storage large_number:math temp2 set from storage large_number:math float_division.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math float_division.input2 set from storage large_number:math temp1

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_tn
data modify storage large_number:math temp2 set from storage large_number:math temp_tn-1
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math float_division.input1 set from storage large_number:math temp1
function large_number:division/float/start

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_tn
data modify storage large_number:math temp2 set from storage large_number:math float_division.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

#更新初值
data modify storage large_number:math temp_tn-1 set from storage large_number:math temp_tn
data modify storage large_number:math temp_tn set from storage large_number:math temp1
data modify storage large_number:math temp_z_tn-1 set from storage large_number:math temp_z_tn

#Z(t_{n})
data modify storage large_number:math riemann_zeta_z.input set from storage large_number:math temp_tn
function large_number:riemann_zeta_function/critical_line/z_start
data modify storage large_number:math temp_z_tn set from storage large_number:math riemann_zeta_z.output

#tellraw @a "-------------------------------------------------"
#tellraw @a {storage:"large_number:math",nbt:"temp_tn"}
#tellraw @a {storage:"large_number:math",nbt:"temp_tn-1"}
#tellraw @a {storage:"large_number:math",nbt:"temp_z_tn"}
#tellraw @a {storage:"large_number:math",nbt:"temp_z_tn-1"}

scoreboard players remove #temp_zeta_zero.ope_loops large_number.int 1
execute if score #temp_zeta_zero.ope_loops large_number.int matches 1.. run function large_number:riemann_zeta_function/zeta_zero/loop1
