##高精度double开方，更多的有效数字

#data modify storage large_number:math double_sqrt.input set value 6337.1544375d

##数值类型转化
# double 转 int数组

#转化为字符串，并仅取前16位
data modify storage large_number:math temp1 set string storage large_number:math double_sqrt.input 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]

#仅取前16位，如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 17

#处理指数位
data modify storage large_number:math temp_expon_list set value []

#测试是否为负数
data modify storage large_number:math temp3 set value {a:0}
scoreboard players set #-sign large_number.int 0
data modify storage large_number:math temp4 set string storage large_number:math temp_expon 0 1
execute store success score #-sign large_number.int if data storage large_number:math {temp4:"-"} run data modify storage large_number:math temp_expon set string storage large_number:math temp_expon 1

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

execute store result score #double_to_int.expon.3 large_number.int run data get storage large_number:math temp_expon_list[-1].a
execute store result score #double_to_int.expon.2 large_number.int run data get storage large_number:math temp_expon_list[-2].a 10
execute store result score #double_to_int.expon.1 large_number.int run data get storage large_number:math temp_expon_list[-3].a 100

scoreboard players operation #double_to_int.expon.1 large_number.int += #double_to_int.expon.2 large_number.int
scoreboard players operation #double_to_int.expon.1 large_number.int += #double_to_int.expon.3 large_number.int
execute if score #is_XXEXX large_number.int matches 1 if score #-sign large_number.int matches 1 run scoreboard players operation #double_to_int.expon.1 large_number.int *= -1 const
scoreboard players add #double_to_int.expon.1 large_number.int 1

#测试小数点的位置
scoreboard players set #temp1 large_number.int 0
execute store result score #temp2 large_number.int run data get storage large_number:math double_sqrt.input
execute if score #temp2 large_number.int matches ..-1 store result score #temp2 large_number.int run data get storage large_number:math double_sqrt.input -1
execute unless score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/double_to_int.if.1
scoreboard players operation #double_to_int.expon.1 large_number.int += #temp1 large_number.int

#测试前导0数量
scoreboard players set #leading_zeros large_number.int 0
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {stemp10:"0"} run scoreboard players set #leading_zeros large_number.int 1
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 3
execute if data storage large_number:math {stemp10:"0.0"} run scoreboard players set #leading_zeros large_number.int 2
data modify storage large_number:math stemp10 set string storage large_number:math temp1 0 4
execute if data storage large_number:math {stemp10:"0.00"} run scoreboard players set #leading_zeros large_number.int 3
execute if score #leading_zeros large_number.int matches 1 run data modify storage large_number:math temp1 set string storage large_number:math temp1 1
execute if score #leading_zeros large_number.int matches 2 run data modify storage large_number:math temp1 set string storage large_number:math temp1 3
execute if score #leading_zeros large_number.int matches 3 run data modify storage large_number:math temp1 set string storage large_number:math temp1 4
scoreboard players operation #double_to_int.expon.1 large_number.int -= #leading_zeros large_number.int

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
execute store result score #double_to_int.1 large_number.int run data get storage large_number:math temp_string_list[0].a 1000
execute store result score #double_to_int.2 large_number.int run data get storage large_number:math temp_string_list[1].a 100
execute store result score #double_to_int.3 large_number.int run data get storage large_number:math temp_string_list[2].a 10
execute store result score #double_to_int.4 large_number.int run data get storage large_number:math temp_string_list[3].a
execute store result score #double_to_int.5 large_number.int run data get storage large_number:math temp_string_list[4].a 1000
execute store result score #double_to_int.6 large_number.int run data get storage large_number:math temp_string_list[5].a 100
execute store result score #double_to_int.7 large_number.int run data get storage large_number:math temp_string_list[6].a 10
execute store result score #double_to_int.8 large_number.int run data get storage large_number:math temp_string_list[7].a
execute store result score #double_to_int.9 large_number.int run data get storage large_number:math temp_string_list[8].a 1000
execute store result score #double_to_int.10 large_number.int run data get storage large_number:math temp_string_list[9].a 100
execute store result score #double_to_int.11 large_number.int run data get storage large_number:math temp_string_list[10].a 10
execute store result score #double_to_int.12 large_number.int run data get storage large_number:math temp_string_list[11].a
execute store result score #double_to_int.13 large_number.int run data get storage large_number:math temp_string_list[12].a 1000
execute store result score #double_to_int.14 large_number.int run data get storage large_number:math temp_string_list[13].a 100
execute store result score #double_to_int.15 large_number.int run data get storage large_number:math temp_string_list[14].a 10
execute store result score #double_to_int.16 large_number.int run data get storage large_number:math temp_string_list[15].a

#合并数字成为万进制int数组
data modify storage large_number:math temp1 set value [I;0,0,0,0,0,0]
scoreboard players operation #double_to_int.1 large_number.int += #double_to_int.2 large_number.int
scoreboard players operation #double_to_int.1 large_number.int += #double_to_int.3 large_number.int
execute store result storage large_number:math temp1[0] int 1 run scoreboard players operation #double_to_int.1 large_number.int += #double_to_int.4 large_number.int
scoreboard players operation #double_to_int.5 large_number.int += #double_to_int.6 large_number.int
scoreboard players operation #double_to_int.5 large_number.int += #double_to_int.7 large_number.int
execute store result storage large_number:math temp1[1] int 1 run scoreboard players operation #double_to_int.5 large_number.int += #double_to_int.8 large_number.int
scoreboard players operation #double_to_int.9 large_number.int += #double_to_int.10 large_number.int
scoreboard players operation #double_to_int.9 large_number.int += #double_to_int.11 large_number.int
execute store result storage large_number:math temp1[2] int 1 run scoreboard players operation #double_to_int.9 large_number.int += #double_to_int.12 large_number.int
scoreboard players operation #double_to_int.13 large_number.int += #double_to_int.14 large_number.int
scoreboard players operation #double_to_int.13 large_number.int += #double_to_int.15 large_number.int
execute store result storage large_number:math temp1[3] int 1 run scoreboard players operation #double_to_int.13 large_number.int += #double_to_int.16 large_number.int


##京级大数开方 - 竖式法取小数

data modify storage large_number:math large_sqrt.input set from storage large_number:math temp1

function large_number:large_sqrt

execute store result score #sstemp4 large_number.int store result score #sstemp1 large_number.int run data get storage large_number:math large_sqrt.output[0]
execute store result score #sstemp2 large_number.int run data get storage large_number:math large_sqrt.output[1]
execute store result score #sstemp3 large_number.int store result storage large_number:math temp2 int 1 run data get storage large_number:math large_sqrt.output[2]

scoreboard players operation #sstemp4 large_number.int *= 10000 const
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #sstemp4 large_number.int += #sstemp2 large_number.int

scoreboard players operation #temp1 large_number.int = #double_to_int.expon.1 large_number.int
scoreboard players operation #temp1 large_number.int %= 2 const
scoreboard players operation #double_to_int.expon.1 large_number.int /= 2 const
execute store result storage large_number:math temp3 int 1 run scoreboard players remove #double_to_int.expon.1 large_number.int 8


#最终输出
function large_number:macro_operation/double_sqrt_more_integrate_to_scimath with storage large_number:math
execute if score #temp1 large_number.int matches 1 run function large_number:double_sqrt.if/if_expon_.1
