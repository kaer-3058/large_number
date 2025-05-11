##第一个消元因子
data modify storage large_number:math float_division.input1 set from storage large_number:math store_det_input[1][0]
data modify storage large_number:math float_division.input2 set from storage large_number:math store_det_input[0][0]
function large_number:division/float/start
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_division.output

data modify storage large_number:math store_det_input[1][0] set value 0d

#乘法单元1
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[1][1]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[1][1] set from storage large_number:math temp1

#乘法单元2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][2]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[1][2]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[1][2] set from storage large_number:math temp1

#乘法单元3
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][3]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[1][3]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[1][3] set from storage large_number:math temp1

#乘法单元-v1
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_vecb[-4]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-3]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_vecb[-3] set from storage large_number:math temp1


##第二个消元因子
data modify storage large_number:math float_division.input1 set from storage large_number:math store_det_input[2][0]
data modify storage large_number:math float_division.input2 set from storage large_number:math store_det_input[0][0]
function large_number:division/float/start
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_division.output

data modify storage large_number:math store_det_input[2][0] set value 0d

#乘法单元1
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[2][1]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[2][1] set from storage large_number:math temp1

#乘法单元2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][2]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[2][2]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[2][2] set from storage large_number:math temp1

#乘法单元3
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][3]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[2][3]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[2][3] set from storage large_number:math temp1

#乘法单元-v2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_vecb[-4]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-2]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_vecb[-2] set from storage large_number:math temp1


##第三个消元因子
data modify storage large_number:math float_division.input1 set from storage large_number:math store_det_input[3][0]
data modify storage large_number:math float_division.input2 set from storage large_number:math store_det_input[0][0]
function large_number:division/float/start
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_division.output

data modify storage large_number:math store_det_input[3][0] set value 0d

#乘法单元1
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][1]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[3][1]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[3][1] set from storage large_number:math temp1

#乘法单元2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][2]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[3][2]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[3][2] set from storage large_number:math temp1

#乘法单元3
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_det_input[0][3]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[3][3]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_det_input[3][3] set from storage large_number:math temp1

#乘法单元-v3
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_vecb[-4]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp1 set from storage large_number:math store_vecb[-1]
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math store_vecb[-1] set from storage large_number:math temp1
