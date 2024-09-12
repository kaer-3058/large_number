##double 转 int数组

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

#data modify storage large_number:math double_to_int.input set value 6337.1544375d

#读数方法：math为万进制数组格式的尾数，sign为符号，expon为指数。以±0.AEB形式读数，A是补齐前导0后的尾数，B是指数

data modify storage large_number:math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,expon:0s}

#转化为字符串，并仅取前16位
data modify storage large_number:math temp1 set string storage large_number:math double_to_int.input 0 -1

#测试是否为负数
data modify storage large_number:math temp4 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp4:"-"} store success storage large_number:math double_to_int.output.sign byte -1 run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]

#仅取前16位，如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 17

#处理指数位
data modify storage large_number:math temp_expon_list set value []

#测试是否为负数
data modify storage large_number:math temp3 set value {a:0}
scoreboard players set #-sign int 0
data modify storage large_number:math temp4 set string storage large_number:math temp_expon 0 1
execute store success score #-sign int if data storage large_number:math {temp4:"-"} run data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1

data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_expon_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_expon_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
data modify storage large_number:math temp_expon_list append from storage large_number:math temp3

execute if data storage large_number:math temp_expon_list[{a:""}] run data remove storage large_number:math temp_expon_list[{a:""}]
execute if data storage large_number:math temp_expon_list[{a:'.'}] run data remove storage large_number:math temp_expon_list[{a:'.'}]
execute if data storage large_number:math temp_expon_list[{a:0}] run data remove storage large_number:math temp_expon_list[{a:0}]
execute if data storage large_number:math temp_expon_list[{a:"0"}] run data modify storage large_number:math temp_expon_list[{a:"0"}].a set value 0
execute if data storage large_number:math temp_expon_list[{a:"1"}] run data modify storage large_number:math temp_expon_list[{a:"1"}].a set value 1
execute if data storage large_number:math temp_expon_list[{a:"2"}] run data modify storage large_number:math temp_expon_list[{a:"2"}].a set value 2
execute if data storage large_number:math temp_expon_list[{a:"3"}] run data modify storage large_number:math temp_expon_list[{a:"3"}].a set value 3
execute if data storage large_number:math temp_expon_list[{a:"4"}] run data modify storage large_number:math temp_expon_list[{a:"4"}].a set value 4
execute if data storage large_number:math temp_expon_list[{a:"5"}] run data modify storage large_number:math temp_expon_list[{a:"5"}].a set value 5
execute if data storage large_number:math temp_expon_list[{a:"6"}] run data modify storage large_number:math temp_expon_list[{a:"6"}].a set value 6
execute if data storage large_number:math temp_expon_list[{a:"7"}] run data modify storage large_number:math temp_expon_list[{a:"7"}].a set value 7
execute if data storage large_number:math temp_expon_list[{a:"8"}] run data modify storage large_number:math temp_expon_list[{a:"8"}].a set value 8
execute if data storage large_number:math temp_expon_list[{a:"9"}] run data modify storage large_number:math temp_expon_list[{a:"9"}].a set value 9

execute store result score #double_to_int.expon.3 int run data get storage large_number:math temp_expon_list[-1].a
data remove storage large_number:math temp_expon_list[-1]
execute store result score #double_to_int.expon.2 int run data get storage large_number:math temp_expon_list[-1].a 10
data remove storage large_number:math temp_expon_list[-1]
execute store result score #double_to_int.expon.1 int run data get storage large_number:math temp_expon_list[-1].a 100

scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.2 int
scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.3 int
execute if score #is_XXEXX int matches 1 if score #-sign int matches 1 run scoreboard players operation #double_to_int.expon.1 int *= -1 const
scoreboard players add #double_to_int.expon.1 int 1

#测试小数点的位置
scoreboard players set #temp1 int 0
execute store result score #temp2 int run data get storage large_number:math double_to_int.input
execute if score #temp2 int matches ..-1 store result score #temp2 int run data get storage large_number:math double_to_int.input -1
execute unless score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/double_to_int.if.1

scoreboard players operation #double_to_int.expon.1 int += #temp1 int

#测试前导0数量
scoreboard players set #leading_zeros int 0
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {stemp10:"0"} run scoreboard players set #leading_zeros int 1
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 3
execute if data storage large_number:math {stemp10:"0.0"} run scoreboard players set #leading_zeros int 2
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 4
execute if data storage large_number:math {stemp10:"0.00"} run scoreboard players set #leading_zeros int 3
execute if score #leading_zeros int matches 1 run data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute if score #leading_zeros int matches 2 run data modify storage large_number:math temp1 set string storage large_number:math temp1 3
execute if score #leading_zeros int matches 3 run data modify storage large_number:math temp1 set string storage large_number:math temp1 4

execute store result storage large_number:math double_to_int.output.expon short 1.0 run scoreboard players operation #double_to_int.expon.1 int -= #leading_zeros int

#排除小数点，字符串列表转化为复合标签列表，字符串转化为可进行列表索引的键值对
data modify storage large_number:math temp_string_list set value []

#处理数值部分
data modify storage large_number:math temp3 set value {a:0}
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp_string_list append from storage large_number:math temp3

#列表索引，批量转化，字符串转化为int数值
execute if data storage large_number:math temp_string_list[{a:""}] run data remove storage large_number:math temp_string_list[{a:""}]
execute if data storage large_number:math temp_string_list[{a:'.'}] run data remove storage large_number:math temp_string_list[{a:'.'}]
execute if data storage large_number:math temp_string_list[{a:0}] run data remove storage large_number:math temp_string_list[{a:0}]
execute if data storage large_number:math temp_string_list[{a:"0"}] run data modify storage large_number:math temp_string_list[{a:"0"}].a set value 0
execute if data storage large_number:math temp_string_list[{a:"1"}] run data modify storage large_number:math temp_string_list[{a:"1"}].a set value 1
execute if data storage large_number:math temp_string_list[{a:"2"}] run data modify storage large_number:math temp_string_list[{a:"2"}].a set value 2
execute if data storage large_number:math temp_string_list[{a:"3"}] run data modify storage large_number:math temp_string_list[{a:"3"}].a set value 3
execute if data storage large_number:math temp_string_list[{a:"4"}] run data modify storage large_number:math temp_string_list[{a:"4"}].a set value 4
execute if data storage large_number:math temp_string_list[{a:"5"}] run data modify storage large_number:math temp_string_list[{a:"5"}].a set value 5
execute if data storage large_number:math temp_string_list[{a:"6"}] run data modify storage large_number:math temp_string_list[{a:"6"}].a set value 6
execute if data storage large_number:math temp_string_list[{a:"7"}] run data modify storage large_number:math temp_string_list[{a:"7"}].a set value 7
execute if data storage large_number:math temp_string_list[{a:"8"}] run data modify storage large_number:math temp_string_list[{a:"8"}].a set value 8
execute if data storage large_number:math temp_string_list[{a:"9"}] run data modify storage large_number:math temp_string_list[{a:"9"}].a set value 9

#从前往后逐位读取到计分板，自动靠前对齐
execute store result score #double_to_int.1 int run data get storage large_number:math temp_string_list[0].a 1000
execute store result score #double_to_int.2 int run data get storage large_number:math temp_string_list[1].a 100
execute store result score #double_to_int.3 int run data get storage large_number:math temp_string_list[2].a 10
execute store result score #double_to_int.4 int run data get storage large_number:math temp_string_list[3].a
execute store result score #double_to_int.5 int run data get storage large_number:math temp_string_list[4].a 1000
execute store result score #double_to_int.6 int run data get storage large_number:math temp_string_list[5].a 100
execute store result score #double_to_int.7 int run data get storage large_number:math temp_string_list[6].a 10
execute store result score #double_to_int.8 int run data get storage large_number:math temp_string_list[7].a
execute store result score #double_to_int.9 int run data get storage large_number:math temp_string_list[8].a 1000
execute store result score #double_to_int.10 int run data get storage large_number:math temp_string_list[9].a 100
execute store result score #double_to_int.11 int run data get storage large_number:math temp_string_list[10].a 10
execute store result score #double_to_int.12 int run data get storage large_number:math temp_string_list[11].a
execute store result score #double_to_int.13 int run data get storage large_number:math temp_string_list[12].a 1000
execute store result score #double_to_int.14 int run data get storage large_number:math temp_string_list[13].a 100
execute store result score #double_to_int.15 int run data get storage large_number:math temp_string_list[14].a 10
execute store result score #double_to_int.16 int run data get storage large_number:math temp_string_list[15].a

#合并数字成为万进制int数组
scoreboard players operation #double_to_int.1 int += #double_to_int.2 int
scoreboard players operation #double_to_int.1 int += #double_to_int.3 int
execute store result storage large_number:math double_to_int.output.math[0] int 1.0 run scoreboard players operation #double_to_int.1 int += #double_to_int.4 int
scoreboard players operation #double_to_int.5 int += #double_to_int.6 int
scoreboard players operation #double_to_int.5 int += #double_to_int.7 int
execute store result storage large_number:math double_to_int.output.math[1] int 1.0 run scoreboard players operation #double_to_int.5 int += #double_to_int.8 int
scoreboard players operation #double_to_int.9 int += #double_to_int.10 int
scoreboard players operation #double_to_int.9 int += #double_to_int.11 int
execute store result storage large_number:math double_to_int.output.math[2] int 1.0 run scoreboard players operation #double_to_int.9 int += #double_to_int.12 int
scoreboard players operation #double_to_int.13 int += #double_to_int.14 int
scoreboard players operation #double_to_int.13 int += #double_to_int.15 int
execute store result storage large_number:math double_to_int.output.math[3] int 1.0 run scoreboard players operation #double_to_int.13 int += #double_to_int.16 int
