#arccos(x)

data modify storage large_number:math arcsin_cos_high_precision.input set from storage large_number:math _expressionss2
function large_number:math_trifs/arccos_hp/start
execute store result storage large_number:math _expressionss3 double .0000000174532925199432957692369 run data get storage large_number:math arcsin_cos_high_precision.output 1000000
