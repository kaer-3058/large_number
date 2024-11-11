#arcsin(x)

execute store result score #arcsin_cos.input int run data get storage large_number:math _expressionss2 10000
function large_number:math_trifs/arcsin
execute store result storage large_number:math temp1 double .0000001 run scoreboard players get #arcsin_cos.output int
execute store result storage large_number:math _expressionss3 double 0.00000001 run data get storage large_number:math temp1 1745329251
