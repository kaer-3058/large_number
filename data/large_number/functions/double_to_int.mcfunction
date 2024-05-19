##数值类型转化
# double 转 int数组

#正数，负数，0，

#data modify storage large_number:math double_to_int.input set value 6337.1544375d

#读数顺序：先读前导零，后读小数点

data modify storage large_number:math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,point:0b,leading_zeros:0b}

#转化为字符串，并仅取前16位
data modify storage large_number:math temp1 set string storage large_number:math double_to_int.input 0 -1

#测试是否为负数
data modify storage large_number:math temp4 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp4:"-"} store success storage large_number:math double_to_int.output.sign byte -1 run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

#测试小数点的位置
execute store result score #temp2 int run data get storage large_number:math double_to_int.input
execute if score #temp2 int matches ..-1 run scoreboard players operation #temp2 int *= -1 const
execute if score #temp2 int matches 0..9 run scoreboard players set #temp1 int 2
execute if score #temp2 int matches 10..99 run scoreboard players set #temp1 int 3
execute if score #temp2 int matches 100..999 run scoreboard players set #temp1 int 4
execute if score #temp2 int matches 1000..9999 run scoreboard players set #temp1 int 5
execute if score #temp2 int matches 10000..99999 run scoreboard players set #temp1 int 6
execute if score #temp2 int matches 100000..999999 run scoreboard players set #temp1 int 7
execute if score #temp2 int matches 1000000..9999999 run scoreboard players set #temp1 int 8
execute store result storage large_number:math temp5_1 int 1.0 store result storage large_number:math double_to_int.output.point byte 1.0 run scoreboard players get #temp1 int

data modify storage large_number:math temp1 set string storage large_number:math temp1 0 17

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

#测试数字是否为0
execute if data storage large_number:math double_to_int{input:0.0d} store success storage large_number:math double_to_int.output.point byte 0 store success storage large_number:math double_to_int.output.leading_zeros byte 0 run data modify storage large_number:math double_to_int.output.sign set value 0b
