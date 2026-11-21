#位移 - 前
data modify storage large_number:math temp1 set from storage large_number:math naive_qr_method_input[0][0]
data modify storage large_number:math temp2 set from storage large_number:math temp_tz_out_1
function large_number:float_add_subtra/subra
data modify storage large_number:math naive_qr_method_input[0][0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math naive_qr_method_input[1][1]
data modify storage large_number:math temp2 set from storage large_number:math temp_tz_out_1
function large_number:float_add_subtra/subra
data modify storage large_number:math naive_qr_method_input[1][1] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math naive_qr_method_input[2][2]
data modify storage large_number:math temp2 set from storage large_number:math temp_tz_out_1
function large_number:float_add_subtra/subra
data modify storage large_number:math naive_qr_method_input[2][2] set from storage large_number:math temp1
execute if data storage large_number:math naive_qr_method_input[3][3] run function large_number:n-th_degree_equation/wilkinson_shift/subra.3
execute if data storage large_number:math naive_qr_method_input[4][4] run function large_number:n-th_degree_equation/wilkinson_shift/subra.4
execute if data storage large_number:math naive_qr_method_input[5][5] run function large_number:n-th_degree_equation/wilkinson_shift/subra.5
execute if data storage large_number:math naive_qr_method_input[6][6] run function large_number:n-th_degree_equation/wilkinson_shift/subra.6
execute if data storage large_number:math naive_qr_method_input[7][7] run function large_number:n-th_degree_equation/wilkinson_shift/subra.7
execute if data storage large_number:math naive_qr_method_input[8][8] run function large_number:n-th_degree_equation/wilkinson_shift/subra.8
execute if data storage large_number:math naive_qr_method_input[9][9] run function large_number:n-th_degree_equation/wilkinson_shift/subra.9
