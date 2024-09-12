data modify storage large_number:math temp_sign set value ["+","-","*","/"]
data modify storage large_number:math stemp1 set from storage large_number:math temp_s2[0]
scoreboard players set #temp1 int 4
execute store result score #temp1 int run data modify storage large_number:math temp_sign[] set from storage large_number:math stemp1
execute if score #temp1 int matches 4 run data modify storage large_number:math temp_s1 append from storage large_number:math stemp1
execute unless score #temp1 int matches 4 run function large_number:expression_evaluation/ope

data remove storage large_number:math temp_s2[0]
execute if data storage large_number:math temp_s2[0] run function large_number:expression_evaluation/loop6
