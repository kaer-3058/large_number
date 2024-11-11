##浮点数格式转换 - nbt格式转为记分板格式

#输入：data modify storage large_number:math float_nbt_to_score_input set value 62.71339703E12d
#输入范围[1.797693134862315807E308, 1.797693134862315807E-301]

#符号
scoreboard players set #float_sign int -1

execute store result score #float_int0 int store success storage large_number:math temp_expon int 8 run data get storage large_number:math float_nbt_to_score_input

#转化为字符串
data modify storage large_number:math temp1 set string storage large_number:math float_nbt_to_score_input 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #__exp int store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute if score #_exp int matches 1.. run scoreboard players operation #_exp int *= -1 const
scoreboard players add #_exp int 7
execute if score #__exp int matches ..-1 run scoreboard players remove #_exp int 14

#上面计算的是"浮点数的位移量"，也就是要取出输入值的前八位要位移多少次，这样好直接定向执行四分树的特定函数，以此来节省消耗。
#在输入1E308时，命令执行量为57+7条。


execute if score #float_int0 int matches 100000000.. if score #_exp int matches -152..-1 store result score #float_int0 int run function large_number:float_nbt_to_score/tree/-1/1-16
execute if score #float_int0 int matches 100000000.. if score #_exp int matches -304..-153 store result score #float_int0 int run function large_number:float_nbt_to_score/tree/-1/17-32
execute if score #float_int0 int matches 100000000.. if score #_exp int matches ..-305 store success storage large_number:math temp_expon int 0 run scoreboard players set #float_int0 int 0
execute store success score #is- int if score #float_int0 int matches ..9999999
execute if score #float_int0 int matches ..9999999 if score #_exp int matches -152..-1 store result score #float_int0 int run function large_number:float_nbt_to_score/tree/-1/_1/1-16
execute if score #float_int0 int matches ..9999999 if score #_exp int matches -308..-153 store result score #float_int0 int run function large_number:float_nbt_to_score/tree/-1/_1/17-33
execute if score #float_int0 int matches ..9999999 if score #_exp int matches ..-309 store success storage large_number:math temp_expon int 0 run scoreboard players set #float_int0 int 0
execute if score #_exp int matches 0 store success storage large_number:math temp_expon int 8 run data get storage large_number:math float_nbt_to_score_input

execute if score #__exp int matches 0 unless score #float_int0 int matches 10000000..99999999 run function large_number:float_nbt_to_score/tree/0/3
execute if score #__exp int matches 0 unless score #float_int0 int matches 10000000..99999999 run function large_number:float_nbt_to_score/tree/0/4
execute if score #__exp int matches 0 run scoreboard players set #is- int 0

execute store result score #float_exp int run data get storage large_number:math temp_expon
execute if score #is- int matches 1 run scoreboard players operation #float_exp int *= -1 const
execute if score #is- int matches 1 run scoreboard players add #float_exp int 16
