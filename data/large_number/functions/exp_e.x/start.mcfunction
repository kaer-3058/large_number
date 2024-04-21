##指数函数  e^x

#输入：data modify storage math exp_e^x.input set value 2.722d
#输出：data get storage math exp_e^x.output
#输入值必须为double型
#输入范围为区间：(-709, 709.7828)
#先取整数部分的e^x，再取前三位小数的e^x，三位小数以后的e^x用泰勒展开的前三项

#测试：正值，负值，很大的值，很小的值，0，整数值

data modify storage math store_exp_e_x_input set from storage math exp_e^x.input

data modify storage math temp1 set string storage math store_exp_e_x_input 0 1
execute store success score #is- int if data storage math {temp1:"-"}
execute if score #is- int matches 1 run data modify storage math store_exp_e_x_input set string storage math store_exp_e_x_input 1 -1
execute if score #is- int matches 1 run function large_number:exp_e.x/macro4.input_for_absolute_value with storage math

#判断是否为科学计数法
data modify storage math temp1 set string storage math store_exp_e_x_input 0 -1
data modify storage math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage math temp2[0].a set string storage math temp1 -5 -4
data modify storage math temp2[1].a set string storage math temp1 -4 -3
data modify storage math temp2[2].a set string storage math temp1 -3 -2
data modify storage math temp2[3].a set string storage math temp1 -2 -1
execute store success score #is_XXEXX int if data storage math temp2[{a:"E"}]

execute store result storage math temp1 int 1 run data get storage math store_exp_e_x_input

#如果输入的值很小则强行展开
execute if score #is_XXEXX int matches 1 if data storage math {temp1:0} in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:exp_e.x/input_add_1

#查表，整数部分和前三位小数
function large_number:exp_e.x/macro1.e.x.inte with storage math
execute store result score #stemp2 int store result storage math temp1 int 1 run data get storage math store_exp_e_x_input 1000
execute store result storage math temp1 int 1 run scoreboard players add #stemp2 int 1000
data modify storage math temp1 set string storage math temp1 -3
function large_number:exp_e.x/macro2.e.x.dicimal.1-3 with storage math

#取三位小数及以后的数
data modify storage math temp1 set value ""
data modify storage math temp_store_exp_e^x_input set string storage math store_exp_e_x_input 0 -1
execute store result score #temp1 int run data get storage math store_exp_e_x_input
execute if score #temp1 int matches ..-1 run data modify storage math temp_store_exp_e^x_input set string storage math temp_store_exp_e^x_input 1
execute if score #temp1 int matches ..-1 run scoreboard players operation #temp1 int *= -1 const
execute if score #temp1 int matches 0..9 run data modify storage math temp1 set string storage math temp_store_exp_e^x_input 5
execute if score #temp1 int matches 10..99 run data modify storage math temp1 set string storage math temp_store_exp_e^x_input 6
execute if score #temp1 int matches 100..999 run data modify storage math temp1 set string storage math temp_store_exp_e^x_input 7
data modify storage math temp1 set string storage math temp1 0 13

#字符串数字取为记分板数字，靠前对齐
data modify storage math temp2 set value ""
execute store result score #1.1 int run scoreboard players set #1.3 int 0
execute store result score #temp1 int run data get storage math temp1
execute unless score #temp1 int matches 5.. run data modify storage math temp2 set from storage math temp1
execute unless score #temp1 int matches 5.. run data modify storage math temp1 set value 0
execute if score #temp1 int matches 5.. run data modify storage math temp2 set string storage math temp1 0 5
execute if score #temp1 int matches 5.. run data modify storage math temp1 set string storage math temp1 5
data modify storage math temp2 set string storage math temp2
data modify storage math temp1 set string storage math temp1
execute store result score #temp3 int run data get storage math temp2
execute store result score #temp4 int run data get storage math temp1
function large_number:exp_e.x/macro3.dicimal4--_div2 with storage math
execute if score #temp3 int matches 1 run scoreboard players operation #1.1 int *= 10000 const
execute if score #temp3 int matches 2 run scoreboard players operation #1.1 int *= 1000 const
execute if score #temp3 int matches 3 run scoreboard players operation #1.1 int *= 100 const
execute if score #temp3 int matches 4 run scoreboard players operation #1.1 int *= 10 const
execute if score #temp4 int matches 1 run scoreboard players operation #1.3 int *= 10000000 const
execute if score #temp4 int matches 2 run scoreboard players operation #1.3 int *= 1000000 const
execute if score #temp4 int matches 3 run scoreboard players operation #1.3 int *= 100000 const
execute if score #temp4 int matches 4 run scoreboard players operation #1.3 int *= 10000 const
execute if score #temp4 int matches 5 run scoreboard players operation #1.3 int *= 1000 const
execute if score #temp4 int matches 6 run scoreboard players operation #1.3 int *= 100 const
execute if score #temp4 int matches 7 run scoreboard players operation #1.3 int *= 10 const
scoreboard players operation #1.2 int = #1.1 int
scoreboard players operation #1.4 int = #1.3 int
execute store result score #10.1 int store result score #sstemp1 int run scoreboard players operation #1.1 int /= 10000 const
execute store result score #10.2 int run scoreboard players operation #1.2 int %= 10000 const
execute store result score #10.3 int run scoreboard players operation #1.3 int /= 10000 const
execute store result score #10.4 int run scoreboard players operation #1.4 int %= 10000 const

##泰勒公式，e^x在x=0处展开前三项：1+x+(x^2)/2 = x*(1+x/2)+1

#除法 /2
scoreboard players operation #1.1 int *= 10000 const
scoreboard players operation #1.1 int += #1.2 int
scoreboard players operation #1.1 int *= 10000 const
scoreboard players operation #1.1 int += #1.3 int
execute store result score #n int store result score #o int store result score #p int run scoreboard players operation #1.1 int /= 2 const
execute store result score #b int store result score #f int store result score #j int run scoreboard players operation #n int /= 100000000 const
scoreboard players operation #o int %= 100000000 const
execute store result score #c int store result score #g int store result score #k int run scoreboard players operation #o int /= 10000 const
execute store result score #d int store result score #h int store result score #l int run scoreboard players operation #p int %= 10000 const

execute store result score #a int store result score #e int store result score #i int store result score #m int run scoreboard players set #1.0 int 1

#13位数乘法 #10 * #1

#    abcd
#   efgh
#  ijkl
# mnop

execute store result score #4.1 int run scoreboard players operation #d int *= #10.4 int
scoreboard players operation #c int *= #10.4 int
scoreboard players operation #b int *= #10.4 int
scoreboard players operation #a int *= #10.4 int
scoreboard players operation #h int *= #10.3 int
scoreboard players operation #g int *= #10.3 int
scoreboard players operation #f int *= #10.3 int
scoreboard players operation #e int *= #10.3 int
scoreboard players operation #l int *= #10.2 int
scoreboard players operation #k int *= #10.2 int
scoreboard players operation #j int *= #10.2 int
scoreboard players operation #i int *= #10.2 int
scoreboard players operation #p int *= #10.1 int
scoreboard players operation #o int *= #10.1 int
scoreboard players operation #n int *= #10.1 int
scoreboard players operation #m int *= #10.1 int

scoreboard players operation #h int += #c int
scoreboard players operation #l int += #g int
scoreboard players operation #l int += #b int
scoreboard players operation #p int += #k int
scoreboard players operation #p int += #f int
scoreboard players operation #p int += #a int
scoreboard players operation #o int += #j int
scoreboard players operation #o int += #e int
scoreboard players operation #n int += #i int

scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #h int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #l int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #p int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #o int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #4.1 int run scoreboard players operation #n int += #4.1 int
scoreboard players operation #4.1 int /= 10000 const
execute store result score #taylor.remainder.2 int run scoreboard players operation #m int += #4.1 int

#scoreboard players operation #d int %= 10000 const
#scoreboard players operation #h int %= 10000 const
#scoreboard players operation #l int %= 10000 const
execute store result score #taylor.remainder.5 int run scoreboard players operation #p int %= 10000 const
execute store result score #taylor.remainder.4 int run scoreboard players operation #o int %= 10000 const
execute store result score #taylor.remainder.3 int run scoreboard players operation #n int %= 10000 const
#scoreboard players set #taylor.remainder.1 int 1

##浮点相乘，整数*前三位小数*泰勒尾数

execute store result storage math temp5 int 1 run scoreboard players add #taylor.remainder.2 int 10000
execute store result storage math temp2 int 1 run scoreboard players add #taylor.remainder.3 int 10000
execute store result storage math temp3 int 1 run scoreboard players add #taylor.remainder.4 int 10000
execute store result storage math temp4 int 1 run scoreboard players add #taylor.remainder.5 int 10000

data modify storage math temp5 set string storage math temp5 1
data modify storage math temp2 set string storage math temp2 1
data modify storage math temp3 set string storage math temp3 1
data modify storage math temp4 set string storage math temp4 1

function large_number:exp_e.x/macro5.score_for_float with storage math

#data get storage math temp_e^x_inte
#data get storage math temp_e^x_dicimal_1-3
#data get storage math temp_taylor_remainder

##############################################
##浮点乘法

data modify storage math float_multiply.input2 set from storage math temp_e^x_inte
data modify storage math float_multiply.input1 set from storage math temp_e^x_dicimal_1-3
##高精度浮点乘法

##数值类型转化
# double 转 int数组  考虑到了科学记数法

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

data modify storage math double_to_int.input set from storage math float_multiply.input1

#读数顺序：先读前导零，后读小数点，然后是指数位

data modify storage math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,expon:0s,point:0b,leading_zeros:0b}

#转化为字符串，并仅取前16位
data modify storage math temp1 set string storage math double_to_int.input 0 -1

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
function large_number:exp_e.x/macro6.string_to_double with storage math double_to_int
execute store result score #temp2 int run data get storage math temp3
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

execute store result storage math double_to_int.output.expon short 1.0 run scoreboard players get #double_to_int.expon.1 int

#测试数字是否为0
execute if data storage math double_to_int{input:0.0d} store success storage math double_to_int.output.point byte 0 store result storage math double_to_int.output.leading_zeros byte 0 run data modify storage math double_to_int.output.sign set value 0b


execute store result score #float_mul.high_precision.input1.sign int run data get storage math double_to_int.output.sign
execute store result score #float_mul.high_precision.input1.expon int run data get storage math double_to_int.output.expon
execute store result score #float_mul.high_precision.input1.point int run data get storage math double_to_int.output.point
execute store result score #float_mul.high_precision.input1.leading_zeros int run data get storage math double_to_int.output.leading_zeros


##数值类型转化
# double 转 int数组  考虑到了科学记数法

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

data modify storage math double_to_int.input set from storage math float_multiply.input2

#读数顺序：先读前导零，后读小数点，然后是指数位

data modify storage math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,expon:0s,point:0b,leading_zeros:0b}

#转化为字符串，并仅取前16位
data modify storage math temp1 set string storage math double_to_int.input 0 -1

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
function large_number:exp_e.x/macro6.string_to_double with storage math double_to_int
execute store result score #temp2 int run data get storage math temp3
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

execute store result storage math double_to_int.output.expon short 1.0 run scoreboard players get #double_to_int.expon.1 int

#测试数字是否为0
execute if data storage math double_to_int{input:0.0d} store success storage math double_to_int.output.point byte 0 store result storage math double_to_int.output.leading_zeros byte 0 run data modify storage math double_to_int.output.sign set value 0b


execute store result score #float_mul.high_precision.input2.sign int run data get storage math double_to_int.output.sign
execute store result score #float_mul.high_precision.input2.expon int run data get storage math double_to_int.output.expon
execute store result score #float_mul.high_precision.input2.point int run data get storage math double_to_int.output.point
execute store result score #float_mul.high_precision.input2.leading_zeros int run data get storage math double_to_int.output.leading_zeros


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

execute store result storage math temp11 int 1 run scoreboard players operation #temp11 int += #float_mul.high_precision.input1.1 int
execute store result storage math temp12 int 1 run scoreboard players operation #temp12 int += #float_mul.high_precision.input1.2 int
execute store result storage math temp13 int 1 run scoreboard players operation #temp13 int += #float_mul.high_precision.input1.3 int
execute store result storage math temp14 int 1 run scoreboard players operation #temp14 int += #float_mul.high_precision.input1.4 int
execute store result storage math temp21 int 1 run scoreboard players operation #temp21 int += #float_mul.high_precision.input2.1 int
execute store result storage math temp22 int 1 run scoreboard players operation #temp22 int += #float_mul.high_precision.input2.2 int
execute store result storage math temp23 int 1 run scoreboard players operation #temp23 int += #float_mul.high_precision.input2.3 int
execute store result storage math temp24 int 1 run scoreboard players operation #temp24 int += #float_mul.high_precision.input2.4 int

data modify storage math temp11 set string storage math temp11 1
data modify storage math temp12 set string storage math temp12 1
data modify storage math temp13 set string storage math temp13 1
data modify storage math temp14 set string storage math temp14 1
data modify storage math temp21 set string storage math temp21 1
data modify storage math temp22 set string storage math temp22 1
data modify storage math temp23 set string storage math temp23 1
data modify storage math temp24 set string storage math temp24 1

function large_number:float_mul.high_precision/macro1 with storage math

execute if score #float_mul.high_precision.input1.1 int matches 0 run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 if score #float_mul.high_precision.input1.3 int matches 0 run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 if score #float_mul.high_precision.input1.3 int matches 0 if score #float_mul.high_precision.input1.4 int matches 0 run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4

execute if score #float_mul.high_precision.input2.1 int matches 0 run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 if score #float_mul.high_precision.input2.3 int matches 0 run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 if score #float_mul.high_precision.input2.3 int matches 0 if score #float_mul.high_precision.input2.4 int matches 0 run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4

data modify storage math temp1 set string storage math temp_float_mul_input1_string 0 4
execute if data storage math {temp1:"0000"} run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4
data modify storage math temp1 set string storage math temp_float_mul_input1_string 0 3
execute if data storage math {temp1:"000"} run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 3
data modify storage math temp1 set string storage math temp_float_mul_input1_string 0 2
execute if data storage math {temp1:"00"} run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 2
data modify storage math temp1 set string storage math temp_float_mul_input1_string 0 1
execute if data storage math {temp1:"0"} run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 1
data modify storage math temp1 set string storage math temp_float_mul_input2_string 0 4
execute if data storage math {temp1:"0000"} run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4
data modify storage math temp1 set string storage math temp_float_mul_input2_string 0 3
execute if data storage math {temp1:"000"} run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 3
data modify storage math temp1 set string storage math temp_float_mul_input2_string 0 2
execute if data storage math {temp1:"00"} run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 2
data modify storage math temp1 set string storage math temp_float_mul_input2_string 0 1
execute if data storage math {temp1:"0"} run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 1

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
data modify storage math sstemp1 set value ""
execute if score #float_mul.high_precision.input1.sign int matches -1 run data modify storage math sstemp1 set value "-"
execute store result storage math sstemp2 int 1 run scoreboard players operation #input1_expon int += #input2_expon int

execute store result storage math temp1 int 1 run scoreboard players get #z int
execute store result storage math temp2 int 1 run scoreboard players add #m int 10000
execute store result storage math temp3 int 1 run scoreboard players add #n int 10000
execute store result storage math temp4 int 1 run scoreboard players add #o int 10000
execute store result storage math temp5 int 1 run scoreboard players add #p int 10000
execute store result storage math temp6 int 1 run scoreboard players add #l int 10000
execute store result storage math temp7 int 1 run scoreboard players add #h int 10000
execute store result storage math temp8 int 1 run scoreboard players add #d int 10000

data modify storage math temp2 set string storage math temp2 1
data modify storage math temp3 set string storage math temp3 1
data modify storage math temp4 set string storage math temp4 1
data modify storage math temp5 set string storage math temp5 1
data modify storage math temp6 set string storage math temp6 1
data modify storage math temp7 set string storage math temp7 1
data modify storage math temp8 set string storage math temp8 1

function large_number:float_mul.high_precision/macro2 with storage math
##############################################
##浮点乘法

data modify storage math float_multiply.input1 set from storage math float_multiply.output
data modify storage math float_multiply.input2 set from storage math temp_taylor_remainder
##高精度浮点乘法

##数值类型转化
# double 转 int数组  考虑到了科学记数法

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

data modify storage math double_to_int.input set from storage math float_multiply.input1

#读数顺序：先读前导零，后读小数点，然后是指数位

data modify storage math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,expon:0s,point:0b,leading_zeros:0b}

#转化为字符串，并仅取前16位
data modify storage math temp1 set string storage math double_to_int.input 0 -1

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
function large_number:exp_e.x/macro6.string_to_double with storage math double_to_int
execute store result score #temp2 int run data get storage math temp3
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

execute store result storage math double_to_int.output.expon short 1.0 run scoreboard players get #double_to_int.expon.1 int

#测试数字是否为0
execute if data storage math double_to_int{input:0.0d} store success storage math double_to_int.output.point byte 0 store result storage math double_to_int.output.leading_zeros byte 0 run data modify storage math double_to_int.output.sign set value 0b


execute store result score #float_mul.high_precision.input1.sign int run data get storage math double_to_int.output.sign
execute store result score #float_mul.high_precision.input1.expon int run data get storage math double_to_int.output.expon
execute store result score #float_mul.high_precision.input1.point int run data get storage math double_to_int.output.point
execute store result score #float_mul.high_precision.input1.leading_zeros int run data get storage math double_to_int.output.leading_zeros


##数值类型转化
# double 转 int数组  考虑到了科学记数法

#正数，负数，0，是科学计数法，非科学计数法，指数是正数，指数是负数，指数是0

data modify storage math double_to_int.input set from storage math float_multiply.input2

#读数顺序：先读前导零，后读小数点，然后是指数位

data modify storage math double_to_int.output set value {math:[I;0,0,0,0],sign:1b,expon:0s,point:0b,leading_zeros:0b}

#转化为字符串，并仅取前16位
data modify storage math temp1 set string storage math double_to_int.input 0 -1

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
function large_number:exp_e.x/macro6.string_to_double with storage math double_to_int
execute store result score #temp2 int run data get storage math temp3
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

execute store result storage math double_to_int.output.expon short 1.0 run scoreboard players get #double_to_int.expon.1 int

#测试数字是否为0
execute if data storage math double_to_int{input:0.0d} store success storage math double_to_int.output.point byte 0 store result storage math double_to_int.output.leading_zeros byte 0 run data modify storage math double_to_int.output.sign set value 0b


execute store result score #float_mul.high_precision.input2.sign int run data get storage math double_to_int.output.sign
execute store result score #float_mul.high_precision.input2.expon int run data get storage math double_to_int.output.expon
execute store result score #float_mul.high_precision.input2.point int run data get storage math double_to_int.output.point
execute store result score #float_mul.high_precision.input2.leading_zeros int run data get storage math double_to_int.output.leading_zeros


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

execute store result storage math temp11 int 1 run scoreboard players operation #temp11 int += #float_mul.high_precision.input1.1 int
execute store result storage math temp12 int 1 run scoreboard players operation #temp12 int += #float_mul.high_precision.input1.2 int
execute store result storage math temp13 int 1 run scoreboard players operation #temp13 int += #float_mul.high_precision.input1.3 int
execute store result storage math temp14 int 1 run scoreboard players operation #temp14 int += #float_mul.high_precision.input1.4 int
execute store result storage math temp21 int 1 run scoreboard players operation #temp21 int += #float_mul.high_precision.input2.1 int
execute store result storage math temp22 int 1 run scoreboard players operation #temp22 int += #float_mul.high_precision.input2.2 int
execute store result storage math temp23 int 1 run scoreboard players operation #temp23 int += #float_mul.high_precision.input2.3 int
execute store result storage math temp24 int 1 run scoreboard players operation #temp24 int += #float_mul.high_precision.input2.4 int

data modify storage math temp11 set string storage math temp11 1
data modify storage math temp12 set string storage math temp12 1
data modify storage math temp13 set string storage math temp13 1
data modify storage math temp14 set string storage math temp14 1
data modify storage math temp21 set string storage math temp21 1
data modify storage math temp22 set string storage math temp22 1
data modify storage math temp23 set string storage math temp23 1
data modify storage math temp24 set string storage math temp24 1

function large_number:float_mul.high_precision/macro1 with storage math

execute if score #float_mul.high_precision.input1.1 int matches 0 run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 if score #float_mul.high_precision.input1.3 int matches 0 run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4
execute if score #float_mul.high_precision.input1.1 int matches 0 if score #float_mul.high_precision.input1.2 int matches 0 if score #float_mul.high_precision.input1.3 int matches 0 if score #float_mul.high_precision.input1.4 int matches 0 run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4

execute if score #float_mul.high_precision.input2.1 int matches 0 run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 if score #float_mul.high_precision.input2.3 int matches 0 run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4
execute if score #float_mul.high_precision.input2.1 int matches 0 if score #float_mul.high_precision.input2.2 int matches 0 if score #float_mul.high_precision.input2.3 int matches 0 if score #float_mul.high_precision.input2.4 int matches 0 run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4

data modify storage math temp1 set string storage math temp_float_mul_input1_string 0 4
execute if data storage math {temp1:"0000"} run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 4
data modify storage math temp1 set string storage math temp_float_mul_input1_string 0 3
execute if data storage math {temp1:"000"} run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 3
data modify storage math temp1 set string storage math temp_float_mul_input1_string 0 2
execute if data storage math {temp1:"00"} run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 2
data modify storage math temp1 set string storage math temp_float_mul_input1_string 0 1
execute if data storage math {temp1:"0"} run data modify storage math temp_float_mul_input1_string set string storage math temp_float_mul_input1_string 1
data modify storage math temp1 set string storage math temp_float_mul_input2_string 0 4
execute if data storage math {temp1:"0000"} run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 4
data modify storage math temp1 set string storage math temp_float_mul_input2_string 0 3
execute if data storage math {temp1:"000"} run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 3
data modify storage math temp1 set string storage math temp_float_mul_input2_string 0 2
execute if data storage math {temp1:"00"} run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 2
data modify storage math temp1 set string storage math temp_float_mul_input2_string 0 1
execute if data storage math {temp1:"0"} run data modify storage math temp_float_mul_input2_string set string storage math temp_float_mul_input2_string 1

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
data modify storage math sstemp1 set value ""
execute if score #float_mul.high_precision.input1.sign int matches -1 run data modify storage math sstemp1 set value "-"
execute store result storage math sstemp2 int 1 run scoreboard players operation #input1_expon int += #input2_expon int

execute store result storage math temp1 int 1 run scoreboard players get #z int
execute store result storage math temp2 int 1 run scoreboard players add #m int 10000
execute store result storage math temp3 int 1 run scoreboard players add #n int 10000
execute store result storage math temp4 int 1 run scoreboard players add #o int 10000
execute store result storage math temp5 int 1 run scoreboard players add #p int 10000
execute store result storage math temp6 int 1 run scoreboard players add #l int 10000
execute store result storage math temp7 int 1 run scoreboard players add #h int 10000
execute store result storage math temp8 int 1 run scoreboard players add #d int 10000

data modify storage math temp2 set string storage math temp2 1
data modify storage math temp3 set string storage math temp3 1
data modify storage math temp4 set string storage math temp4 1
data modify storage math temp5 set string storage math temp5 1
data modify storage math temp6 set string storage math temp6 1
data modify storage math temp7 set string storage math temp7 1
data modify storage math temp8 set string storage math temp8 1

function large_number:float_mul.high_precision/macro2 with storage math
##############################################
execute if score #is- int matches 0 run data modify storage math exp_e^x.output set from storage math float_multiply.output
data modify storage math temp1 set from storage math float_multiply.output

execute if score #is- int matches 1 run function large_number:exp_e.x/input.is-

#特殊值
execute store result score #stemp1 int run data get storage math exp_e^x.input
execute if score #stemp1 int matches 710.. run data modify storage math exp_e^x.output set value 9.99999E400d
execute if score #stemp1 int matches ..-709 run data modify storage math exp_e^x.output set value 0.0d
execute if data storage math exp_e^x{input:1.0d} run data modify storage math exp_e^x.output set value 2.71828182845904523536028747135266249775724709369995d
execute if data storage math exp_e^x{input:0.0d} run data modify storage math exp_e^x.output set value 1.0d
