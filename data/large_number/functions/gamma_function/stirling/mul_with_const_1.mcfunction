##高精度浮点乘法 - 浮点乘常数
#采用了全新新架构，把因数都转化为int数组然后进行大数乘法，再根据转化后传递的数字信息计算指数，用函数宏输出结果。
#可精确到双精度浮点数级，完美解决了double乘法的精度问题

##数值类型转化

#转化为字符串，并仅取前16位
data modify storage large_number:math temp1 set string storage large_number:math float_multiply.input1 0 -1

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
execute store result score #temp2 int run data get storage large_number:math float_multiply.input1
execute if score #temp2 int matches ..-1 store result score #temp2 int run data get storage large_number:math float_multiply.input1 -1
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
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.2 int run data get storage large_number:math temp_string_list[0].a 100
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.3 int run data get storage large_number:math temp_string_list[0].a 10
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.4 int run data get storage large_number:math temp_string_list[0].a
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.5 int run data get storage large_number:math temp_string_list[0].a 1000
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.6 int run data get storage large_number:math temp_string_list[0].a 100
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.7 int run data get storage large_number:math temp_string_list[0].a 10
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.8 int run data get storage large_number:math temp_string_list[0].a
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.9 int run data get storage large_number:math temp_string_list[0].a 1000
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.10 int run data get storage large_number:math temp_string_list[0].a 100
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.11 int run data get storage large_number:math temp_string_list[0].a 10
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.12 int run data get storage large_number:math temp_string_list[0].a
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.13 int run data get storage large_number:math temp_string_list[0].a 1000
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.14 int run data get storage large_number:math temp_string_list[0].a 100
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.15 int run data get storage large_number:math temp_string_list[0].a 10
data remove storage large_number:math temp_string_list[0]
execute store result score #double_to_int.16 int run data get storage large_number:math temp_string_list[0].a

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

##20位数乘16位数

#    12345
# *   1234
#-----------
#    abcde
#   12345
#  uvxyz
# ABCDE

#float_mul.high_precision.input1.1 int
# 2506 6282 7463 1000 5024
# 1479 8198 6051 1658 5910
execute store result score #E int store result score #z int store result score #5 int run scoreboard players set #e int 5024
execute store result score #D int store result score #y int store result score #4 int run scoreboard players set #d int 1000
execute store result score #C int store result score #x int store result score #3 int run scoreboard players set #c int 7463
execute store result score #B int store result score #v int store result score #2 int run scoreboard players set #b int 6282
execute store result score #A int store result score #u int store result score #1 int run scoreboard players set #a int 2506

scoreboard players operation #a int *= #float_mul.high_precision.input1.4 int
scoreboard players operation #b int *= #float_mul.high_precision.input1.4 int
scoreboard players operation #c int *= #float_mul.high_precision.input1.4 int
scoreboard players operation #d int *= #float_mul.high_precision.input1.4 int
execute store result score #5.4 int run scoreboard players operation #e int *= #float_mul.high_precision.input1.4 int
scoreboard players operation #1 int *= #float_mul.high_precision.input1.3 int
scoreboard players operation #2 int *= #float_mul.high_precision.input1.3 int
scoreboard players operation #3 int *= #float_mul.high_precision.input1.3 int
scoreboard players operation #4 int *= #float_mul.high_precision.input1.3 int
scoreboard players operation #5 int *= #float_mul.high_precision.input1.3 int
scoreboard players operation #u int *= #float_mul.high_precision.input1.2 int
scoreboard players operation #v int *= #float_mul.high_precision.input1.2 int
scoreboard players operation #x int *= #float_mul.high_precision.input1.2 int
scoreboard players operation #y int *= #float_mul.high_precision.input1.2 int
scoreboard players operation #z int *= #float_mul.high_precision.input1.2 int
scoreboard players operation #A int *= #float_mul.high_precision.input1.1 int
scoreboard players operation #B int *= #float_mul.high_precision.input1.1 int
scoreboard players operation #C int *= #float_mul.high_precision.input1.1 int
scoreboard players operation #D int *= #float_mul.high_precision.input1.1 int
scoreboard players operation #E int *= #float_mul.high_precision.input1.1 int

scoreboard players operation #5 int += #d int
scoreboard players operation #z int += #4 int
scoreboard players operation #z int += #c int
scoreboard players operation #E int += #y int
scoreboard players operation #E int += #3 int
scoreboard players operation #E int += #b int
scoreboard players operation #D int += #x int
scoreboard players operation #D int += #2 int
scoreboard players operation #D int += #a int
scoreboard players operation #C int += #v int
scoreboard players operation #C int += #1 int
scoreboard players operation #B int += #u int

scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #5 int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #z int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #E int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #D int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #C int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #B int += #5.4 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #Z int run scoreboard players operation #A int += #5.4 int
scoreboard players operation #Z int /= 10000 const

scoreboard players operation #A int %= 10000 const
scoreboard players operation #B int %= 10000 const
scoreboard players operation #C int %= 10000 const
scoreboard players operation #D int %= 10000 const
scoreboard players operation #E int %= 10000 const
scoreboard players operation #z int %= 10000 const
scoreboard players operation #5 int %= 10000 const
scoreboard players operation #e int %= 10000 const


##最终输出

data modify storage large_number:math sstemp1 set value ""
execute if score #float_mul.high_precision.input1.sign int matches -1 run data modify storage large_number:math sstemp1 set value "-"
execute store result storage large_number:math sstemp2 int 1 run scoreboard players remove #float_mul.high_precision.input1.expon int 35

execute store result storage large_number:math temp1 int 1 run scoreboard players get #Z int
execute store result storage large_number:math temp2 int 1 run scoreboard players add #A int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #B int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #C int 10000
execute store result storage large_number:math temp5 int 1 run scoreboard players add #D int 10000
execute store result storage large_number:math temp6 int 1 run scoreboard players add #E int 10000
execute store result storage large_number:math temp7 int 1 run scoreboard players add #z int 10000
execute store result storage large_number:math temp8 int 1 run scoreboard players add #5 int 10000
execute store result storage large_number:math temp9 int 1 run scoreboard players add #e int 10000

data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
data modify storage large_number:math temp5 set string storage large_number:math temp5 1
data modify storage large_number:math temp6 set string storage large_number:math temp6 1
data modify storage large_number:math temp7 set string storage large_number:math temp7 1
data modify storage large_number:math temp8 set string storage large_number:math temp8 1
data modify storage large_number:math temp9 set string storage large_number:math temp9 1

function large_number:ln_high_precision/remez/mul_with_const_1_out with storage large_number:math
