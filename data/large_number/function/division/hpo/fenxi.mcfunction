#此算法来自小豆的数学库
#math:hpo/float/_div

#这是目前所有高精度除法的核心，算法著作人：小豆 https://github.com/xiaodou8593

scoreboard players operation #float_int0 large_number.int *= 10 const
scoreboard players operation #B_hight large_number.int = #Divisor_float_int0 large_number.int

#对b以25进制拆分高位和低位，选25和40是把10000倍率拆开了，1000=25*40*10
scoreboard players operation #B_low large_number.int = #B_hight large_number.int
scoreboard players operation #B_hight large_number.int /= 25 const
scoreboard players operation #B_low large_number.int %= 25 const

#b的低位比较小，因此先忽略，直接对高位作除法，现在#float_int0就是除以高位的商，A'就是余数，分别扩大40倍
#float_int0 ≈ A*10000/b，前四位精度，但是比预期的值较小
scoreboard players operation #A' large_number.int = #float_int0 large_number.int
scoreboard players operation #float_int0 large_number.int /= #B_hight large_number.int
scoreboard players operation #float_int0 large_number.int *= 40 const
scoreboard players operation #A' large_number.int %= #B_hight large_number.int
scoreboard players operation #A' large_number.int *= 40 const

#前四位精度修正算法 \
在数论里，进行整除时为避免数据丢失，通常把倍率拆分。 \
比如要取A/b的前四位小数，就是要计算A*10000//B，一般不直接计算这个式子，取10*m*n=10000 \
有整除的估计式子为A//(b//n)*m，得到的值比A*10000//B小 \
设c=B//n，则误差 = (A*10)%c*m//c
scoreboard players operation #float_int1 large_number.int = #A' large_number.int
scoreboard players operation #A' large_number.int /= #B_hight large_number.int
scoreboard players operation #float_int0 large_number.int += #A' large_number.int


scoreboard players operation #float_int1 large_number.int %= #B_hight large_number.int
scoreboard players operation #float_int1 large_number.int *= 25 const
scoreboard players operation #B_low' large_number.int = #B_low large_number.int
scoreboard players operation #B_low' large_number.int *= #float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int -= #B_low' large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const

scoreboard players operation #A' large_number.int = #float_int1 large_number.int
scoreboard players operation #float_int1 large_number.int /= #B_hight large_number.int
scoreboard players operation #float_int1 large_number.int *= 40 const
scoreboard players operation #A' large_number.int %= #B_hight large_number.int
scoreboard players operation #A' large_number.int *= 40 const
scoreboard players operation #A' large_number.int /= #B_hight large_number.int
scoreboard players operation #float_int1 large_number.int += #A' large_number.int
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
