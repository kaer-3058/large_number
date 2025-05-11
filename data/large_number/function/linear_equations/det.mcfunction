#计算行列式
data modify storage large_number:math float_multiply.input1 set value 0d
data modify storage large_number:math float_multiply.input2 set value 0d
data modify storage large_number:math float_multiply.output set from storage large_number:math buffer_NaN
data modify storage large_number:math float_multiply.output set from storage large_number:math temp_output_matrix[0][0]
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_output_matrix[0][0]
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[1][1]
execute if score #determinant.order int matches 2.. run function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[2][2]
execute if score #determinant.order int matches 3.. run function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[3][3]
execute if score #determinant.order int matches 4.. run function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[4][4]
execute if score #determinant.order int matches 5.. run function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[5][5]
execute if score #determinant.order int matches 6.. run function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[6][6]
execute if score #determinant.order int matches 7.. run function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[7][7]
execute if score #determinant.order int matches 8.. run function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[8][8]
execute if score #determinant.order int matches 9.. run function large_number:float_mul.high_precision/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_output_matrix[9][9]
execute if score #determinant.order int matches 10.. run function large_number:float_mul.high_precision/start

execute if score #temp_det_sign int matches -1 run function large_number:linear_equations/macro2 with storage large_number:math float_multiply

data modify storage large_number:math linear_equations.det set from storage large_number:math float_multiply.output
