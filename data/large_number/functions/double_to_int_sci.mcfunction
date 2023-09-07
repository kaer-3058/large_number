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
execute in minecraft:overworld run data modify storage math temp1 set string block -29999982 -64 22022222 front_text.messages[0] 9 -3

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
execute store result storage math double_to_int.output.point byte 1.0 run scoreboard players get #temp1 int

#排除小数点，字符串列表转化为复合标签列表，字符串转化为可进行列表索引的键值对
data modify storage math temp_string_list set value []
data modify storage math temp_expon_list set value []

#处理数值部分
data modify storage math temp3 set value {a:0}
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3
execute store result score #-sign int run data modify storage math temp3.a set value 0
data modify storage math temp3.a set string storage math temp1 0 1
data modify storage math temp1 set string storage math temp1 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:'.'} unless data storage math temp3{a:0} run data modify storage math temp_string_list append from storage math temp3


#处理指数位

#测试是否为负数
data modify storage math temp4 set string storage math temp_expon 0 1
execute store success score #-sign int if data storage math {temp4:"-"} run data modify storage math temp_expon set string storage math temp_expon 1

data modify storage math temp3.a set string storage math temp_expon 0 1
data modify storage math temp_expon set string storage math temp_expon 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:0} run data modify storage math temp_expon_list append from storage math temp3
data modify storage math temp3.a set string storage math temp_expon 0 1
data modify storage math temp_expon set string storage math temp_expon 1
execute store success storage math temp3.a int 0 unless data storage math temp3{a:0} run data modify storage math temp_expon_list append from storage math temp3
data modify storage math temp3.a set string storage math temp_expon 0 1
data modify storage math temp_expon set string storage math temp_expon 1
execute unless data storage math temp3{a:0} run data modify storage math temp_expon_list append from storage math temp3

#列表索引，批量转化，字符串转化为int数值
execute if data storage math temp_string_list[{a:"0"}] run data modify storage math temp_string_list[{a:"0"}].a set value 0
execute if data storage math temp_string_list[{a:"1"}] run data modify storage math temp_string_list[{a:"1"}].a set value 1
execute if data storage math temp_string_list[{a:"2"}] run data modify storage math temp_string_list[{a:"2"}].a set value 2
execute if data storage math temp_string_list[{a:"3"}] run data modify storage math temp_string_list[{a:"3"}].a set value 3
execute if data storage math temp_string_list[{a:"4"}] run data modify storage math temp_string_list[{a:"4"}].a set value 4
execute if data storage math temp_string_list[{a:"5"}] run data modify storage math temp_string_list[{a:"5"}].a set value 5
execute if data storage math temp_string_list[{a:"6"}] run data modify storage math temp_string_list[{a:"6"}].a set value 6
execute if data storage math temp_string_list[{a:"7"}] run data modify storage math temp_string_list[{a:"7"}].a set value 7
execute if data storage math temp_string_list[{a:"8"}] run data modify storage math temp_string_list[{a:"8"}].a set value 8
execute if data storage math temp_string_list[{a:"9"}] run data modify storage math temp_string_list[{a:"9"}].a set value 9

execute if data storage math temp_expon_list[{a:"0"}] run data modify storage math temp_expon_list[{a:"0"}].a set value 0
execute if data storage math temp_expon_list[{a:"1"}] run data modify storage math temp_expon_list[{a:"1"}].a set value 1
execute if data storage math temp_expon_list[{a:"2"}] run data modify storage math temp_expon_list[{a:"2"}].a set value 2
execute if data storage math temp_expon_list[{a:"3"}] run data modify storage math temp_expon_list[{a:"3"}].a set value 3
execute if data storage math temp_expon_list[{a:"4"}] run data modify storage math temp_expon_list[{a:"4"}].a set value 4
execute if data storage math temp_expon_list[{a:"5"}] run data modify storage math temp_expon_list[{a:"5"}].a set value 5
execute if data storage math temp_expon_list[{a:"6"}] run data modify storage math temp_expon_list[{a:"6"}].a set value 6
execute if data storage math temp_expon_list[{a:"7"}] run data modify storage math temp_expon_list[{a:"7"}].a set value 7
execute if data storage math temp_expon_list[{a:"8"}] run data modify storage math temp_expon_list[{a:"8"}].a set value 8
execute if data storage math temp_expon_list[{a:"9"}] run data modify storage math temp_expon_list[{a:"9"}].a set value 9

#测试前导0的数量
execute store result score #temp1 int run data get storage math temp_string_list[0].a
execute store result score #temp2 int run data get storage math temp_string_list[1].a
execute store result score #temp3 int run data get storage math temp_string_list[2].a
execute if score #temp1 int matches 0 run data modify storage math double_to_int.output.leading_zeros set value 1b
execute if score #temp1 int matches 0 if score #temp2 int matches 0 run data modify storage math double_to_int.output.leading_zeros set value 2b
execute if score #temp1 int matches 0 if score #temp2 int matches 0 if score #temp3 int matches 0 run data modify storage math double_to_int.output.leading_zeros set value 3b

#从后往前逐位读取到计分板，自动靠后对齐
execute store result score #double_to_int.16 int run data get storage math temp_string_list[-1].a
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.15 int run data get storage math temp_string_list[-1].a 10
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.14 int run data get storage math temp_string_list[-1].a 100
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.13 int run data get storage math temp_string_list[-1].a 1000
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.12 int run data get storage math temp_string_list[-1].a
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.11 int run data get storage math temp_string_list[-1].a 10
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.10 int run data get storage math temp_string_list[-1].a 100
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.9 int run data get storage math temp_string_list[-1].a 1000
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.8 int run data get storage math temp_string_list[-1].a
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.7 int run data get storage math temp_string_list[-1].a 10
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.6 int run data get storage math temp_string_list[-1].a 100
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.5 int run data get storage math temp_string_list[-1].a 1000
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.4 int run data get storage math temp_string_list[-1].a
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.3 int run data get storage math temp_string_list[-1].a 10
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.2 int run data get storage math temp_string_list[-1].a 100
data remove storage math temp_string_list[-1]
execute store result score #double_to_int.1 int run data get storage math temp_string_list[-1].a 1000

execute store result score #double_to_int.expon.3 int run data get storage math temp_expon_list[-1].a
data remove storage math temp_expon_list[-1]
execute store result score #double_to_int.expon.2 int run data get storage math temp_expon_list[-1].a 10
data remove storage math temp_expon_list[-1]
execute store result score #double_to_int.expon.1 int run data get storage math temp_expon_list[-1].a 100

#合并数字成为万进制int数组
scoreboard players operation #double_to_int.1 int += #double_to_int.2 int
scoreboard players operation #double_to_int.1 int += #double_to_int.3 int
execute store result storage math double_to_int.output.math[0] int 1.0 run scoreboard players operation #double_to_int.1 int += #double_to_int.4 int
scoreboard players operation #double_to_int.5 int += #double_to_int.6 int
scoreboard players operation #double_to_int.5 int += #double_to_int.7 int
execute store result storage math double_to_int.output.math[1] int 1.0 run scoreboard players operation #double_to_int.5 int += #double_to_int.8 int
scoreboard players operation #double_to_int.9 int += #double_to_int.10 int
scoreboard players operation #double_to_int.9 int += #double_to_int.11 int
execute store result storage math double_to_int.output.math[2] int 1.0 run scoreboard players operation #double_to_int.9 int += #double_to_int.12 int
scoreboard players operation #double_to_int.13 int += #double_to_int.14 int
scoreboard players operation #double_to_int.13 int += #double_to_int.15 int
execute store result storage math double_to_int.output.math[3] int 1.0 run scoreboard players operation #double_to_int.13 int += #double_to_int.16 int

scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.2 int
scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.3 int
execute if score #is_XXEXX int matches 1 if score #-sign int matches 1 run scoreboard players operation #double_to_int.expon.1 int *= -1 const

execute store result storage math double_to_int.output.expon short 1.0 run scoreboard players get #double_to_int.expon.1 int

#测试数字是否为0
execute if data storage math double_to_int{input:0.0d} store success storage math double_to_int.output.point byte 0 store result storage math double_to_int.output.leading_zeros byte 0 run data modify storage math double_to_int.output.sign set value 0b
