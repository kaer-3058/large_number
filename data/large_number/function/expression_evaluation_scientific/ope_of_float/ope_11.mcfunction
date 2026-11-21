#定义域报错
#反余弦只能定义在[-1,1]
execute store result score #temp1 large_number.int run data get storage large_number:math _expressionss2 -1000000000
execute if score #temp1 large_number.int matches 1.. store result score #temp1 large_number.int run data get storage large_number:math _expressionss2 1000000000
execute if score #temp1 large_number.int matches ..-1000000001 run scoreboard players set #temp_expression_evaluation_error large_number.int 1005

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#arccos(x)

data modify storage large_number:math arcsin_cos_high_precision.input set from storage large_number:math _expressionss2
function large_number:math_trifs/arccos_hp/start
execute store result storage large_number:math _expressionss3 double .0000000174532925199432957692369 run data get storage large_number:math arcsin_cos_high_precision.output 1000000
