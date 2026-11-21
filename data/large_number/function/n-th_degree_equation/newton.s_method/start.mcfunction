##牛顿迭代法增加根的精度

#function large_number:n-th_degree_equation/newton.s_method/start

#f'(x)
data modify storage large_number:math polynomial_n-th_derivative.input set from storage large_number:math n-th_degree_equation.input
function large_number:polynomial_n-th_derivative/r/1-th/start
data modify storage large_number:math temp_newton-s_method_fm set from storage large_number:math polynomial_n-th_derivative.output

data modify storage large_number:math temp_newton-s_method_fz set value [0d]
data modify storage large_number:math sstemp_nmo1 set from storage large_number:math temp_newton-s_method_fm
data modify storage large_number:math sstemp_nmo2 set from storage large_number:math n-th_degree_equation.input
data remove storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo2[-1]
function large_number:n-th_degree_equation/newton.s_method/macro1 with storage large_number:math
data remove storage large_number:math sstemp_nmo2[-1]

#浮点减法1
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-1]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-1]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-1] set from storage large_number:math temp1

#浮点减法2
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-2]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-2]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-2] set from storage large_number:math temp1

#浮点减法3
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-3]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-3]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-3] set from storage large_number:math temp1

#浮点减法4
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-4]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-4]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-4] set from storage large_number:math temp1

#浮点减法5
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-5]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-5]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-5] set from storage large_number:math temp1

#浮点减法6
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-6]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-6]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-6] set from storage large_number:math temp1

#浮点减法7
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-7]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-7]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-7] set from storage large_number:math temp1

#浮点减法8
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-8]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-8]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-8] set from storage large_number:math temp1

#浮点减法9
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-9]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-9]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-9] set from storage large_number:math temp1

#浮点减法10
data modify storage large_number:math temp1 set from storage large_number:math sstemp_nmo1[-10]
data modify storage large_number:math temp2 set value 0d
data modify storage large_number:math temp2 set from storage large_number:math sstemp_nmo2[-10]
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math sstemp_nmo1[-10] set from storage large_number:math temp1

data modify storage large_number:math temp_newton-s_method_fz prepend from storage large_number:math sstemp_nmo1[]
data modify storage large_number:math polynomial_value.x_list set from storage large_number:math n-th_degree_equ_out

#迭代核心
execute if score #temp_newton.s_method.loops large_number.int matches 1.. run function large_number:n-th_degree_equation/newton.s_method/all_loop
data modify storage large_number:math n-th_degree_equ_out set from storage large_number:math polynomial_value.x_list
data modify storage large_number:math n-th_degree_equation.output set from storage large_number:math n-th_degree_equ_out
