#回代残差

#f(x)
data modify storage large_number:math polynomial_value.coefficient set from storage large_number:math n-th_degree_equation.input
data modify storage large_number:math polynomial_value.x_list set from storage large_number:math n-th_degree_equ_out
function large_number:polynomial_value/c/start
data modify storage large_number:math list_ope_const_inp set from storage large_number:math polynomial_value.output

#|f(x)|
function large_number:n-th_degree_equation/newton.s_method/list_modulus/start
data modify storage large_number:math n-th_degree_equation.error.residual_error_abs set from storage large_number:math list_ope_const_out
