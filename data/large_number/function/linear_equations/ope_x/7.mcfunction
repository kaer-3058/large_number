data modify storage large_number:math float_division.input1 set from storage large_number:math store_vecb[-1]
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_output_matrix[-1][-1]
function large_number:division/float/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_division.output
data modify storage large_number:math temp_x prepend from storage large_number:math float_division.output

data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[-2][-1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-2]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math store_vecb[-2] set from storage large_number:math temp1

data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[-3][-1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-3]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math store_vecb[-3] set from storage large_number:math temp1

data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[-4][-1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-4]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math store_vecb[-4] set from storage large_number:math temp1

data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[-5][-1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-5]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math store_vecb[-5] set from storage large_number:math temp1

data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[-6][-1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-6]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math store_vecb[-6] set from storage large_number:math temp1

data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[-7][-1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-7]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
data modify storage large_number:math store_vecb[-7] set from storage large_number:math temp1

data remove storage large_number:math temp_output_matrix[-2][-1]
data remove storage large_number:math temp_output_matrix[-3][-1]
data remove storage large_number:math temp_output_matrix[-4][-1]
data remove storage large_number:math temp_output_matrix[-5][-1]
data remove storage large_number:math temp_output_matrix[-6][-1]
data remove storage large_number:math temp_output_matrix[-7][-1]
data remove storage large_number:math temp_output_matrix[-1]
data remove storage large_number:math store_vecb[-1]

scoreboard players remove #determinant.order int 1
