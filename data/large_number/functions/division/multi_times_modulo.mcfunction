##12位有效数值的10进制浮点除法

#被除数
#float_sign int (符号，可选：-1，0，1，分别表示负号，0，正号)
#float_int0 int (输入值的前八位有效数字。取值为10000000~99999999或0)
#float_exp int (指数，范围是全int)

#除数
#Divisor_float_sign int (符号，可选：-1，0，1，分别表示负号，0，正号)
#Divisor_float_int0 int (输入值的前八位有效数字。取值为10000000~99999999或0)
#Divisor_float_exp int (指数，范围是全int)

#商：
#float_sign int (符号)
#float_int0 int (前八位) + #float_int1 int(九~十二位)
#float_exp int (指数)

#示例：
#set #float_sign int 1
#set #float_int0 int 44553375
#set #float_exp int 23
#则表示的数为: 1*0.44553375*10^23

scoreboard players operation #float_int0 int *= 10 const
scoreboard players operation #float_int1 int = #float_int0 int
scoreboard players operation #sstempd int = #Divisor_float_int0 int

scoreboard players operation #sstemp0 int = #sstempd int
scoreboard players operation #sstempd int /= 25 const
scoreboard players operation #sstemp0 int %= 25 const
scoreboard players operation #sstemp1 int = #float_int0 int
scoreboard players operation #float_int0 int /= #sstempd int
scoreboard players operation #float_int0 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #float_int2 int = #sstemp1 int
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int0 int += #sstemp1 int
scoreboard players operation #float_int2 int %= #sstempd int
scoreboard players operation #float_int2 int *= 25 const
scoreboard players operation #sstemp2 int = #sstemp0 int
scoreboard players operation #sstemp2 int *= #float_int0 int
scoreboard players operation #float_int2 int -= #sstemp2 int
scoreboard players operation #float_int2 int *= 10 const
scoreboard players operation #sstemp1 int = #float_int2 int
scoreboard players operation #float_int2 int /= #sstempd int
scoreboard players operation #float_int2 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int2 int += #sstemp1 int
scoreboard players operation #float_int0 int *= 10000 const
scoreboard players operation #float_int0 int += #float_int2 int

#对齐小数点
execute if score #float_int0 int matches 100000000.. run scoreboard players add #float_exp int 1
execute if score #float_int0 int matches 100000000.. run scoreboard players operation #float_int0 int /= 10 const

scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const

scoreboard players operation #stemp1 int = #float_int1 int
scoreboard players operation #float_int1 int /= #Divisor_float_int0 int
scoreboard players operation #stemp1 int %= #Divisor_float_int0 int
scoreboard players operation #stemp1 int *= 10 const
scoreboard players operation #stemp2 int = #stemp1 int
scoreboard players operation #stemp1 int /= #Divisor_float_int0 int
scoreboard players operation #stemp2 int %= #Divisor_float_int0 int
scoreboard players operation #stemp2 int *= 10 const
scoreboard players operation #stemp3 int = #stemp2 int
scoreboard players operation #stemp2 int /= #Divisor_float_int0 int
scoreboard players operation #stemp3 int %= #Divisor_float_int0 int
scoreboard players operation #stemp3 int *= 10 const
scoreboard players operation #stemp3 int /= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int += #stemp1 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int += #stemp2 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int += #stemp3 int

#符号位
scoreboard players operation #float_sign int *= #Divisor_float_sign int

#指数
scoreboard players operation #float_exp int -= #Divisor_float_exp int

#0的指数校准
execute if score #float_sign int matches 0 run scoreboard players set #float_exp int 0
