data modify storage large_number:math stempu set from storage large_number:math temp1[0]
data modify storage large_number:math stemp1 set string storage large_number:math stempu 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:n-th_degree_equation/coefficient_scaling/macro1 with storage large_number:math
data modify storage large_number:math temp_nl_double_extrema_inp append from storage large_number:math stempu

data remove storage large_number:math temp1[0]
execute if data storage large_number:math temp1[0] run function large_number:n-th_degree_equation/coefficient_scaling/loop1
