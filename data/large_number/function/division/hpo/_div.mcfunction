#此算法来自小豆的数学库
#math:hpo/float/_div

#这是目前所有高精度除法的核心，算法著作人：小豆 https://github.com/xiaodou8593

scoreboard players operation #float_int0 large_number.int *= 10 const
scoreboard players operation #sstempd large_number.int = #Divisor_float_int0 large_number.int

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
execute if score #float_int0 large_number.int matches 100000000.. run scoreboard players operation #float_int0 large_number.int /= 10 const

#符号位
scoreboard players operation #float_sign large_number.int *= #Divisor_float_sign large_number.int

#指数
scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#0的指数校准
execute if score #float_sign large_number.int matches 0 run scoreboard players set #float_exp large_number.int 0
