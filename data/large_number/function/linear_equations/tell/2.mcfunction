data modify storage large_number:math linear_equations_tell.1_1 set string storage large_number:math linear_equations_inp[0][0] 0 -1
data modify storage large_number:math linear_equations_tell.1_2 set string storage large_number:math linear_equations_inp[0][1] 0 -1

data modify storage large_number:math linear_equations_tell.2_1 set string storage large_number:math linear_equations_inp[1][0] 0 -1
data modify storage large_number:math linear_equations_tell.2_2 set string storage large_number:math linear_equations_inp[1][1] 0 -1

data modify storage large_number:math linear_equations_tell.b_1 set string storage large_number:math linear_equations.inputB[0] 0 -1
data modify storage large_number:math linear_equations_tell.b_2 set string storage large_number:math linear_equations.inputB[1] 0 -1

data modify storage large_number:math linear_equations_tell.c_1 set string storage large_number:math linear_equations.output[0] 0 -1
data modify storage large_number:math linear_equations_tell.c_2 set string storage large_number:math linear_equations.output[1] 0 -1

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.1_2
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.1_2 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.2_2
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.2_2 set from storage large_number:math stemp2


function large_number:linear_equations/tell/2.macro with storage large_number:math linear_equations_tell
