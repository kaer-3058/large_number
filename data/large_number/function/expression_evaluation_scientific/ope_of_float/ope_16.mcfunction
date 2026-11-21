#定义域报错
execute store result score #temp1 large_number.int run data get storage large_number:math _expressionss1 1000000000
execute if score #temp1 large_number.int matches ..-367879442 run scoreboard players set #temp_expression_evaluation_error large_number.int 1009
execute store result score #temp3 large_number.int store result storage large_number:math lambertw.branch int 1 run data get storage large_number:math _expressionss2
execute if score #temp3 large_number.int matches -1 if score #temp1 large_number.int matches 0.. run scoreboard players set #temp_expression_evaluation_error large_number.int 1009

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0


#lambertw(x) 主分支

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math lambertw.input set from storage large_number:math _expressionss1
function large_number:lambertw/start
#tellraw @a {storage:"large_number:math",nbt:"lambertw"}
data modify storage large_number:math _expressionss3 set from storage large_number:math lambertw.output
