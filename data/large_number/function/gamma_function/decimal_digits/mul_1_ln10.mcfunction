##高精度浮点乘法 - 浮点乘常数
#采用了全新新架构，把因数都转化为int数组然后进行大数乘法，再根据转化后传递的数字信息计算指数，用函数宏输出结果。
#可精确到双精度浮点数级，完美解决了double乘法的精度问题

##数值类型转化

#转化为字符串，并仅取前16位
data modify storage large_number:math temp1 set string storage large_number:math float_multiply.input1 0 -1

#测试是否为负数
data modify storage large_number:math temp4 set string storage large_number:math temp1 0 1
scoreboard players set #float_mul.high_precision.input1.sign large_number.int 1
execute if data storage large_number:math {temp4:"-"} run scoreboard players set #float_mul.high_precision.input1.sign large_number.int -1
execute if data storage large_number:math {temp4:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

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
execute store result score #temp2 large_number.int run data get storage large_number:math float_multiply.input1
execute if score #temp2 large_number.int matches ..-1 store result score #temp2 large_number.int run data get storage large_number:math float_multiply.input1 -1
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

execute store result score #float_mul.high_precision.input1.expon large_number.int run scoreboard players operation #double_to_int.expon.1 large_number.int -= #leading_zeros large_number.int

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
scoreboard players operation #double_to_int.1 large_number.int += #double_to_int.2 large_number.int
scoreboard players operation #double_to_int.1 large_number.int += #double_to_int.3 large_number.int
execute store result score #float_mul.high_precision.input1.1 large_number.int run scoreboard players operation #double_to_int.1 large_number.int += #double_to_int.4 large_number.int
scoreboard players operation #double_to_int.5 large_number.int += #double_to_int.6 large_number.int
scoreboard players operation #double_to_int.5 large_number.int += #double_to_int.7 large_number.int
execute store result score #float_mul.high_precision.input1.2 large_number.int run scoreboard players operation #double_to_int.5 large_number.int += #double_to_int.8 large_number.int
scoreboard players operation #double_to_int.9 large_number.int += #double_to_int.10 large_number.int
scoreboard players operation #double_to_int.9 large_number.int += #double_to_int.11 large_number.int
execute store result score #float_mul.high_precision.input1.3 large_number.int run scoreboard players operation #double_to_int.9 large_number.int += #double_to_int.12 large_number.int
scoreboard players operation #double_to_int.13 large_number.int += #double_to_int.14 large_number.int
scoreboard players operation #double_to_int.13 large_number.int += #double_to_int.15 large_number.int
execute store result score #float_mul.high_precision.input1.4 large_number.int run scoreboard players operation #double_to_int.13 large_number.int += #double_to_int.16 large_number.int

##16位数相乘

# 1479 8198 6051 1658 5910
execute store result score #d large_number.int run scoreboard players set #D large_number.int 2518
execute store result score #c large_number.int run scoreboard players set #C large_number.int 1903
execute store result score #b large_number.int run scoreboard players set #B large_number.int 9448
execute store result score #a large_number.int run scoreboard players set #A large_number.int 4342

execute store result score #5.4 large_number.int run scoreboard players operation #d large_number.int *= #float_mul.high_precision.input1.4 large_number.int
scoreboard players operation #c large_number.int *= #float_mul.high_precision.input1.4 large_number.int
scoreboard players operation #b large_number.int *= #float_mul.high_precision.input1.4 large_number.int
scoreboard players operation #a large_number.int *= #float_mul.high_precision.input1.4 large_number.int
scoreboard players operation #h large_number.int = #D large_number.int
scoreboard players operation #h large_number.int *= #float_mul.high_precision.input1.3 large_number.int
scoreboard players operation #g large_number.int = #C large_number.int
scoreboard players operation #g large_number.int *= #float_mul.high_precision.input1.3 large_number.int
scoreboard players operation #f large_number.int = #B large_number.int
scoreboard players operation #f large_number.int *= #float_mul.high_precision.input1.3 large_number.int
scoreboard players operation #e large_number.int = #A large_number.int
scoreboard players operation #e large_number.int *= #float_mul.high_precision.input1.3 large_number.int
scoreboard players operation #l large_number.int = #D large_number.int
scoreboard players operation #l large_number.int *= #float_mul.high_precision.input1.2 large_number.int
scoreboard players operation #k large_number.int = #C large_number.int
scoreboard players operation #k large_number.int *= #float_mul.high_precision.input1.2 large_number.int
scoreboard players operation #j large_number.int = #B large_number.int
scoreboard players operation #j large_number.int *= #float_mul.high_precision.input1.2 large_number.int
scoreboard players operation #i large_number.int = #A large_number.int
scoreboard players operation #i large_number.int *= #float_mul.high_precision.input1.2 large_number.int
scoreboard players operation #D large_number.int *= #float_mul.high_precision.input1.1 large_number.int
scoreboard players operation #C large_number.int *= #float_mul.high_precision.input1.1 large_number.int
scoreboard players operation #B large_number.int *= #float_mul.high_precision.input1.1 large_number.int
scoreboard players operation #A large_number.int *= #float_mul.high_precision.input1.1 large_number.int

scoreboard players operation #h large_number.int += #c large_number.int
scoreboard players operation #l large_number.int += #g large_number.int
scoreboard players operation #l large_number.int += #b large_number.int
scoreboard players operation #D large_number.int += #k large_number.int
scoreboard players operation #D large_number.int += #f large_number.int
scoreboard players operation #D large_number.int += #a large_number.int
scoreboard players operation #C large_number.int += #j large_number.int
scoreboard players operation #C large_number.int += #e large_number.int
scoreboard players operation #B large_number.int += #i large_number.int

scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #h large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #l large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #D large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #C large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #B large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #Z large_number.int run scoreboard players operation #A large_number.int += #5.4 large_number.int

scoreboard players operation #Z large_number.int /= 10000 const
scoreboard players operation #A large_number.int %= 10000 const
scoreboard players operation #B large_number.int %= 10000 const
scoreboard players operation #C large_number.int %= 10000 const


##最终输出

data modify storage large_number:math sstemp1 set value ""
execute if score #float_mul.high_precision.input1.sign large_number.int matches -1 run data modify storage large_number:math sstemp1 set value "-"
execute store result storage large_number:math sstemp2 int 1 run scoreboard players remove #float_mul.high_precision.input1.expon large_number.int 16

execute store result storage large_number:math temp1 int 1 run scoreboard players get #Z large_number.int
execute store result storage large_number:math temp2 int 1 run scoreboard players add #A large_number.int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #B large_number.int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #C large_number.int 10000

data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1

function large_number:ln_high_precision/remez/mul_with_const_2_out with storage large_number:math
