#验证输入的符号是否受支持

data modify storage large_number:math temp_expression_sign set value ["+","-","*","/","^","exp","log","sin","cos","arcsin","arccos","ln","√","Γ","┕","ºLambertW","¹LambertW","||","sgn","[]","—","atan","ψ","Σ[1/n]n→","eunorm₂","eunorm₃","²","·","arctan","[0]",">=","<=","==","≈≈",">/<",">-<"]
data modify storage large_number:math stemp_expression1 set from storage large_number:math temp_expression_s2[0]
scoreboard players set #temp1 int 36
execute store result score #temp1 int run data modify storage large_number:math temp_expression_sign[] set from storage large_number:math stemp_expression1
execute if score #temp1 int matches 36 run function large_number:expression_evaluation_scientific/ope_of_float/loop1.if
execute unless score #temp1 int matches 36 run function large_number:expression_evaluation_scientific/ope_of_float/ope

data remove storage large_number:math temp_expression_s2[0]
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1