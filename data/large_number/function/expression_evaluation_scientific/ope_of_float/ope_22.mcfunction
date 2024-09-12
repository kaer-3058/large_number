#atan2(x) 弧度制

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math atan2_double.y set from storage large_number:math _expressionss1
data modify storage large_number:math atan2_double.x set from storage large_number:math _expressionss2
execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/atan2_double/start with storage large_number:math atan2_double
execute store result storage large_number:math _expressionss3 double .0000001 run data get storage large_number:math atan2_double.output 174532
