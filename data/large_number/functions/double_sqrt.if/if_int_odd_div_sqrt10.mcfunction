scoreboard players operation #ds2.1 int *= 10000 const
scoreboard players operation #ds2.1 int += #ds2.2 int

execute if score #ds2.1 int matches 0..9 run scoreboard players operation #ds2.1 int *= 10000000 const
execute if score #ds2.1 int matches 10..99 run scoreboard players operation #ds2.1 int *= 1000000 const
execute if score #ds2.1 int matches 100..999 run scoreboard players operation #ds2.1 int *= 100000 const
execute if score #ds2.1 int matches 1000..9999 run scoreboard players operation #ds2.1 int *= 10000 const
execute if score #ds2.1 int matches 10000..99999 run scoreboard players operation #ds2.1 int *= 1000 const
execute if score #ds2.1 int matches 100000..999999 run scoreboard players operation #ds2.1 int *= 100 const
execute if score #ds2.1 int matches 1000000..9999999 run scoreboard players operation #ds2.1 int *= 10 const

execute store result score #ds3.2 int run scoreboard players operation #ds3.1 int = #ds2.1 int

#设置被除数
execute store result score #float_int0 int run scoreboard players operation #ds3.1 int /= 10000 const
execute store result score #float_int1 int run scoreboard players operation #ds3.2 int %= 10000 const

#设置除数
scoreboard players set #Divisor_float_int0 int 3162
scoreboard players set #Divisor_float_int1 int 2776

##除法

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

scoreboard players operation #ds2.1 int = #float_int0 int
scoreboard players operation #ds2.2 int = #float_int1 int
