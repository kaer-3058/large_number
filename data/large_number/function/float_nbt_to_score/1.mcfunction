##浮点数格式转换 - nbt格式转为记分板格式

#输入：data modify storage large_number:math float_nbt_to_score_input set value 62.71339703E12d
#支持转换任意double类型的浮点数

#function large_number:float_nbt_to_score/start

#符号
scoreboard players set #float_sign large_number.int 1

#转化为字符串
data modify storage large_number:math temp1 set string storage large_number:math float_nbt_to_score_input 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp large_number.int run function large_number:sigmoid/macro3 with storage large_number:math

scoreboard players operation #__exp large_number.int = #_exp large_number.int
scoreboard players operation #float_exp large_number.int = #_exp large_number.int
scoreboard players add #float_exp large_number.int 1
scoreboard players operation #_exp large_number.int *= -1 const
execute store result storage large_number:math temp int 1 run scoreboard players add #_exp large_number.int 7

execute unless score #_exp large_number.int matches 309.. run function large_number:float_nbt_to_score/index_1 with storage large_number:math
execute if score #_exp large_number.int matches 309.. run function large_number:float_nbt_to_score/309__1
execute if score #__exp large_number.int matches 0 run function large_number:float_nbt_to_score/if_matches_0_1
