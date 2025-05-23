##高精度浮点乘法
#采用了全新新架构，把因数都转化为int数组然后进行大数乘法，再根据转化后传递的数字信息计算指数，用函数宏输出结果。
#可精确到双精度浮点数级

##数值类型转化

#转化为字符串，并仅取前16位
data modify storage large_number:math temp1 set string storage large_number:math store_float_multiply_input1 0 -1

#测试是否为负数
data modify storage large_number:math temp4 set string storage large_number:math temp1 0 1
scoreboard players set #float_mul.high_precision.input1.sign int 1
execute if data storage large_number:math {temp4:"-"} run scoreboard players set #float_mul.high_precision.input1.sign int -1
execute if data storage large_number:math {temp4:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]

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

data remove storage large_number:math temp_expon_list[{a:""}]
data remove storage large_number:math temp_expon_list[{a:'.'}]
data remove storage large_number:math temp_expon_list[{a:0}]
data modify storage large_number:math temp_expon_list[{a:"0"}] set value {a:0}
data modify storage large_number:math temp_expon_list[{a:"1"}] set value {a:1}
data modify storage large_number:math temp_expon_list[{a:"2"}] set value {a:2}
data modify storage large_number:math temp_expon_list[{a:"3"}] set value {a:3}
data modify storage large_number:math temp_expon_list[{a:"4"}] set value {a:4}
data modify storage large_number:math temp_expon_list[{a:"5"}] set value {a:5}
data modify storage large_number:math temp_expon_list[{a:"6"}] set value {a:6}
data modify storage large_number:math temp_expon_list[{a:"7"}] set value {a:7}
data modify storage large_number:math temp_expon_list[{a:"8"}] set value {a:8}
data modify storage large_number:math temp_expon_list[{a:"9"}] set value {a:9}

execute store result score #double_to_int.expon.3 int run data get storage large_number:math temp_expon_list[-1].a
execute store result score #double_to_int.expon.2 int run data get storage large_number:math temp_expon_list[-2].a 10
execute store result score #double_to_int.expon.1 int run data get storage large_number:math temp_expon_list[-3].a 100

scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.2 int
scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.3 int
execute if score #is_XXEXX int matches 1 if score #-sign int matches 1 run scoreboard players operation #double_to_int.expon.1 int *= -1 const
scoreboard players add #double_to_int.expon.1 int 1

#测试小数点的位置
scoreboard players set #temp1 int 0
execute store result score #temp2 int run data get storage large_number:math store_float_multiply_input1
execute if score #temp2 int matches ..-1 store result score #temp2 int run data get storage large_number:math store_float_multiply_input1 -1
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

execute store result score #float_mul.high_precision.input1.expon int run scoreboard players operation #double_to_int.expon.1 int -= #leading_zeros int

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
data remove storage large_number:math temp_string_list[{a:""}]
data remove storage large_number:math temp_string_list[{a:'.'}]
data remove storage large_number:math temp_string_list[{a:0}]
data modify storage large_number:math temp_string_list[{a:"0"}] set value {a:0}
data modify storage large_number:math temp_string_list[{a:"1"}] set value {a:1}
data modify storage large_number:math temp_string_list[{a:"2"}] set value {a:2}
data modify storage large_number:math temp_string_list[{a:"3"}] set value {a:3}
data modify storage large_number:math temp_string_list[{a:"4"}] set value {a:4}
data modify storage large_number:math temp_string_list[{a:"5"}] set value {a:5}
data modify storage large_number:math temp_string_list[{a:"6"}] set value {a:6}
data modify storage large_number:math temp_string_list[{a:"7"}] set value {a:7}
data modify storage large_number:math temp_string_list[{a:"8"}] set value {a:8}
data modify storage large_number:math temp_string_list[{a:"9"}] set value {a:9}

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


##数值类型转化

#转化为字符串，并仅取前16位
data modify storage large_number:math temp1 set string storage large_number:math store_float_multiply_input2 0 -1

#测试是否为负数
data modify storage large_number:math temp4 set string storage large_number:math temp1 0 1
scoreboard players set #float_mul.high_precision.input2.sign int 1
execute if data storage large_number:math {temp4:"-"} run scoreboard players set #float_mul.high_precision.input2.sign int -1
execute if data storage large_number:math {temp4:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]

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

data remove storage large_number:math temp_expon_list[{a:""}]
data remove storage large_number:math temp_expon_list[{a:'.'}]
data remove storage large_number:math temp_expon_list[{a:0}]
data modify storage large_number:math temp_expon_list[{a:"0"}] set value {a:0}
data modify storage large_number:math temp_expon_list[{a:"1"}] set value {a:1}
data modify storage large_number:math temp_expon_list[{a:"2"}] set value {a:2}
data modify storage large_number:math temp_expon_list[{a:"3"}] set value {a:3}
data modify storage large_number:math temp_expon_list[{a:"4"}] set value {a:4}
data modify storage large_number:math temp_expon_list[{a:"5"}] set value {a:5}
data modify storage large_number:math temp_expon_list[{a:"6"}] set value {a:6}
data modify storage large_number:math temp_expon_list[{a:"7"}] set value {a:7}
data modify storage large_number:math temp_expon_list[{a:"8"}] set value {a:8}
data modify storage large_number:math temp_expon_list[{a:"9"}] set value {a:9}

execute store result score #double_to_int.expon.3 int run data get storage large_number:math temp_expon_list[-1].a
execute store result score #double_to_int.expon.2 int run data get storage large_number:math temp_expon_list[-2].a 10
execute store result score #double_to_int.expon.1 int run data get storage large_number:math temp_expon_list[-3].a 100

scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.2 int
scoreboard players operation #double_to_int.expon.1 int += #double_to_int.expon.3 int
execute if score #is_XXEXX int matches 1 if score #-sign int matches 1 run scoreboard players operation #double_to_int.expon.1 int *= -1 const
scoreboard players add #double_to_int.expon.1 int 1

#测试小数点的位置
scoreboard players set #temp1 int 0
execute store result score #temp2 int run data get storage large_number:math store_float_multiply_input2
execute if score #temp2 int matches ..-1 store result score #temp2 int run data get storage large_number:math store_float_multiply_input2 -1
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

execute store result score #float_mul.high_precision.input2.expon int run scoreboard players operation #double_to_int.expon.1 int -= #leading_zeros int

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
data remove storage large_number:math temp_string_list[{a:""}]
data remove storage large_number:math temp_string_list[{a:'.'}]
data remove storage large_number:math temp_string_list[{a:0}]
data modify storage large_number:math temp_string_list[{a:"0"}] set value {a:0}
data modify storage large_number:math temp_string_list[{a:"1"}] set value {a:1}
data modify storage large_number:math temp_string_list[{a:"2"}] set value {a:2}
data modify storage large_number:math temp_string_list[{a:"3"}] set value {a:3}
data modify storage large_number:math temp_string_list[{a:"4"}] set value {a:4}
data modify storage large_number:math temp_string_list[{a:"5"}] set value {a:5}
data modify storage large_number:math temp_string_list[{a:"6"}] set value {a:6}
data modify storage large_number:math temp_string_list[{a:"7"}] set value {a:7}
data modify storage large_number:math temp_string_list[{a:"8"}] set value {a:8}
data modify storage large_number:math temp_string_list[{a:"9"}] set value {a:9}

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

scoreboard players operation #m int %= 10000 const
scoreboard players operation #n int %= 10000 const
scoreboard players operation #o int %= 10000 const
scoreboard players operation #p int %= 10000 const


##最终输出

scoreboard players operation #float_mul.high_precision.input1.sign int *= #float_mul.high_precision.input2.sign int
data modify storage large_number:math sstemp1 set value ""
execute if score #float_mul.high_precision.input1.sign int matches -1 run data modify storage large_number:math sstemp1 set value "-"
scoreboard players operation #float_mul.high_precision.input1.expon int += #float_mul.high_precision.input2.expon int
execute store result storage large_number:math sstemp2 int 1 run scoreboard players remove #float_mul.high_precision.input1.expon int 20

execute store result storage large_number:math temp1 int 1 run scoreboard players operation #z int /= 10000 const
execute store result storage large_number:math temp2 int 1 run scoreboard players add #m int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #n int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #o int 10000
execute store result storage large_number:math temp5 int 1 run scoreboard players add #p int 10000

data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
data modify storage large_number:math temp5 set string storage large_number:math temp5 1

function large_number:float_mul.high_precision/output.macro2 with storage large_number:math
