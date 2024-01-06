##数值类型转化
# double 转 int数组  考虑到了科学记数法

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

#data modify storage math double_to_int.input set value 6337.1544375d

#读数顺序：先读前导零，后读小数点，然后是指数位

execute in minecraft:overworld run setblock -29999982 -64 22022223 minecraft:bedrock
execute in minecraft:overworld run setblock -29999982 -64 22022222 minecraft:oak_wall_sign

data modify storage math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,expon:0s,point:0b,leading_zeros:0b}

#转化为告示牌，并仅取前16位
execute in minecraft:overworld run data modify block -29999982 -64 22022222 front_text.messages[0] set value '{"nbt":"double_to_int.input","storage":"math"}'
execute in minecraft:overworld run data modify storage math temp1 set string block -29999982 -64 22022222 front_text.messages[0] 1 -2

#测试是否为负数
data modify storage math temp4 set string storage math temp1 0 1
execute if data storage math {temp4:"-"} store success storage math double_to_int.output.sign byte -1 run data modify storage math temp1 set string storage math temp1 1

#判断是否为科学计数法
data modify storage math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage math temp2[0].a set string storage math temp1 -5 -4
data modify storage math temp2[1].a set string storage math temp1 -4 -3
data modify storage math temp2[2].a set string storage math temp1 -3 -2
data modify storage math temp2[3].a set string storage math temp1 -2 -1
execute store success score #is_XXEXX int if data storage math temp2[{a:"E"}]

#仅取前16位，如果为科学计数法则拆出指数位
data modify storage math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
data modify storage math temp1 set string storage math temp1 0 17

#测试小数点的位置
execute if score #is_XXEXX int matches 1 run scoreboard players set #temp1 int 2
execute store result score #temp2 int run data get storage math double_to_int.input
execute if score #temp2 int matches ..-1 run scoreboard players operation #temp2 int *= -1 const
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 0..9 run scoreboard players set #temp1 int 2
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 10..99 run scoreboard players set #temp1 int 3
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 100..999 run scoreboard players set #temp1 int 4
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 1000..9999 run scoreboard players set #temp1 int 5
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 10000..99999 run scoreboard players set #temp1 int 6
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 100000..999999 run scoreboard players set #temp1 int 7
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 1000000..9999999 run scoreboard players set #temp1 int 8
execute store result storage math temp5_1 int 1.0 store result storage math double_to_int.output.point byte 1.0 run scoreboard players get #temp1 int

#以小数点为界拆开
execute store result storage math temp5_2 int 1.0 run scoreboard players remove #temp1 int 1
function large_number:macro_operation/macro_cut_double_string with storage math

function large_number:macro_operation/double_ope_macro1 with storage math

#测试前导0的数量
data modify storage math temp6 set string storage math temp2 0 1
execute if data storage math {temp6:"0"} run data modify storage math double_to_int.output.leading_zeros set value 1b
data modify storage math temp6 set string storage math temp2 0 2
execute if data storage math {temp6:"00"} run data modify storage math double_to_int.output.leading_zeros set value 2b
data modify storage math temp6 set string storage math temp2 0 3
execute if data storage math {temp6:"000"} run data modify storage math double_to_int.output.leading_zeros set value 3b

#从后往前逐位读取到计分板，自动靠后对齐
execute store result storage math temp7 int 0 store result storage math temp8 int 0 store result storage math temp9 int 0 run data modify storage math temp6 set value 0
execute store result score #math_length int run data get storage math temp2
execute if score #math_length int matches 0..4 run data modify storage math temp9 set from storage math temp2
execute if score #math_length int matches 5.. run data modify storage math temp9 set string storage math temp2 -4
execute if score #math_length int matches 5.. run data modify storage math temp8 set string storage math temp2 0 -4
execute if score #math_length int matches 9.. run data modify storage math temp7 set string storage math temp8 0 -4
execute if score #math_length int matches 9.. run data modify storage math temp8 set string storage math temp8 -4
execute if score #math_length int matches 13.. run data modify storage math temp6 set string storage math temp7 0 -4
execute if score #math_length int matches 13.. run data modify storage math temp7 set string storage math temp7 -4

#最终赋值
function large_number:macro_operation/double_ope_macro2_sci with storage math

#测试数字是否为0
execute if data storage math double_to_int{input:0.0d} store success storage math double_to_int.output.point byte 0 store result storage math double_to_int.output.leading_zeros byte 0 run data modify storage math double_to_int.output.sign set value 0b
