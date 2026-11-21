#牛顿迭代法的步进残差

#f(x)
data modify storage large_number:math polynomial_value.coefficient set from storage large_number:math n-th_degree_equation.input
data modify storage large_number:math polynomial_value.x_list set from storage large_number:math n-th_degree_equ_out
function large_number:polynomial_value/c/start
data modify storage large_number:math temp_sla_list_ope_const_inp set from storage large_number:math polynomial_value.output
#tellraw @a {storage:"large_number:math",nbt:"temp_sla_list_ope_const_inp"}

#f'(x)
data modify storage large_number:math polynomial_n-th_derivative.input set from storage large_number:math n-th_degree_equation.input
function large_number:polynomial_n-th_derivative/r/1-th/start
data modify storage large_number:math polynomial_value.coefficient set from storage large_number:math polynomial_n-th_derivative.output
function large_number:polynomial_value/c/start
data modify storage large_number:math temp_sla_list_ope_const_inp_2 set from storage large_number:math polynomial_value.output
data modify storage large_number:math n-th_degree_equation.error.d_f(x) set from storage large_number:math polynomial_value.output
#tellraw @a {storage:"large_number:math",nbt:"temp_sla_list_ope_const_inp_2"}

#f(x)/'f(x)
data modify storage large_number:math list_ope_const_inp set from storage large_number:math temp_sla_list_ope_const_inp
data modify storage large_number:math list_ope_const_inp_2 set from storage large_number:math temp_sla_list_ope_const_inp_2
function large_number:n-th_degree_equation/newton.s_method/list_div_list_bijective_mapping/start
data modify storage large_number:math list_ope_const_inp set from storage large_number:math list_ope_const_out

#|f(x)/'f(x)|
function large_number:n-th_degree_equation/newton.s_method/list_modulus/start
data modify storage large_number:math n-th_degree_equation.error.newton_method_step_size set from storage large_number:math list_ope_const_out
#tellraw @a {storage:"large_number:math",nbt:"list_ope_const_out"}
