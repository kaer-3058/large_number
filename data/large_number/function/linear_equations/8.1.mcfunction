data modify storage large_number:math temp_output_matrix set value [[],[0d],[0d,0d],[0d,0d,0d],[0d,0d,0d,0d],[0d,0d,0d,0d,0d],[0d,0d,0d,0d,0d,0d],[0d,0d,0d,0d,0d,0d]]

function large_number:linear_equations/8.2
data modify storage large_number:math temp_output_matrix[0] set from storage large_number:math store_det_input[0]
data remove storage large_number:math store_det_input[1][0]
data remove storage large_number:math store_det_input[2][0]
data remove storage large_number:math store_det_input[3][0]
data remove storage large_number:math store_det_input[4][0]
data remove storage large_number:math store_det_input[5][0]
data remove storage large_number:math store_det_input[6][0]
data remove storage large_number:math store_det_input[7][0]
data remove storage large_number:math store_det_input[0]

function large_number:linear_equations/0
execute if score #determinant.order int matches 2.. run function large_number:linear_equations/7.2
data modify storage large_number:math temp_output_matrix[1] append from storage large_number:math store_det_input[0][]
data remove storage large_number:math store_det_input[1][0]
data remove storage large_number:math store_det_input[2][0]
data remove storage large_number:math store_det_input[3][0]
data remove storage large_number:math store_det_input[4][0]
data remove storage large_number:math store_det_input[5][0]
data remove storage large_number:math store_det_input[6][0]
data remove storage large_number:math store_det_input[0]

execute if score #determinant.order int matches 2.. run function large_number:linear_equations/0
execute if score #determinant.order int matches 2.. run function large_number:linear_equations/6.2
data modify storage large_number:math temp_output_matrix[2] append from storage large_number:math store_det_input[0][]
data remove storage large_number:math store_det_input[1][0]
data remove storage large_number:math store_det_input[2][0]
data remove storage large_number:math store_det_input[3][0]
data remove storage large_number:math store_det_input[4][0]
data remove storage large_number:math store_det_input[5][0]
data remove storage large_number:math store_det_input[0]

execute if score #determinant.order int matches 2.. run function large_number:linear_equations/0
execute if score #determinant.order int matches 2.. run function large_number:linear_equations/5.2
data modify storage large_number:math temp_output_matrix[3] append from storage large_number:math store_det_input[0][]
data remove storage large_number:math store_det_input[1][0]
data remove storage large_number:math store_det_input[2][0]
data remove storage large_number:math store_det_input[3][0]
data remove storage large_number:math store_det_input[4][0]
data remove storage large_number:math store_det_input[0]

execute if score #determinant.order int matches 2.. run function large_number:linear_equations/0
execute if score #determinant.order int matches 2.. run function large_number:linear_equations/4.2
data modify storage large_number:math temp_output_matrix[4] append from storage large_number:math store_det_input[0][]
data remove storage large_number:math store_det_input[1][0]
data remove storage large_number:math store_det_input[2][0]
data remove storage large_number:math store_det_input[3][0]
data remove storage large_number:math store_det_input[0]

execute if score #determinant.order int matches 2.. run function large_number:linear_equations/0
execute if score #determinant.order int matches 2.. run function large_number:linear_equations/3.2
data modify storage large_number:math temp_output_matrix[5] append from storage large_number:math store_det_input[0][]
data remove storage large_number:math store_det_input[1][0]
data remove storage large_number:math store_det_input[2][0]
data remove storage large_number:math store_det_input[0]

execute if score #determinant.order int matches 2.. run function large_number:linear_equations/0
execute if score #determinant.order int matches 2.. run function large_number:linear_equations/2.2
data modify storage large_number:math temp_output_matrix[6] append from storage large_number:math store_det_input[0][]
data modify storage large_number:math temp_output_matrix[7] append from storage large_number:math store_det_input[1][]
