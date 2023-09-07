##高精度double开方，仅处理正常表示的正数，且仅取前16位

#data modify storage math double_sqrt.input set value 6337.1544375d

##取数，数值类型转化
# double 转 int数组

execute in minecraft:overworld run setblock -29999982 -64 22022223 minecraft:bedrock
execute in minecraft:overworld run setblock -29999982 -64 22022222 minecraft:oak_wall_sign

execute store result score #ds1.1 int store result score #ds1.0 int run data get storage math double_sqrt.input

#转化为告示牌，并仅取前16位
execute in minecraft:overworld run data modify block -29999982 -64 22022222 front_text.messages[0] set value '{"nbt":"double_sqrt.input","storage":"math"}'
execute in minecraft:overworld run data modify storage math temp1 set string block -29999982 -64 22022222 front_text.messages[0] 9 -3

data modify storage math temp1 set string storage math temp1 0 17

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

#从后往前逐位读取到计分板，自动靠前对齐
execute store result score #double_to_int.1 int run data get storage math temp_string_list[0].a 1000
data remove storage math temp_string_list[0]
execute store result score #double_to_int.2 int run data get storage math temp_string_list[0].a 100
data remove storage math temp_string_list[0]
execute store result score #double_to_int.3 int run data get storage math temp_string_list[0].a 10
data remove storage math temp_string_list[0]
execute store result score #double_to_int.4 int run data get storage math temp_string_list[0].a
data remove storage math temp_string_list[0]
execute store result score #double_to_int.5 int run data get storage math temp_string_list[0].a 1000
data remove storage math temp_string_list[0]
execute store result score #double_to_int.6 int run data get storage math temp_string_list[0].a 100
data remove storage math temp_string_list[0]
execute store result score #double_to_int.7 int run data get storage math temp_string_list[0].a 10
data remove storage math temp_string_list[0]
execute store result score #double_to_int.8 int run data get storage math temp_string_list[0].a
data remove storage math temp_string_list[0]
execute store result score #double_to_int.9 int run data get storage math temp_string_list[0].a 1000
data remove storage math temp_string_list[0]
execute store result score #double_to_int.10 int run data get storage math temp_string_list[0].a 100
data remove storage math temp_string_list[0]
execute store result score #double_to_int.11 int run data get storage math temp_string_list[0].a 10
data remove storage math temp_string_list[0]
execute store result score #double_to_int.12 int run data get storage math temp_string_list[0].a
data remove storage math temp_string_list[0]
execute store result score #double_to_int.13 int run data get storage math temp_string_list[0].a 1000
data remove storage math temp_string_list[0]
execute store result score #double_to_int.14 int run data get storage math temp_string_list[0].a 100
data remove storage math temp_string_list[0]
execute store result score #double_to_int.15 int run data get storage math temp_string_list[0].a 10
data remove storage math temp_string_list[0]
execute store result score #double_to_int.16 int run data get storage math temp_string_list[0].a

#合并数字成为万进制int数组
scoreboard players operation #double_to_int.1 int += #double_to_int.2 int
scoreboard players operation #double_to_int.1 int += #double_to_int.3 int
execute store result score #d1.1 int store result score #digit1.1 int run scoreboard players operation #double_to_int.1 int += #double_to_int.4 int
scoreboard players operation #double_to_int.5 int += #double_to_int.6 int
scoreboard players operation #double_to_int.5 int += #double_to_int.7 int
execute store result score #d1.2 int store result score #digit1.2 int run scoreboard players operation #double_to_int.5 int += #double_to_int.8 int
scoreboard players operation #double_to_int.9 int += #double_to_int.10 int
scoreboard players operation #double_to_int.9 int += #double_to_int.11 int
scoreboard players operation #double_to_int.9 int += #double_to_int.12 int
scoreboard players operation #double_to_int.13 int += #double_to_int.14 int
scoreboard players operation #double_to_int.13 int += #double_to_int.15 int
scoreboard players operation #double_to_int.13 int += #double_to_int.16 int


##以大数格式开平方

execute if score #digit1.1 int matches 1000.. run function large_number:large_sqrt_digit16.if/double_sqrt/input/1000_
execute if score #digit1.1 int matches 10..999 run function large_number:large_sqrt_digit16.if/double_sqrt/input/10_
execute if score #digit1.1 int matches 1..9 run function large_number:large_sqrt_digit16.if/double_sqrt/input/1_

execute if score #d1.1 int matches ..13924 run function large_number:simple_int_sqrt_range/large_sqrt_2/0
execute if score #d1.1 int matches 13925..16777216 run function large_number:simple_int_sqrt_range/large_sqrt_2/1
execute if score #d1.1 int matches 16777217.. run function large_number:simple_int_sqrt_range/large_sqrt_2/2
scoreboard players operation #1.0 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.0 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #1.1 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.1 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #1.2 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.2 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #1.3 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.3 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation #d2.1 int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > #d1.1 int run scoreboard players remove #d2.1 int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < #d1.1 int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add #d2.1 int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > #d1.1 int run scoreboard players remove #d2.1 int 1

execute store result score #6.1 int run scoreboard players operation #7.1 int = #d2.1 int

#估值公式
scoreboard players operation #6.1 int *= #6.1 int
scoreboard players operation #d1.1 int -= #6.1 int
scoreboard players operation #d1.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
execute store result score #d3.1 int run scoreboard players operation #d1.1 int /= #7.1 int

#调整最后一位
execute if score #digit1.1 int matches 1000.. if score #large_sqrt16.test16 int matches 1 run function large_number:large_sqrt_digit16.if/test16/if

#开方结果
execute if score #digit1.1 int matches 10..999 run function large_number:large_sqrt_digit16.if/double_sqrt/output/10_
execute if score #digit1.1 int matches 1..9 run function large_number:large_sqrt_digit16.if/double_sqrt/output/1_

##矫正结果，输出

#16位的开方结果： #d2.1 int +  #d3.1 int
scoreboard players operation #ds2.1 int = #d2.1 int
scoreboard players operation #ds2.2 int = #d3.1 int

#整数部分：#ds1.0 int
#测试整数部分数位的奇偶性，如果为奇数把结果除以根号10
scoreboard players set #is_odd int 0
execute if score #ds1.0 int matches 0..9 run scoreboard players set #is_odd int 1
execute if score #ds1.0 int matches 100..999 run scoreboard players set #is_odd int 1
execute if score #ds1.0 int matches 10000..99999 run scoreboard players set #is_odd int 1
execute if score #ds1.0 int matches 1000000..9999999 run scoreboard players set #is_odd int 1
execute if score #is_odd int matches 1 run function large_number:double_sqrt.if/if_int_odd_div_sqrt10

scoreboard players operation #ds2.1 int *= 10000 const
scoreboard players operation #ds2.1 int += #ds2.2 int

data modify storage math double_sqrt.output set value {int:0,double:0.0d}
execute store result storage math double_sqrt.output.int int 1.0 run scoreboard players get #ds2.1 int

#转换回double
execute if score #ds1.1 int matches 0 run function large_number:double_sqrt.if/if_int_0
execute if score #ds1.1 int matches 1.. run function large_number:double_sqrt.if/if_int_1__
