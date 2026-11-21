data modify storage large_number:math temp_a_ set from storage large_number:math temp_in09

#共轭复数
execute unless score #temp1 large_number.int matches -5..4 run function large_number:n-th_degree_equation/test_complex_eigenvalue/macro4 with storage large_number:math
data modify storage large_number:math temp_d_ set from storage large_number:math temp_in09
