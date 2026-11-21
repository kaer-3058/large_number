##新架构的double/float型数值开方
#基础57条命令，如果输入的是科学记数法则加12条，如果选择精度增加四位则加11条，最多80条命令

#输入：data modify storage large_number:math double_sqrt.input set value 0.0d
#精度增加四位：scoreboard players set #New_double_sqrt.decimal_add large_number.int 1

#新架构的变化：
#1.取数的数位不再是最多取前16位，而是最多取前10位
#2.开方方式采用了int开方，而不是10~16位整数开方
#3.double转int用了函数宏，而不是逐位拆字符+穷举

data modify storage large_number:math double_sqrt.output set value {double_sci:0.0d}

#转化为字符串
data modify storage large_number:math temp1 set string storage large_number:math double_sqrt.input 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #double.expon large_number.int run function large_number:new_double_ope/macro1.cut_math with storage large_number:math

#double取为int
execute store result score #store_ds_inp large_number.int store result score #double_sqrt.int_inp large_number.int run data get storage large_number:math temp2
execute if score #double_sqrt.int_inp large_number.int matches 0..9 store result score #double_sqrt.int_inp large_number.int run data get storage large_number:math temp2 100000000
execute if score #double_sqrt.int_inp large_number.int matches 10..999 store result score #double_sqrt.int_inp large_number.int run data get storage large_number:math temp2 1000000
execute if score #double_sqrt.int_inp large_number.int matches 1000..99999 store result score #double_sqrt.int_inp large_number.int run data get storage large_number:math temp2 10000
execute if score #double_sqrt.int_inp large_number.int matches 100000..9999999 store result score #double_sqrt.int_inp large_number.int run data get storage large_number:math temp2 100
execute store result score #stemp5 large_number.int run data get storage large_number:math temp2 10
execute if score #stemp5 large_number.int matches 0 store result score #double_sqrt.int_inp large_number.int run data get storage large_number:math temp2 10000000000
scoreboard players operation #stemp1 large_number.int = #double.expon large_number.int
scoreboard players operation #stemp1 large_number.int %= 2 const
execute if score #is_XXEXX large_number.int matches 1 if score #stemp1 large_number.int matches 1 store result score #double_sqrt.int_inp large_number.int run data get storage large_number:math temp2 10000000


##int开方
scoreboard players operation #inp large_number.int = #double_sqrt.int_inp large_number.int

execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int store result score #X large_number.int run scoreboard players operation #double_sqrt.int_output large_number.int = #inp large_number.int
scoreboard players operation #double_sqrt.int_output large_number.int /= 32768 const
execute unless score #inp large_number.int matches 0 run scoreboard players add #double_sqrt.int_output large_number.int 2456
scoreboard players operation #t1 large_number.int /= #double_sqrt.int_output large_number.int
scoreboard players operation #double_sqrt.int_output large_number.int += #t1 large_number.int
scoreboard players operation #double_sqrt.int_output large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #double_sqrt.int_output large_number.int
scoreboard players operation #double_sqrt.int_output large_number.int += #t2 large_number.int
scoreboard players operation #double_sqrt.int_output large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #double_sqrt.int_output large_number.int
scoreboard players operation #double_sqrt.int_output large_number.int += #t3 large_number.int
scoreboard players operation #double_sqrt.int_output large_number.int /= 2 const

execute if score #New_double_sqrt.decimal_add large_number.int matches 1 run function large_number:new_double_ope/double_add_4
execute unless score #New_double_sqrt.decimal_add large_number.int matches 1 run scoreboard players operation #double_sqrt.int_output large_number.int *= 10000 const


#处理开方结果的指数
scoreboard players set #-sign large_number.int 0
execute store success score #-sign large_number.int if score #double.expon large_number.int matches ..-1 run scoreboard players operation #double.expon large_number.int *= -1 const

scoreboard players operation #temp3 large_number.int = #double.expon large_number.int
scoreboard players operation #temp3 large_number.int %= 2 const
execute if score #temp3 large_number.int matches 1 unless score #-sign large_number.int matches 1 run scoreboard players remove #double.expon large_number.int 1
execute if score #temp3 large_number.int matches 1 if score #-sign large_number.int matches 1 run scoreboard players add #double.expon large_number.int 1
scoreboard players operation #double.expon large_number.int /= 2 const
execute if score #-sign large_number.int matches 1 run scoreboard players operation #double.expon large_number.int *= -1 const

execute store result storage large_number:math temp_expon int 1 run scoreboard players get #double.expon large_number.int

#根据输入的double整数部分的位数调整结果
execute store result storage large_number:math temp1 double 1 run scoreboard players get #double_sqrt.int_output large_number.int
execute if score #store_ds_inp large_number.int matches 0..9 store result storage large_number:math temp1 double 0.00000001 run scoreboard players get #double_sqrt.int_output large_number.int
execute if score #store_ds_inp large_number.int matches 10..999 store result storage large_number:math temp1 double 0.0000001 run scoreboard players get #double_sqrt.int_output large_number.int
execute if score #store_ds_inp large_number.int matches 1000..99999 store result storage large_number:math temp1 double 0.000001 run scoreboard players get #double_sqrt.int_output large_number.int
execute if score #store_ds_inp large_number.int matches 100000..9999999 store result storage large_number:math temp1 double 0.00001 run scoreboard players get #double_sqrt.int_output large_number.int
execute if score #stemp5 large_number.int matches 0 store result storage large_number:math temp1 double 0.000000001 run scoreboard players get #double_sqrt.int_output large_number.int
execute if score #is_XXEXX large_number.int matches 1 if score #stemp1 large_number.int matches 1 store result storage large_number:math temp1 double 0.0000001 run scoreboard players get #double_sqrt.int_output large_number.int

#最终输出
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
function large_number:new_double_ope/macro2.output with storage large_number:math
