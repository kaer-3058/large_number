data modify storage large_number:math temp_expression_sign set value ["+","-","*","/"]
data modify storage large_number:math stemp_expression1 set from storage large_number:math temp_expression_s2[0]
scoreboard players set #temp1 int 4
execute store result score #temp1 int run data modify storage large_number:math temp_expression_sign[] set from storage large_number:math stemp_expression1
execute if score #temp1 int matches 4 run data modify storage large_number:math temp_expression_s1 append from storage large_number:math stemp_expression1
execute unless score #temp1 int matches 4 run function large_number:expression_evaluation/ope_of_float/ope

data remove storage large_number:math temp_expression_s2[0]
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation/ope_of_float/loop1
