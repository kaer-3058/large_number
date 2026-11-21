#double的数量级

#输入：data modify storage large_number:math double_expon_input set value 123456.7
#计算：function large_number:double_expon/start
#输出：scoreboard players get #double_expon_output large_number.int

#取绝对值
data modify storage large_number:math temp4 set string storage large_number:math double_expon_input 0 1
execute if data storage large_number:math {temp4:"-"} run data modify storage large_number:math double_expon_input set string storage large_number:math double_expon_input 1

#去掉单位
data modify storage large_number:math temp1 set string storage large_number:math double_expon_input 0 -1

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

execute store result score #double_expon_output large_number.int run function large_number:sigmoid/macro3 with storage large_number:math

#这是对非科学记数法表示的浮点数进行处理
scoreboard players set #temp1 large_number.int -1
execute if score #is_XXEXX large_number.int matches 0 store result score #temp1 large_number.int run data get storage large_number:math double_expon_input
execute if score #temp1 large_number.int matches 1.. run function large_number:double_expon/2
execute if score #temp1 large_number.int matches 0 run function large_number:double_expon/3
