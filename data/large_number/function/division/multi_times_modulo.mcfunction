##12位有效数值的10进制浮点除法

#被除数
#float_sign large_number.int (符号，可选：-1，0，1，分别表示负号，0，正号)
#float_int0 large_number.int (输入值的前八位有效数字。取值为10000000~99999999或0)
#float_exp large_number.int (指数，范围是全int)

#除数
#Divisor_float_sign large_number.int (符号，可选：-1，0，1，分别表示负号，0，正号)
#Divisor_float_int0 large_number.int (输入值的前八位有效数字。取值为10000000~99999999或0)
#Divisor_float_exp large_number.int (指数，范围是全int)

#商：
#float_sign large_number.int (符号)
#float_int0 large_number.int (前八位) + #float_int1 large_number.int(九~十二位)
#float_exp large_number.int (指数)

#示例：
#set #float_sign large_number.int 1
#set #float_int0 large_number.int 44553375
#set #float_exp large_number.int 23
#则表示的数为: 1*0.44553375*10^23

scoreboard players operation #float_int0 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int = #float_int0 large_number.int
scoreboard players operation #sstempd large_number.int = #Divisor_float_int0 large_number.int

scoreboard players operation #sstemp0 large_number.int = #sstempd large_number.int
scoreboard players operation #sstempd large_number.int /= 25 const
scoreboard players operation #sstemp0 large_number.int %= 25 const
scoreboard players operation #sstemp1 large_number.int = #float_int0 large_number.int
scoreboard players operation #float_int0 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #float_int2 large_number.int = #sstemp1 large_number.int
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int += #sstemp1 large_number.int
scoreboard players operation #float_int2 large_number.int %= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int *= 25 const
scoreboard players operation #sstemp2 large_number.int = #sstemp0 large_number.int
scoreboard players operation #sstemp2 large_number.int *= #float_int0 large_number.int
scoreboard players operation #float_int2 large_number.int -= #sstemp2 large_number.int
scoreboard players operation #float_int2 large_number.int *= 10 const
scoreboard players operation #sstemp1 large_number.int = #float_int2 large_number.int
scoreboard players operation #float_int2 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int += #sstemp1 large_number.int
scoreboard players operation #float_int0 large_number.int *= 10000 const
scoreboard players operation #float_int0 large_number.int += #float_int2 large_number.int

#对齐小数点
execute if score #float_int0 large_number.int matches 100000000.. run scoreboard players add #float_exp large_number.int 1

scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
execute unless score #float_int0 large_number.int matches 100000000.. run scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
execute unless score #float_int0 large_number.int matches 100000000.. run scoreboard players operation #float_int1 large_number.int *= 10 const

execute if score #float_int0 large_number.int matches 100000000.. run scoreboard players operation #float_int0 large_number.int /= 10 const

scoreboard players operation #stemp1 large_number.int = #float_int1 large_number.int
scoreboard players operation #float_int1 large_number.int /= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp1 large_number.int *= 10 const
scoreboard players operation #stemp2 large_number.int = #stemp1 large_number.int
scoreboard players operation #stemp1 large_number.int /= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp2 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp2 large_number.int *= 10 const
scoreboard players operation #stemp3 large_number.int = #stemp2 large_number.int
scoreboard players operation #stemp2 large_number.int /= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp3 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp3 large_number.int *= 10 const
scoreboard players operation #stemp3 large_number.int /= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int += #stemp1 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int += #stemp2 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int += #stemp3 large_number.int

#符号位
scoreboard players operation #float_sign large_number.int *= #Divisor_float_sign large_number.int

#指数
scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#0的指数校准
execute if score #float_sign large_number.int matches 0 run scoreboard players set #float_exp large_number.int 0
