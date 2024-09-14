##无穷多位有效数字的除法

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
#storage large_number:math loop_more_more_decimal_base (底数)
#float_exp int (指数)

#有效数字的位数：#loop_more_more_decimal_times int

#示例：
#set #float_sign int 1
#set #float_int0 int 44553375
#set #float_exp int 23
#则表示的数为: 1*0.44553375*10^23

#符号位
scoreboard players operation #float_sign int *= #Divisor_float_sign int

#指数
scoreboard players add #float_exp int 1
scoreboard players operation #float_exp int -= #Divisor_float_exp int

#0的指数校准
execute if score #float_sign int matches 0 run scoreboard players set #float_exp int 0


data modify storage large_number:math loop_more_more_decimal_base set value []
scoreboard players operation #store_float_int0 int = #float_int0 int
scoreboard players operation #stemp1 int = #store_float_int0 int
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #stemp1 int /= #Divisor_float_int0 int
data modify storage large_number:math loop_more_more_decimal_base append from storage large_number:math temp1
execute if score #loop_more_more_decimal_times int matches 2.. run function large_number:division/loop_more_more_decimal/loop
