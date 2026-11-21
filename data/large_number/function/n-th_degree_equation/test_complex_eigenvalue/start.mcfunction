##测试复数特征值

#输入：storage large_number:math QR_factorization_R

data modify storage large_number:math temp_a set value {x:0d}
data modify storage large_number:math temp_d set value {x:0d}

data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[0][0]
data modify storage large_number:math QR_factorization_R[0][0] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[1][1]
data modify storage large_number:math QR_factorization_R[1][1] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[2][2]
data modify storage large_number:math QR_factorization_R[2][2] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[3][3]
data modify storage large_number:math QR_factorization_R[3][3] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[4][4]
data modify storage large_number:math QR_factorization_R[4][4] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[5][5]
data modify storage large_number:math QR_factorization_R[5][5] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[6][6]
data modify storage large_number:math QR_factorization_R[6][6] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[7][7]
data modify storage large_number:math QR_factorization_R[7][7] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[8][8]
data modify storage large_number:math QR_factorization_R[8][8] set from storage large_number:math temp_a
data modify storage large_number:math temp_a.x set from storage large_number:math QR_factorization_R[9][9]
data modify storage large_number:math QR_factorization_R[9][9] set from storage large_number:math temp_a

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[0][0]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[0][1]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[1][0]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[1][1]
function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[0][0] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[1][1] set from storage large_number:math temp_d_

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[1][1]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[1][2]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[2][1]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[2][2]
function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[1][1] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[2][2] set from storage large_number:math temp_d_

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[2][2]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[2][3]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[3][2]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[3][3]
data modify storage large_number:math temp_a_ set from storage large_number:math temp_a
data modify storage large_number:math temp_d_ set from storage large_number:math temp_d
execute if data storage large_number:math QR_factorization_R[3][3] run function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[2][2] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[3][3] set from storage large_number:math temp_d_

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[3][3]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[3][4]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[4][3]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[4][4]
data modify storage large_number:math temp_a_ set from storage large_number:math temp_a
data modify storage large_number:math temp_d_ set from storage large_number:math temp_d
execute if data storage large_number:math QR_factorization_R[4][4] run function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[3][3] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[4][4] set from storage large_number:math temp_d_

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[4][4]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[4][5]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[5][4]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[5][5]
data modify storage large_number:math temp_a_ set from storage large_number:math temp_a
data modify storage large_number:math temp_d_ set from storage large_number:math temp_d
execute if data storage large_number:math QR_factorization_R[5][5] run function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[4][4] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[5][5] set from storage large_number:math temp_d_

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[5][5]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[5][6]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[6][5]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[6][6]
data modify storage large_number:math temp_a_ set from storage large_number:math temp_a
data modify storage large_number:math temp_d_ set from storage large_number:math temp_d
execute if data storage large_number:math QR_factorization_R[6][6] run function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[5][5] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[6][6] set from storage large_number:math temp_d_

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[6][6]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[6][7]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[7][6]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[7][7]
data modify storage large_number:math temp_a_ set from storage large_number:math temp_a
data modify storage large_number:math temp_d_ set from storage large_number:math temp_d
execute if data storage large_number:math QR_factorization_R[7][7] run function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[6][6] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[7][7] set from storage large_number:math temp_d_

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[7][7]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[7][8]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[8][7]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[8][8]
data modify storage large_number:math temp_a_ set from storage large_number:math temp_a
data modify storage large_number:math temp_d_ set from storage large_number:math temp_d
execute if data storage large_number:math QR_factorization_R[8][8] run function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[7][7] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[8][8] set from storage large_number:math temp_d_

data modify storage large_number:math temp_a set from storage large_number:math QR_factorization_R[8][8]
data modify storage large_number:math temp_b set from storage large_number:math QR_factorization_R[8][9]
data modify storage large_number:math temp_c set from storage large_number:math QR_factorization_R[9][8]
data modify storage large_number:math temp_d set from storage large_number:math QR_factorization_R[9][9]
data modify storage large_number:math temp_a_ set from storage large_number:math temp_a
data modify storage large_number:math temp_d_ set from storage large_number:math temp_d
execute if data storage large_number:math QR_factorization_R[9][9] run function large_number:n-th_degree_equation/test_complex_eigenvalue/test
data modify storage large_number:math QR_factorization_R[8][8] set from storage large_number:math temp_a_
data modify storage large_number:math QR_factorization_R[9][9] set from storage large_number:math temp_d_
