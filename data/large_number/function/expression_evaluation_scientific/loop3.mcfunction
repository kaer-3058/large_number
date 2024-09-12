#取出括号里的项并忽略括号本身

scoreboard players set #test2 int 1

data modify storage large_number:math stemp9 set value ""
data modify storage large_number:math stemp9 set from storage large_number:math temp_s1[-1]
execute unless data storage large_number:math {stemp9:"("} run data modify storage large_number:math temp_s2 append from storage large_number:math temp_s1[-1]
data remove storage large_number:math temp_s1[-1]
data modify storage large_number:math stemp9 set value ""
data modify storage large_number:math stemp9 set from storage large_number:math temp_s1[-1]
execute unless data storage large_number:math {stemp9:"("} unless data storage large_number:math {stemp9:""} run function large_number:expression_evaluation_scientific/loop3
