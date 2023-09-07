#此算法来自小豆的数学库
#math:hpo/float/_div

#由万进制节计算除数和被除数
scoreboard players operation #float_int0 int *= 10000 const
scoreboard players operation #float_int0 int += #float_int1 int
scoreboard players operation #float_int0 int *= 10 const
scoreboard players operation #sstempd int = #Divisor_float_int0 int
scoreboard players operation #sstempd int *= 10000 const
scoreboard players operation #sstempd int += #Divisor_float_int1 int

#计算结果前后4位精度
scoreboard players operation #sstemp0 int = #sstempd int
scoreboard players operation #sstempd int /= 25 const
scoreboard players operation #sstemp0 int %= 25 const
scoreboard players operation #sstemp1 int = #float_int0 int
scoreboard players operation #float_int0 int /= #sstempd int
scoreboard players operation #float_int0 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #float_int1 int = #sstemp1 int
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int0 int += #sstemp1 int
scoreboard players operation #float_int1 int %= #sstempd int
scoreboard players operation #float_int1 int *= 25 const
scoreboard players operation #sstemp2 int = #sstemp0 int
scoreboard players operation #sstemp2 int *= #float_int0 int
scoreboard players operation #float_int1 int -= #sstemp2 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #sstemp1 int = #float_int1 int
scoreboard players operation #float_int1 int /= #sstempd int
scoreboard players operation #float_int1 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int1 int += #sstemp1 int

#对齐小数点
execute if score #float_int0 int matches 10000.. run function large_number:division/hpo/div_align

#符号位
scoreboard players operation #float_sign int *= #Divisor_float_sign int

#指数
scoreboard players operation #float_exp int -= #Divisor_float_exp int

#0的指数校准
execute if score #float_sign int matches 0 run scoreboard players set #float_exp int 0
