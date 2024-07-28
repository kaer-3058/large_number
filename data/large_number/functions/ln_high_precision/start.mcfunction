##高精度自然对数 (全double)
#提高精度失败

#输入值必须为大于等于10000000或小于等于0.0001的double型或float型
#公式：ln(7.45*10^26)=ln(7.45)+26*ln(10)
#ln(7.45)=ln(745/100)=ln(745)-ln(100)
#输入：data modify storage large_number:math ln_high_precision.input set value 8.2184074E307d

#新算法
#1.把输入值的底数和指数拆开
#2.取底数的前九位
#3.把int 型数值以2的幂为界拆分为多个区间，观察底数的前九位属于哪个区间
#4.把底数拆分为(2^a)*b的形式。其中a是整数，b∈[1,2]，取b的前四位小数查表

data modify storage large_number:math temp1 set string storage large_number:math ln_high_precision.input 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation

function large_number:ln_high_precision/craft.1 with storage large_number:math
execute store result storage large_number:math high_precision_stemp4 double 2.30258509299404568401799145 run scoreboard players get #ln_double.expon int 

execute store result score #temp1 int run data get storage large_number:math ln_la_temp3
execute if score #temp1 int matches 0 run function large_number:ln_high_precision/input_is_0
execute if score #temp1 int matches 1..9 store success storage large_number:math high_precision_stemp3 double 18.42068074395236547214393163 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3 100000000
execute if score #temp1 int matches 10..99 store success storage large_number:math high_precision_stemp3 double 16.11809565095831978812594018 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3 10000000
execute if score #temp1 int matches 100..999 store success storage large_number:math high_precision_stemp3 double 13.81551055796427410410794872 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3 1000000
execute if score #temp1 int matches 1000..9999 store success storage large_number:math high_precision_stemp3 double 11.51292546497022842008995727 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3 100000
execute if score #temp1 int matches 10000..99999 store success storage large_number:math high_precision_stemp3 double 9.21034037197618273607196581 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3 10000
execute if score #temp1 int matches 100000..999999 store success storage large_number:math high_precision_stemp3 double 6.90775527898213705205397436 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3 1000
execute if score #temp1 int matches 1000000..9999999 store success storage large_number:math high_precision_stemp3 double 4.60517018598809136803598290 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3 100
execute if score #temp1 int matches 10000000..99999999 store success storage large_number:math high_precision_stemp3 double 2.30258509299404568401799145 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3 10
execute if score #temp1 int matches 100000000.. store success storage large_number:math high_precision_stemp3 double 0 store result score #loga.b.tempinp int run data get storage large_number:math ln_la_temp3

data modify storage large_number:math float_division.input2 set value 1.0d
data modify storage large_number:math sstemp2 set value 0
execute if score #loga.b.tempinp int matches 1073741824..2147483647 store success storage large_number:math sstemp2 int 30 run data modify storage large_number:math float_division.input2 set value 1073741824.0d
execute if score #loga.b.tempinp int matches 536870912..1073741823 store success storage large_number:math sstemp2 int 29 run data modify storage large_number:math float_division.input2 set value 536870912.0d
execute if score #loga.b.tempinp int matches 268435456..536870911 store success storage large_number:math sstemp2 int 28 run data modify storage large_number:math float_division.input2 set value 268435456.0d
execute if score #loga.b.tempinp int matches 134217728..268435455 store success storage large_number:math sstemp2 int 27 run data modify storage large_number:math float_division.input2 set value 134217728.0d
execute if score #loga.b.tempinp int matches 67108864..134217727 store success storage large_number:math sstemp2 int 26 run data modify storage large_number:math float_division.input2 set value 67108864.0d
execute if score #loga.b.tempinp int matches 33554432..67108863 store success storage large_number:math sstemp2 int 25 run data modify storage large_number:math float_division.input2 set value 33554432.0d
execute if score #loga.b.tempinp int matches 16777216..33554431 store success storage large_number:math sstemp2 int 24 run data modify storage large_number:math float_division.input2 set value 16777216.0d
execute if score #loga.b.tempinp int matches 8388608..16777215 store success storage large_number:math sstemp2 int 23 run data modify storage large_number:math float_division.input2 set value 8388608.0d
execute if score #loga.b.tempinp int matches 4194304..8388607 store success storage large_number:math sstemp2 int 22 run data modify storage large_number:math float_division.input2 set value 4194304.0d
execute if score #loga.b.tempinp int matches 2097152..4194303 store success storage large_number:math sstemp2 int 21 run data modify storage large_number:math float_division.input2 set value 2097152.0d
execute if score #loga.b.tempinp int matches 1048576..2097151 store success storage large_number:math sstemp2 int 20 run data modify storage large_number:math float_division.input2 set value 1048576.0d
execute if score #loga.b.tempinp int matches 524288..1048575 store success storage large_number:math sstemp2 int 19 run data modify storage large_number:math float_division.input2 set value 524288.0d
execute if score #loga.b.tempinp int matches 262144..524287 store success storage large_number:math sstemp2 int 18 run data modify storage large_number:math float_division.input2 set value 262144.0d
execute if score #loga.b.tempinp int matches 131072..262143 store success storage large_number:math sstemp2 int 17 run data modify storage large_number:math float_division.input2 set value 131072.0d
execute if score #loga.b.tempinp int matches 65536..131071 store success storage large_number:math sstemp2 int 16 run data modify storage large_number:math float_division.input2 set value 65536.0d
execute if score #loga.b.tempinp int matches 32768..65535 store success storage large_number:math sstemp2 int 15 run data modify storage large_number:math float_division.input2 set value 32768.0d
execute if score #loga.b.tempinp int matches 16384..32767 store success storage large_number:math sstemp2 int 14 run data modify storage large_number:math float_division.input2 set value 16384.0d
execute if score #loga.b.tempinp int matches 8192..16383 store success storage large_number:math sstemp2 int 13 run data modify storage large_number:math float_division.input2 set value 8192.0d
execute if score #loga.b.tempinp int matches 4096..8191 store success storage large_number:math sstemp2 int 12 run data modify storage large_number:math float_division.input2 set value 4096.0d
execute if score #loga.b.tempinp int matches 2048..4095 store success storage large_number:math sstemp2 int 11 run data modify storage large_number:math float_division.input2 set value 2048.0d
execute if score #loga.b.tempinp int matches 1024..2047 store success storage large_number:math sstemp2 int 10 run data modify storage large_number:math float_division.input2 set value 1024.0d
execute if score #loga.b.tempinp int matches 512..1023 store success storage large_number:math sstemp2 int 9 run data modify storage large_number:math float_division.input2 set value 512.0d
execute if score #loga.b.tempinp int matches 256..511 store success storage large_number:math sstemp2 int 8 run data modify storage large_number:math float_division.input2 set value 256.0d
execute if score #loga.b.tempinp int matches 128..255 store success storage large_number:math sstemp2 int 7 run data modify storage large_number:math float_division.input2 set value 128.0d
execute if score #loga.b.tempinp int matches 64..127 store success storage large_number:math sstemp2 int 6 run data modify storage large_number:math float_division.input2 set value 64.0d
execute if score #loga.b.tempinp int matches 32..63 store success storage large_number:math sstemp2 int 5 run data modify storage large_number:math float_division.input2 set value 32.0d
execute if score #loga.b.tempinp int matches 16..31 store success storage large_number:math sstemp2 int 4 run data modify storage large_number:math float_division.input2 set value 16.0d
execute if score #loga.b.tempinp int matches 8..15 store success storage large_number:math sstemp2 int 3 run data modify storage large_number:math float_division.input2 set value 8.0d
execute if score #loga.b.tempinp int matches 4..7 store success storage large_number:math sstemp2 int 2 run data modify storage large_number:math float_division.input2 set value 4.0d
execute if score #loga.b.tempinp int matches 2..3 store success storage large_number:math sstemp2 int 1 run data modify storage large_number:math float_division.input2 set value 2.0d

execute store result storage large_number:math float_division.input1 double 1 run scoreboard players get #loga.b.tempinp int

####################################
##浮点除法

#被除数：data modify storage large_number:math float_division.input1 set value 62.71339703E12d
#除数：data modify storage large_number:math float_division.input2 set value 2.0d

#载入被除数
scoreboard players set #float_sign int 1
data modify storage large_number:math temp1 set string storage large_number:math float_division.input1 0 -1
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run scoreboard players set #float_sign int -1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

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
function large_number:division/float/macro1 with storage large_number:math
scoreboard players operation #float_exp int = #_exp int
execute store result score #float_int0 int run data get storage large_number:math temp1
scoreboard players operation #temp1 int = #float_int0 int
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp2 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math temp1 0 4
data modify storage large_number:math stemp2 set string storage large_number:math temp1 0 3
scoreboard players set #leading_zero int 0
execute if score #temp1 int matches 0 run scoreboard players set #leading_zero int 1
execute if score #temp1 int matches 0 if data storage large_number:math {stemp2:"0.0"} run scoreboard players set #leading_zero int 2
execute if score #temp1 int matches 0 if data storage large_number:math {stemp1:"0.00"} run scoreboard players set #leading_zero int 3
execute if score #leading_zero int matches 3 store result score #float_int0 int run data get storage large_number:math temp1 10000000000
execute if score #leading_zero int matches 3 run scoreboard players remove #float_exp int 2
execute if score #leading_zero int matches 2 store result score #float_int0 int run data get storage large_number:math temp1 1000000000
execute if score #leading_zero int matches 2 run scoreboard players remove #float_exp int 1
execute if score #leading_zero int matches 1 store result score #float_int0 int run data get storage large_number:math temp1 100000000
execute if score #temp1 int matches 1..9 store result score #float_int0 int run data get storage large_number:math temp1 10000000
execute if score #temp1 int matches 1..9 run scoreboard players add #float_exp int 1
execute if score #temp1 int matches 10..99 store result score #float_int0 int run data get storage large_number:math temp1 1000000
execute if score #temp1 int matches 10..99 run scoreboard players add #float_exp int 2
execute if score #temp1 int matches 100..999 store result score #float_int0 int run data get storage large_number:math temp1 100000
execute if score #temp1 int matches 100..999 run scoreboard players add #float_exp int 3
execute if score #temp1 int matches 1000..9999 store result score #float_int0 int run data get storage large_number:math temp1 10000
execute if score #temp1 int matches 1000..9999 run scoreboard players add #float_exp int 4
execute if score #temp1 int matches 10000..99999 store result score #float_int0 int run data get storage large_number:math temp1 1000
execute if score #temp1 int matches 10000..99999 run scoreboard players add #float_exp int 5
execute if score #temp1 int matches 100000..999999 store result score #float_int0 int run data get storage large_number:math temp1 100
execute if score #temp1 int matches 100000..999999 run scoreboard players add #float_exp int 6
execute if score #temp1 int matches 1000000.. store result score #float_int0 int run data get storage large_number:math temp1 10
execute if score #temp1 int matches 1000000.. run scoreboard players add #float_exp int 7

#载入除数
scoreboard players set #Divisor_float_sign int 1
data modify storage large_number:math temp1 set string storage large_number:math float_division.input2 0 -1
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run scoreboard players set #Divisor_float_sign int -1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

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
function large_number:division/float/macro1 with storage large_number:math
scoreboard players operation #Divisor_float_exp int = #_exp int
execute store result score #sstempd int run data get storage large_number:math temp1
scoreboard players operation #temp1 int = #sstempd int
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp2 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math temp1 0 4
data modify storage large_number:math stemp2 set string storage large_number:math temp1 0 3
scoreboard players set #leading_zero int 0
execute if score #temp1 int matches 0 run scoreboard players set #leading_zero int 1
execute if score #temp1 int matches 0 if data storage large_number:math {stemp2:"0.0"} run scoreboard players set #leading_zero int 2
execute if score #temp1 int matches 0 if data storage large_number:math {stemp1:"0.00"} run scoreboard players set #leading_zero int 3
execute if score #leading_zero int matches 3 store result score #sstempd int run data get storage large_number:math temp1 10000000000
execute if score #leading_zero int matches 3 run scoreboard players remove #Divisor_float_exp int 2
execute if score #leading_zero int matches 2 store result score #sstempd int run data get storage large_number:math temp1 1000000000
execute if score #leading_zero int matches 2 run scoreboard players remove #Divisor_float_exp int 1
execute if score #leading_zero int matches 1 store result score #sstempd int run data get storage large_number:math temp1 100000000
execute if score #temp1 int matches 1..9 store result score #sstempd int run data get storage large_number:math temp1 10000000
execute if score #temp1 int matches 1..9 run scoreboard players add #Divisor_float_exp int 1
execute if score #temp1 int matches 10..99 store result score #sstempd int run data get storage large_number:math temp1 1000000
execute if score #temp1 int matches 10..99 run scoreboard players add #Divisor_float_exp int 2
execute if score #temp1 int matches 100..999 store result score #sstempd int run data get storage large_number:math temp1 100000
execute if score #temp1 int matches 100..999 run scoreboard players add #Divisor_float_exp int 3
execute if score #temp1 int matches 1000..9999 store result score #sstempd int run data get storage large_number:math temp1 10000
execute if score #temp1 int matches 1000..9999 run scoreboard players add #Divisor_float_exp int 4
execute if score #temp1 int matches 10000..99999 store result score #sstempd int run data get storage large_number:math temp1 1000
execute if score #temp1 int matches 10000..99999 run scoreboard players add #Divisor_float_exp int 5
execute if score #temp1 int matches 100000..999999 store result score #sstempd int run data get storage large_number:math temp1 100
execute if score #temp1 int matches 100000..999999 run scoreboard players add #Divisor_float_exp int 6
execute if score #temp1 int matches 1000000.. store result score #sstempd int run data get storage large_number:math temp1 10
execute if score #temp1 int matches 1000000.. run scoreboard players add #Divisor_float_exp int 7

scoreboard players operation #float_int0 int *= 10 const

#计算结果4位精度
scoreboard players operation #sstempd int /= 25 const
scoreboard players operation #sstemp1 int = #float_int0 int
scoreboard players operation #float_int0 int /= #sstempd int
scoreboard players operation #float_int0 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int0 int += #sstemp1 int

#对齐小数点
execute if score #float_int0 int matches 10000.. run scoreboard players add #float_exp int 1

#符号位
scoreboard players operation #float_sign int *= #Divisor_float_sign int

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp int -= #Divisor_float_exp int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 int
function large_number:division/float/macro2 with storage large_number:math
#################################################

#四舍五入最后一位查表
execute store result score #temp1 int run data get storage large_number:math float_division.output 100000
scoreboard players operation #temp1 int %= 10 const
execute store result score #temp2 int run data get storage large_number:math float_division.output 10000
execute if score #temp1 int matches 5.. run scoreboard players add #temp2 int 1
execute store result storage large_number:math temp1 int 1 run scoreboard players get #temp2 int
function large_number:ln_high_precision/macro1 with storage large_number:math

execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:ln_high_precision/macro2 with storage large_number:math
