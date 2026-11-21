##浮点除法 - 8位有效数字

#被除数：data modify storage large_number:math float_division.input1 set value 6.71339703E12d
#除数：data modify storage large_number:math float_division.input2 set value 2.0d

#载入除数 \
把浮点数转化为三个记分板，其中sign是符号，#float_int0和#sstempd，如果这两个数不为0，则必须把位数缩放到八位。exp是科学记数法的10的指数。
execute if score #sstemp2 large_number.int matches 30 store success storage large_number:math temp_exp int 10 run scoreboard players set #sstempd large_number.int 10737418
execute if score #sstemp2 large_number.int matches 29 store success storage large_number:math temp_exp int 9 run scoreboard players set #sstempd large_number.int 53687091
execute if score #sstemp2 large_number.int matches 28 store success storage large_number:math temp_exp int 9 run scoreboard players set #sstempd large_number.int 26843545
execute if score #sstemp2 large_number.int matches 27 store success storage large_number:math temp_exp int 9 run scoreboard players set #sstempd large_number.int 13421772
execute if score #sstemp2 large_number.int matches 26 store success storage large_number:math temp_exp int 8 run scoreboard players set #sstempd large_number.int 67108864
execute if score #sstemp2 large_number.int matches 25 store success storage large_number:math temp_exp int 8 run scoreboard players set #sstempd large_number.int 33554432
execute if score #sstemp2 large_number.int matches 24 store success storage large_number:math temp_exp int 8 run scoreboard players set #sstempd large_number.int 16777216
execute if score #sstemp2 large_number.int matches 23 store success storage large_number:math temp_exp int 7 run scoreboard players set #sstempd large_number.int 83886080
execute if score #sstemp2 large_number.int matches 22 store success storage large_number:math temp_exp int 7 run scoreboard players set #sstempd large_number.int 41943040
execute if score #sstemp2 large_number.int matches 21 store success storage large_number:math temp_exp int 7 run scoreboard players set #sstempd large_number.int 20971520
execute if score #sstemp2 large_number.int matches 20 store success storage large_number:math temp_exp int 7 run scoreboard players set #sstempd large_number.int 10485760
execute if score #sstemp2 large_number.int matches 19 store success storage large_number:math temp_exp int 6 run scoreboard players set #sstempd large_number.int 52428800
execute if score #sstemp2 large_number.int matches 18 store success storage large_number:math temp_exp int 6 run scoreboard players set #sstempd large_number.int 26214400
execute if score #sstemp2 large_number.int matches 17 store success storage large_number:math temp_exp int 6 run scoreboard players set #sstempd large_number.int 13107200
execute if score #sstemp2 large_number.int matches 16 store success storage large_number:math temp_exp int 5 run scoreboard players set #sstempd large_number.int 65536000
execute if score #sstemp2 large_number.int matches 15 store success storage large_number:math temp_exp int 5 run scoreboard players set #sstempd large_number.int 32768000
execute if score #sstemp2 large_number.int matches 14 store success storage large_number:math temp_exp int 5 run scoreboard players set #sstempd large_number.int 16384000
execute if score #sstemp2 large_number.int matches 13 store success storage large_number:math temp_exp int 4 run scoreboard players set #sstempd large_number.int 81920000
execute if score #sstemp2 large_number.int matches 12 store success storage large_number:math temp_exp int 4 run scoreboard players set #sstempd large_number.int 40960000
execute if score #sstemp2 large_number.int matches 11 store success storage large_number:math temp_exp int 4 run scoreboard players set #sstempd large_number.int 20480000
execute if score #sstemp2 large_number.int matches 10 store success storage large_number:math temp_exp int 4 run scoreboard players set #sstempd large_number.int 10240000
execute if score #sstemp2 large_number.int matches 9 store success storage large_number:math temp_exp int 3 run scoreboard players set #sstempd large_number.int 51200000
execute if score #sstemp2 large_number.int matches 8 store success storage large_number:math temp_exp int 3 run scoreboard players set #sstempd large_number.int 25600000
execute if score #sstemp2 large_number.int matches 7 store success storage large_number:math temp_exp int 3 run scoreboard players set #sstempd large_number.int 12800000
execute if score #sstemp2 large_number.int matches 6 store success storage large_number:math temp_exp int 2 run scoreboard players set #sstempd large_number.int 64000000
execute if score #sstemp2 large_number.int matches 5 store success storage large_number:math temp_exp int 2 run scoreboard players set #sstempd large_number.int 32000000
execute if score #sstemp2 large_number.int matches 4 store success storage large_number:math temp_exp int 2 run scoreboard players set #sstempd large_number.int 16000000
execute if score #sstemp2 large_number.int matches 3 store success storage large_number:math temp_exp int 1 run scoreboard players set #sstempd large_number.int 80000000
execute if score #sstemp2 large_number.int matches 2 store success storage large_number:math temp_exp int 1 run scoreboard players set #sstempd large_number.int 40000000
execute if score #sstemp2 large_number.int matches 1 store success storage large_number:math temp_exp int 1 run scoreboard players set #sstempd large_number.int 20000000
execute if score #sstemp2 large_number.int matches 0 store success storage large_number:math temp_exp int 1 run scoreboard players set #sstempd large_number.int 10000000

execute store result score #Divisor_float_exp large_number.int run data get storage large_number:math temp_exp

#载入被除数
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math float_division.input1
function large_number:float_nbt_to_score/start
scoreboard players operation #float_int0 large_number.int *= 10 const

#计算结果前后4位精度
scoreboard players operation #sstemp0 large_number.int = #sstempd large_number.int
scoreboard players operation #sstempd large_number.int /= 25 const
scoreboard players operation #sstemp0 large_number.int %= 25 const
scoreboard players operation #sstemp1 large_number.int = #float_int0 large_number.int
scoreboard players operation #float_int0 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #float_int1 large_number.int = #sstemp1 large_number.int
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int += #sstemp1 large_number.int
scoreboard players operation #float_int1 large_number.int %= #sstempd large_number.int
scoreboard players operation #float_int1 large_number.int *= 25 const
scoreboard players operation #sstemp2 large_number.int = #sstemp0 large_number.int
scoreboard players operation #sstemp2 large_number.int *= #float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int -= #sstemp2 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #sstemp1 large_number.int = #float_int1 large_number.int
scoreboard players operation #float_int1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int1 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int1 large_number.int += #sstemp1 large_number.int
scoreboard players operation #float_int0 large_number.int *= 10000 const
scoreboard players operation #float_int0 large_number.int += #float_int1 large_number.int

#对齐小数点
execute if score #float_int0 large_number.int matches 100000000.. run scoreboard players add #float_exp large_number.int 1

#符号位
#scoreboard players operation #float_sign large_number.int *= #Divisor_float_sign large_number.int
#不要再犯这种忘了重置浮点变量的错误了 \
 - 2026.1.9 18:03 周五休息，在烟台某出租屋内

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign large_number.int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 large_number.int
function large_number:division/float/macro2 with storage large_number:math
data modify storage large_number:math float_division.output set from storage large_number:math q0

#execute if score #Divisor_float_int0 large_number.int matches 0 run data modify storage large_number:math float_division.output set value 1.79769313486231580793728971405E308d
