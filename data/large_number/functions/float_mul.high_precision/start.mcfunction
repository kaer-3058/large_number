##高精度浮点乘法
#采用了全新新架构，把因数都转化为int数组然后进行大数乘法，再根据转化后传递的数字信息计算指数，用函数宏输出结果。

##数值类型转化
# double 转 int数组  考虑到了科学记数法

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

data modify storage large_number:math double_to_int.input set from storage large_number:math float_multiply.input1

#读数顺序：先读前导零，后读小数点，然后是指数位

data modify storage large_number:math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,expon:0s,point:0b,leading_zeros:0b}

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

#测试小数点的位置
execute if score #is_XXEXX int matches 1 run scoreboard players set #temp1 int 2
execute store result score #temp2 int run data get storage large_number:math double_to_int.input
execute if score #temp2 int matches ..-1 run scoreboard players operation #temp2 int *= -1 const
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 0..9 run scoreboard players set #temp1 int 2
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 10..99 run scoreboard players set #temp1 int 3
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 100..999 run scoreboard players set #temp1 int 4
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 1000..9999 run scoreboard players set #temp1 int 5
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 10000..99999 run scoreboard players set #temp1 int 6
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 100000..999999 run scoreboard players set #temp1 int 7
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 1000000..9999999 run scoreboard players set #temp1 int 8
execute store result storage large_number:math double_to_int.output.point byte 1.0 run scoreboard players get #temp1 int

#排除小数点，字符串列表转化为复合标签列表，字符串转化为可进行列表索引的键值对
data modify storage large_number:math temp_string_list set value []
data modify storage large_number:math temp_expon_list set value []

#处理数值部分
data modify storage large_number:math temp3 set value {a:0}
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
execute store result score #-sign int run data modify storage large_number:math temp3.a set value 0
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3


#处理指数位

#测试是否为负数
data modify storage large_number:math temp4 set string storage large_number:math temp_expon 0 1
execute store success score #-sign int if data storage large_number:math {temp4:"-"} run data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1

data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_expon_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_expon_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
execute unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_expon_list append from storage large_number:math temp3

#列表索引，批量转化，字符串转化为int数值
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

#测试前导0的数量
execute store result score #temp1 int run data get storage large_number:math temp_string_list[0].a
execute store result score #temp2 int run data get storage large_number:math temp_string_list[1].a
execute store result score #temp3 int run data get storage large_number:math temp_string_list[2].a
execute if score #temp1 int matches 0 run data modify storage large_number:math double_to_int.output.leading_zeros set value 1b
execute if score #temp1 int matches 0 if score #temp2 int matches 0 run data modify storage large_number:math double_to_int.output.leading_zeros set value 2b
execute if score #temp1 int matches 0 if score #temp2 int matches 0 if score #temp3 int matches 0 run data modify storage large_number:math double_to_int.output.leading_zeros set value 3b

#从后往前逐位读取到计分板，自动靠后对齐
execute store result score #double_to_int.16 int run data get storage large_number:math temp_string_list[-1].a
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.15 int run data get storage large_number:math temp_string_list[-1].a 10
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.14 int run data get storage large_number:math temp_string_list[-1].a 100
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.13 int run data get storage large_number:math temp_string_list[-1].a 1000
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.12 int run data get storage large_number:math temp_string_list[-1].a
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.11 int run data get storage large_number:math temp_string_list[-1].a 10
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.10 int run data get storage large_number:math temp_string_list[-1].a 100
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.9 int run data get storage large_number:math temp_string_list[-1].a 1000
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.8 int run data get storage large_number:math temp_string_list[-1].a
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.7 int run data get storage large_number:math temp_string_list[-1].a 10
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.6 int run data get storage large_number:math temp_string_list[-1].a 100
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.5 int run data get storage large_number:math temp_string_list[-1].a 1000
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.4 int run data get storage large_number:math temp_string_list[-1].a
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.3 int run data get storage large_number:math temp_string_list[-1].a 10
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.2 int run data get storage large_number:math temp_string_list[-1].a 100
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.1 int run data get storage large_number:math temp_string_list[-1].a 1000

execute store result score #double_to_int.expon.3 int run data get storage large_number:math temp_expon_list[-1].a
data remove storage large_number:math temp_expon_list[-1]
execute store result score #double_to_int.expon.2 int run data get storage large_number:math temp_expon_list[-1].a 10
data remove storage large_number:math temp_expon_list[-1]
execute store result score #double_to_int.expon.1 int run data get storage large_number:math temp_expon_list[-1].a 100

#合并数字成为万进制int数组
scoreboard players operation #double_to_int.1 int += #double_to_int.2 int
scoreboard players operation #double_to_int.1 int += #double_to_int.3 int
execute store result score #float_mul.high_precision.input1.1 int run scoreboard players operation #double_to_int.1 int += #double_to_int.4 int

scoreboard players operation #double_to_int.5 int += #double_to_int.6 int
scoreboard players operation #double_to_int.5 int += #double_to_int.7 int
execute store result score #float_mul.high_precision.input1.2 int run scoreboard players operation #double_to_int.5 int += #double_to_int.8 int

scoreboard players operation #double_to_int.9 int += #double_to_int.10 int
scoreboard players operation #double_to_int.9 int += #double_to_int.11 int
execute store result score #float_mul.high_precision.input1.3 int run scoreboard players operation #double_to_int.9 int += #double_to_int.12 int

scoreboard players operation #double_to_int.13 int += #double_to_int.14 int
scoreboard players operation #double_to_int.13 int += #double_to_int.15 int
execute store result score #float_mul.high_precision.input1.4 int run scoreboard players operation #double_to_int.13 int += #double_to_int.16 int

scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.2 int
scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.3 int
execute if score #is_XXEXX int matches 1 if score #-sign int matches 1 run scoreboard players operation #double_to_int.expon.1 int *= -1 const

execute store result storage large_number:math double_to_int.output.expon short 1.0 run scoreboard players get #double_to_int.expon.1 int

#测试数字是否为0
execute if data storage large_number:math double_to_int{input:0.0d} store success storage large_number:math double_to_int.output.point byte 0 store result storage large_number:math double_to_int.output.leading_zeros byte 0 run data modify storage large_number:math double_to_int.output.sign set value 0b


execute store result score #float_mul.high_precision.input1.sign int run data get storage large_number:math double_to_int.output.sign
execute store result score #float_mul.high_precision.input1.expon int run data get storage large_number:math double_to_int.output.expon
execute store result score #float_mul.high_precision.input1.point int run data get storage large_number:math double_to_int.output.point
execute store result score #float_mul.high_precision.input1.leading_zeros int run data get storage large_number:math double_to_int.output.leading_zeros


##数值类型转化
# double 转 int数组  考虑到了科学记数法

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

data modify storage large_number:math double_to_int.input set from storage large_number:math float_multiply.input2

#读数顺序：先读前导零，后读小数点，然后是指数位

data modify storage large_number:math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,expon:0s,point:0b,leading_zeros:0b}

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

#测试小数点的位置
execute if score #is_XXEXX int matches 1 run scoreboard players set #temp1 int 2
execute store result score #temp2 int run data get storage large_number:math double_to_int.input
execute if score #temp2 int matches ..-1 run scoreboard players operation #temp2 int *= -1 const
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 0..9 run scoreboard players set #temp1 int 2
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 10..99 run scoreboard players set #temp1 int 3
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 100..999 run scoreboard players set #temp1 int 4
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 1000..9999 run scoreboard players set #temp1 int 5
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 10000..99999 run scoreboard players set #temp1 int 6
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 100000..999999 run scoreboard players set #temp1 int 7
execute unless score #is_XXEXX int matches 1 if score #temp2 int matches 1000000..9999999 run scoreboard players set #temp1 int 8
execute store result storage large_number:math double_to_int.output.point byte 1.0 run scoreboard players get #temp1 int

#排除小数点，字符串列表转化为复合标签列表，字符串转化为可进行列表索引的键值对
data modify storage large_number:math temp_string_list set value []
data modify storage large_number:math temp_expon_list set value []

#处理数值部分
data modify storage large_number:math temp3 set value {a:0}
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3
execute store result score #-sign int run data modify storage large_number:math temp3.a set value 0
data modify storage large_number:math temp3.a set string storage large_number:math temp1 0 1
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:'.'} unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_string_list append from storage large_number:math temp3


#处理指数位

#测试是否为负数
data modify storage large_number:math temp4 set string storage large_number:math temp_expon 0 1
execute store success score #-sign int if data storage large_number:math {temp4:"-"} run data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1

data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_expon_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
execute store success storage large_number:math temp3.a int 0 unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_expon_list append from storage large_number:math temp3
data modify storage large_number:math temp3.a set string storage large_number:math temp_expon 0 1
data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1
execute unless data storage large_number:math temp3{a:0} run data modify storage large_number:math temp_expon_list append from storage large_number:math temp3

#列表索引，批量转化，字符串转化为int数值
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

#测试前导0的数量
execute store result score #temp1 int run data get storage large_number:math temp_string_list[0].a
execute store result score #temp2 int run data get storage large_number:math temp_string_list[1].a
execute store result score #temp3 int run data get storage large_number:math temp_string_list[2].a
execute if score #temp1 int matches 0 run data modify storage large_number:math double_to_int.output.leading_zeros set value 1b
execute if score #temp1 int matches 0 if score #temp2 int matches 0 run data modify storage large_number:math double_to_int.output.leading_zeros set value 2b
execute if score #temp1 int matches 0 if score #temp2 int matches 0 if score #temp3 int matches 0 run data modify storage large_number:math double_to_int.output.leading_zeros set value 3b

#从后往前逐位读取到计分板，自动靠后对齐
execute store result score #double_to_int.16 int run data get storage large_number:math temp_string_list[-1].a
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.15 int run data get storage large_number:math temp_string_list[-1].a 10
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.14 int run data get storage large_number:math temp_string_list[-1].a 100
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.13 int run data get storage large_number:math temp_string_list[-1].a 1000
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.12 int run data get storage large_number:math temp_string_list[-1].a
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.11 int run data get storage large_number:math temp_string_list[-1].a 10
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.10 int run data get storage large_number:math temp_string_list[-1].a 100
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.9 int run data get storage large_number:math temp_string_list[-1].a 1000
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.8 int run data get storage large_number:math temp_string_list[-1].a
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.7 int run data get storage large_number:math temp_string_list[-1].a 10
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.6 int run data get storage large_number:math temp_string_list[-1].a 100
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.5 int run data get storage large_number:math temp_string_list[-1].a 1000
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.4 int run data get storage large_number:math temp_string_list[-1].a
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.3 int run data get storage large_number:math temp_string_list[-1].a 10
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.2 int run data get storage large_number:math temp_string_list[-1].a 100
data remove storage large_number:math temp_string_list[-1]
execute store result score #double_to_int.1 int run data get storage large_number:math temp_string_list[-1].a 1000

execute store result score #double_to_int.expon.3 int run data get storage large_number:math temp_expon_list[-1].a
data remove storage large_number:math temp_expon_list[-1]
execute store result score #double_to_int.expon.2 int run data get storage large_number:math temp_expon_list[-1].a 10
data remove storage large_number:math temp_expon_list[-1]
execute store result score #double_to_int.expon.1 int run data get storage large_number:math temp_expon_list[-1].a 100

#合并数字成为万进制int数组
scoreboard players operation #double_to_int.1 int += #double_to_int.2 int
scoreboard players operation #double_to_int.1 int += #double_to_int.3 int
execute store result score #float_mul.high_precision.input2.1 int run scoreboard players operation #double_to_int.1 int += #double_to_int.4 int

scoreboard players operation #double_to_int.5 int += #double_to_int.6 int
scoreboard players operation #double_to_int.5 int += #double_to_int.7 int
execute store result score #float_mul.high_precision.input2.2 int run scoreboard players operation #double_to_int.5 int += #double_to_int.8 int

scoreboard players operation #double_to_int.9 int += #double_to_int.10 int
scoreboard players operation #double_to_int.9 int += #double_to_int.11 int
execute store result score #float_mul.high_precision.input2.3 int run scoreboard players operation #double_to_int.9 int += #double_to_int.12 int

scoreboard players operation #double_to_int.13 int += #double_to_int.14 int
scoreboard players operation #double_to_int.13 int += #double_to_int.15 int
execute store result score #float_mul.high_precision.input2.4 int run scoreboard players operation #double_to_int.13 int += #double_to_int.16 int

scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.2 int
scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.3 int
execute if score #is_XXEXX int matches 1 if score #-sign int matches 1 run scoreboard players operation #double_to_int.expon.1 int *= -1 const

execute store result storage large_number:math double_to_int.output.expon short 1.0 run scoreboard players get #double_to_int.expon.1 int

#测试数字是否为0
execute if data storage large_number:math double_to_int{input:0.0d} store success storage large_number:math double_to_int.output.point byte 0 store result storage large_number:math double_to_int.output.leading_zeros byte 0 run data modify storage large_number:math double_to_int.output.sign set value 0b


execute store result score #float_mul.high_precision.input2.sign int run data get storage large_number:math double_to_int.output.sign
execute store result score #float_mul.high_precision.input2.expon int run data get storage large_number:math double_to_int.output.expon
execute store result score #float_mul.high_precision.input2.point int run data get storage large_number:math double_to_int.output.point
execute store result score #float_mul.high_precision.input2.leading_zeros int run data get storage large_number:math double_to_int.output.leading_zeros


##16位数相乘

#    1234
# *  1234
#-----------
#    abcd
#   efgh
#  ijkl
# mnop

#float_mul.high_precision.input1.1 int * #float_mul.high_precision.input2.1 int

scoreboard players operation #d int = #float_mul.high_precision.input1.4 int
execute store result score #5.4 int run scoreboard players operation #d int *= #float_mul.high_precision.input2.4 int
scoreboard players operation #c int = #float_mul.high_precision.input1.3 int
scoreboard players operation #c int *= #float_mul.high_precision.input2.4 int
scoreboard players operation #b int = #float_mul.high_precision.input1.2 int
scoreboard players operation #b int *= #float_mul.high_precision.input2.4 int
scoreboard players operation #a int = #float_mul.high_precision.input1.1 int
scoreboard players operation #a int *= #float_mul.high_precision.input2.4 int

scoreboard players operation #h int = #float_mul.high_precision.input1.4 int
scoreboard players operation #h int *= #float_mul.high_precision.input2.3 int
scoreboard players operation #g int = #float_mul.high_precision.input1.3 int
scoreboard players operation #g int *= #float_mul.high_precision.input2.3 int
scoreboard players operation #f int = #float_mul.high_precision.input1.2 int
scoreboard players operation #f int *= #float_mul.high_precision.input2.3 int
scoreboard players operation #e int = #float_mul.high_precision.input1.1 int
scoreboard players operation #e int *= #float_mul.high_precision.input2.3 int

scoreboard players operation #l int = #float_mul.high_precision.input1.4 int
scoreboard players operation #l int *= #float_mul.high_precision.input2.2 int
scoreboard players operation #k int = #float_mul.high_precision.input1.3 int
scoreboard players operation #k int *= #float_mul.high_precision.input2.2 int
scoreboard players operation #j int = #float_mul.high_precision.input1.2 int
scoreboard players operation #j int *= #float_mul.high_precision.input2.2 int
scoreboard players operation #i int = #float_mul.high_precision.input1.1 int
scoreboard players operation #i int *= #float_mul.high_precision.input2.2 int

scoreboard players operation #p int = #float_mul.high_precision.input1.4 int
scoreboard players operation #p int *= #float_mul.high_precision.input2.1 int
scoreboard players operation #o int = #float_mul.high_precision.input1.3 int
scoreboard players operation #o int *= #float_mul.high_precision.input2.1 int
scoreboard players operation #n int = #float_mul.high_precision.input1.2 int
scoreboard players operation #n int *= #float_mul.high_precision.input2.1 int
scoreboard players operation #m int = #float_mul.high_precision.input1.1 int
scoreboard players operation #m int *= #float_mul.high_precision.input2.1 int

scoreboard players operation #h int += #c int
scoreboard players operation #l int += #g int
scoreboard players operation #l int += #b int
scoreboard players operation #p int += #k int
scoreboard players operation #p int += #f int
scoreboard players operation #p int += #a int
scoreboard players operation #o int += #j int
scoreboard players operation #o int += #e int
scoreboard players operation #n int += #i int

scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #h int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #l int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #p int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #o int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #n int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #z int run scoreboard players operation #m int += #5.4 int
scoreboard players operation #z int /= 10000 const

scoreboard players operation #m int %= 10000 const
scoreboard players operation #n int %= 10000 const
scoreboard players operation #o int %= 10000 const
scoreboard players operation #p int %= 10000 const
scoreboard players operation #l int %= 10000 const
scoreboard players operation #h int %= 10000 const
scoreboard players operation #d int %= 10000 const

########################################

##读数

scoreboard players set #temp11 int 10000
scoreboard players set #temp12 int 10000
scoreboard players set #temp13 int 10000
scoreboard players set #temp14 int 10000
scoreboard players set #temp21 int 10000
scoreboard players set #temp22 int 10000
scoreboard players set #temp23 int 10000
scoreboard players set #temp24 int 10000

execute store result storage large_number:math temp11 int 1 run scoreboard players operation #temp11 int += #float_mul.high_precision.input1.1 int
execute store result storage large_number:math temp12 int 1 run scoreboard players operation #temp12 int += #float_mul.high_precision.input1.2 int
execute store result storage large_number:math temp13 int 1 run scoreboard players operation #temp13 int += #float_mul.high_precision.input1.3 int
execute store result storage large_number:math temp14 int 1 run scoreboard players operation #temp14 int += #float_mul.high_precision.input1.4 int
execute store result storage large_number:math temp21 int 1 run scoreboard players operation #temp21 int += #float_mul.high_precision.input2.1 int
execute store result storage large_number:math temp22 int 1 run scoreboard players operation #temp22 int += #float_mul.high_precision.input2.2 int
execute store result storage large_number:math temp23 int 1 run scoreboard players operation #temp23 int += #float_mul.high_precision.input2.3 int
execute store result storage large_number:math temp24 int 1 run scoreboard players operation #temp24 int += #float_mul.high_precision.input2.4 int

data modify storage large_number:math temp11 set string storage large_number:math temp11 1
data modify storage large_number:math temp12 set string storage large_number:math temp12 1
data modify storage large_number:math temp13 set string storage large_number:math temp13 1
data modify storage large_number:math temp14 set string storage large_number:math temp14 1
data modify storage large_number:math temp21 set string storage large_number:math temp21 1
data modify storage large_number:math temp22 set string storage large_number:math temp22 1
data modify storage large_number:math temp23 set string storage large_number:math temp23 1
data modify storage large_number:math temp24 set string storage large_number:math temp24 1

function large_number:float_mul.high_precision/macro1 with storage large_number:math

execute if score #float_mul.high_precision.input1.1 int matches 0 run data modify storage large_number:math temp_float_mul_input1_string set string storage large_number:math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 run data modify storage large_number:math temp_float_mul_input1_string set string storage large_number:math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 if score #float_mul.high_precision.input1.3 int matches 0 run data modify storage large_number:math temp_float_mul_input1_string set string storage large_number:math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 if score #float_mul.high_precision.input1.3 int matches 0 if score #float_mul.high_precision.input1.4 int matches 0 run data modify storage large_number:math temp_float_mul_input1_string set string storage large_number:math temp_float_mul_input1_string 4

execute if score #float_mul.high_precision.input2.1 int matches 0 run data modify storage large_number:math temp_float_mul_input2_string set string storage large_number:math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 run data modify storage large_number:math temp_float_mul_input2_string set string storage large_number:math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 if score #float_mul.high_precision.input2.3 int matches 0 run data modify storage large_number:math temp_float_mul_input2_string set string storage large_number:math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 if score #float_mul.high_precision.input2.3 int matches 0 if score #float_mul.high_precision.input2.4 int matches 0 run data modify storage large_number:math temp_float_mul_input2_string set string storage large_number:math temp_float_mul_input2_string 4

data modify storage large_number:math temp1 set string storage large_number:math temp_float_mul_input1_string 0 4
execute if data storage large_number:math {temp1:"0000"} run data modify storage large_number:math temp_float_mul_input1_string set string storage large_number:math temp_float_mul_input1_string 4
data modify storage large_number:math temp1 set string storage large_number:math temp_float_mul_input1_string 0 3
execute if data storage large_number:math {temp1:"000"} run data modify storage large_number:math temp_float_mul_input1_string set string storage large_number:math temp_float_mul_input1_string 3
data modify storage large_number:math temp1 set string storage large_number:math temp_float_mul_input1_string 0 2
execute if data storage large_number:math {temp1:"00"} run data modify storage large_number:math temp_float_mul_input1_string set string storage large_number:math temp_float_mul_input1_string 2
data modify storage large_number:math temp1 set string storage large_number:math temp_float_mul_input1_string 0 1
execute if data storage large_number:math {temp1:"0"} run data modify storage large_number:math temp_float_mul_input1_string set string storage large_number:math temp_float_mul_input1_string 1
data modify storage large_number:math temp1 set string storage large_number:math temp_float_mul_input2_string 0 4
execute if data storage large_number:math {temp1:"0000"} run data modify storage large_number:math temp_float_mul_input2_string set string storage large_number:math temp_float_mul_input2_string 4
data modify storage large_number:math temp1 set string storage large_number:math temp_float_mul_input2_string 0 3
execute if data storage large_number:math {temp1:"000"} run data modify storage large_number:math temp_float_mul_input2_string set string storage large_number:math temp_float_mul_input2_string 3
data modify storage large_number:math temp1 set string storage large_number:math temp_float_mul_input2_string 0 2
execute if data storage large_number:math {temp1:"00"} run data modify storage large_number:math temp_float_mul_input2_string set string storage large_number:math temp_float_mul_input2_string 2
data modify storage large_number:math temp1 set string storage large_number:math temp_float_mul_input2_string 0 1
execute if data storage large_number:math {temp1:"0"} run data modify storage large_number:math temp_float_mul_input2_string set string storage large_number:math temp_float_mul_input2_string 1

scoreboard players set #input1_expon int 0
scoreboard players set #input2_expon int 0

scoreboard players operation #Store_float_mul.high_precision.input1.leading_zeros int = #float_mul.high_precision.input1.leading_zeros int
scoreboard players operation #Store_float_mul.high_precision.input2.leading_zeros int = #float_mul.high_precision.input2.leading_zeros int
scoreboard players operation #Store_float_mul.high_precision.input1.expon int = #float_mul.high_precision.input1.expon int
scoreboard players operation #Store_float_mul.high_precision.input2.expon int = #float_mul.high_precision.input2.expon int

execute if score #Store_float_mul.high_precision.input1.leading_zeros int matches 1.. run function large_number:float_mul.high_precision/input1_has_leading_zeros
execute if score #Store_float_mul.high_precision.input2.leading_zeros int matches 1.. run function large_number:float_mul.high_precision/input2_has_leading_zeros

execute if score #Store_float_mul.high_precision.input1.leading_zeros int matches 0 if score #Store_float_mul.high_precision.input1.expon int matches 0 run function large_number:float_mul.high_precision/expon1_is0
execute if score #Store_float_mul.high_precision.input2.leading_zeros int matches 0 if score #Store_float_mul.high_precision.input2.expon int matches 0 run function large_number:float_mul.high_precision/expon2_is0

execute if score #Store_float_mul.high_precision.input1.leading_zeros int matches 0 unless score #Store_float_mul.high_precision.input1.expon int matches 0 run function large_number:float_mul.high_precision/unless_expon1_is0
execute if score #Store_float_mul.high_precision.input2.leading_zeros int matches 0 unless score #Store_float_mul.high_precision.input2.expon int matches 0 run function large_number:float_mul.high_precision/unless_expon2_is0

##最终输出

scoreboard players operation #float_mul.high_precision.input1.sign int *= #float_mul.high_precision.input2.sign int
data modify storage large_number:math sstemp1 set value ""
execute if score #float_mul.high_precision.input1.sign int matches -1 run data modify storage large_number:math sstemp1 set value "-"
execute store result storage large_number:math sstemp2 int 1 run scoreboard players operation #input1_expon int += #input2_expon int

execute store result storage large_number:math temp1 int 1 run scoreboard players get #z int
execute store result storage large_number:math temp2 int 1 run scoreboard players add #m int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #n int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #o int 10000
execute store result storage large_number:math temp5 int 1 run scoreboard players add #p int 10000
execute store result storage large_number:math temp6 int 1 run scoreboard players add #l int 10000
execute store result storage large_number:math temp7 int 1 run scoreboard players add #h int 10000
execute store result storage large_number:math temp8 int 1 run scoreboard players add #d int 10000

data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
data modify storage large_number:math temp5 set string storage large_number:math temp5 1
data modify storage large_number:math temp6 set string storage large_number:math temp6 1
data modify storage large_number:math temp7 set string storage large_number:math temp7 1
data modify storage large_number:math temp8 set string storage large_number:math temp8 1

function large_number:float_mul.high_precision/macro2 with storage large_number:math
