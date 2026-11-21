##六次方程

#data modify storage large_number:math n-th_degree_equation.input set value [7.0,6.0,-3.1,8.3]


#构建友矩阵
data modify storage large_number:math companion_matrix set value [[0d,0d,0d,0d,0d,1d],\
                                                                  [1d,0d,0d,0d,0d,1d],\
                                                                  [0d,1d,0d,0d,0d,1d],\
                                                                  [0d,0d,1d,0d,0d,1d],\
                                                                  [0d,0d,0d,1d,0d,1d],\
                                                                  [0d,0d,0d,0d,1d,1d]]

#系数归一化+取相反数，构建多项式对应的友矩阵
data modify storage large_number:math temp1 set from storage large_number:math n-th_degree_equation.input[0]
function large_number:n-th_degree_equation/macro/1 with storage large_number:math
data modify storage large_number:math float_division.input1 set from storage large_number:math n-th_degree_equation.input[6]
function large_number:division/float/start
data modify storage large_number:math companion_matrix[0][-1] set from storage large_number:math float_division.output
data modify storage large_number:math float_division.input1 set from storage large_number:math n-th_degree_equation.input[5]
function large_number:division/float/start
data modify storage large_number:math companion_matrix[1][-1] set from storage large_number:math float_division.output
data modify storage large_number:math float_division.input1 set from storage large_number:math n-th_degree_equation.input[4]
function large_number:division/float/start
data modify storage large_number:math companion_matrix[2][-1] set from storage large_number:math float_division.output
data modify storage large_number:math float_division.input1 set from storage large_number:math n-th_degree_equation.input[3]
function large_number:division/float/start
data modify storage large_number:math companion_matrix[3][-1] set from storage large_number:math float_division.output
data modify storage large_number:math float_division.input1 set from storage large_number:math n-th_degree_equation.input[2]
function large_number:division/float/start
data modify storage large_number:math companion_matrix[4][-1] set from storage large_number:math float_division.output
data modify storage large_number:math float_division.input1 set from storage large_number:math n-th_degree_equation.input[1]
function large_number:division/float/start
data modify storage large_number:math companion_matrix[5][-1] set from storage large_number:math float_division.output
