#三维向量的欧氏范数

scoreboard players set #expression_evaluation_test2 int 3

data modify storage large_number:math double_norm_3d.x set from storage large_number:math _expressionss1
data modify storage large_number:math double_norm_3d.y set from storage large_number:math _expressionss2
data modify storage large_number:math double_norm_3d.z set from storage large_number:math _expressionss4
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/unit_vector_3d
data modify storage large_number:math _expressionss3 set from storage large_number:math double_norm_3d.output
