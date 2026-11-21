data modify storage large_number:math linear_equations_tell.1_1 set string storage large_number:math linear_equations_inp[0][0] 0 -1
data modify storage large_number:math linear_equations_tell.1_2 set string storage large_number:math linear_equations_inp[0][1] 0 -1
data modify storage large_number:math linear_equations_tell.1_3 set string storage large_number:math linear_equations_inp[0][2] 0 -1
data modify storage large_number:math linear_equations_tell.1_4 set string storage large_number:math linear_equations_inp[0][3] 0 -1

data modify storage large_number:math linear_equations_tell.2_1 set string storage large_number:math linear_equations_inp[1][0] 0 -1
data modify storage large_number:math linear_equations_tell.2_2 set string storage large_number:math linear_equations_inp[1][1] 0 -1
data modify storage large_number:math linear_equations_tell.2_3 set string storage large_number:math linear_equations_inp[1][2] 0 -1
data modify storage large_number:math linear_equations_tell.2_4 set string storage large_number:math linear_equations_inp[1][3] 0 -1

data modify storage large_number:math linear_equations_tell.3_1 set string storage large_number:math linear_equations_inp[2][0] 0 -1
data modify storage large_number:math linear_equations_tell.3_2 set string storage large_number:math linear_equations_inp[2][1] 0 -1
data modify storage large_number:math linear_equations_tell.3_3 set string storage large_number:math linear_equations_inp[2][2] 0 -1
data modify storage large_number:math linear_equations_tell.3_4 set string storage large_number:math linear_equations_inp[2][3] 0 -1

data modify storage large_number:math linear_equations_tell.4_1 set string storage large_number:math linear_equations_inp[3][0] 0 -1
data modify storage large_number:math linear_equations_tell.4_2 set string storage large_number:math linear_equations_inp[3][1] 0 -1
data modify storage large_number:math linear_equations_tell.4_3 set string storage large_number:math linear_equations_inp[3][2] 0 -1
data modify storage large_number:math linear_equations_tell.4_4 set string storage large_number:math linear_equations_inp[3][3] 0 -1

data modify storage large_number:math linear_equations_tell.b_1 set string storage large_number:math linear_equations.inputB[0] 0 -1
data modify storage large_number:math linear_equations_tell.b_2 set string storage large_number:math linear_equations.inputB[1] 0 -1
data modify storage large_number:math linear_equations_tell.b_3 set string storage large_number:math linear_equations.inputB[2] 0 -1
data modify storage large_number:math linear_equations_tell.b_4 set string storage large_number:math linear_equations.inputB[3] 0 -1

data modify storage large_number:math linear_equations_tell.c_1 set string storage large_number:math linear_equations.output[0] 0 -1
data modify storage large_number:math linear_equations_tell.c_2 set string storage large_number:math linear_equations.output[1] 0 -1
data modify storage large_number:math linear_equations_tell.c_3 set string storage large_number:math linear_equations.output[2] 0 -1
data modify storage large_number:math linear_equations_tell.c_4 set string storage large_number:math linear_equations.output[3] 0 -1

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.1_2
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.1_2 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.2_2
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.2_2 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.3_2
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.3_2 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.4_2
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.4_2 set from storage large_number:math stemp2


data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.1_3
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.1_3 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.2_3
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.2_3 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.3_3
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.3_3 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.4_3
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.4_3 set from storage large_number:math stemp2


data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.1_4
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.1_4 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.2_4
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.2_4 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.3_4
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.3_4 set from storage large_number:math stemp2

data modify storage large_number:math stemp2 set from storage large_number:math linear_equations_tell.4_4
data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/tell/macro.add_sign with storage large_number:math
data modify storage large_number:math linear_equations_tell.4_4 set from storage large_number:math stemp2


function large_number:linear_equations/tell/4.macro with storage large_number:math linear_equations_tell
