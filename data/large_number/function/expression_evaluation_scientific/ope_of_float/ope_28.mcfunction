#arctan(x)

data modify storage large_number:math arctan.input set from storage large_number:math _expressionss2
execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/arctan/start
execute store result storage large_number:math _expressionss3 double .00000001 run data get storage large_number:math arctan.output 1745329
