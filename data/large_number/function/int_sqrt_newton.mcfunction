##牛顿迭代法算开根号四位小数
#输入：scoreboard players set #input.sqrt large_number.int 2
#公式：((n/x₁)+x₁)/2=x₂

#放大输入值，这样把输入值区间钳制在8~10位，可以让牛顿迭代法只需迭代一次便可算很高的精度
scoreboard players operation #inp large_number.int = #input.sqrt large_number.int
execute if score #input.sqrt large_number.int matches 1..9 run scoreboard players operation #inp large_number.int *= 100000000 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #inp large_number.int *= 1000000 const
execute if score #input.sqrt large_number.int matches 1000..99999 run scoreboard players operation #inp large_number.int *= 10000 const
execute if score #input.sqrt large_number.int matches 100000..9999999 run scoreboard players operation #inp large_number.int *= 100 const

#算开方结果的整数部分
execute store result score #sstemp3 large_number.int store result score #output.sqrt large_number.int store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int run scoreboard players operation #output large_number.int = #inp large_number.int
scoreboard players operation #output large_number.int /= 32768 const
execute unless score #inp large_number.int matches 0 run scoreboard players add #output large_number.int 2456
scoreboard players operation #t1 large_number.int /= #output large_number.int
scoreboard players operation #output large_number.int += #t1 large_number.int
scoreboard players operation #output large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #output large_number.int
scoreboard players operation #output large_number.int += #t2 large_number.int
scoreboard players operation #output large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #output large_number.int
scoreboard players operation #output large_number.int += #t3 large_number.int
scoreboard players operation #output large_number.int /= 2 const
scoreboard players operation #inp large_number.int /= #output large_number.int
execute if score #output large_number.int > #inp large_number.int run scoreboard players remove #output large_number.int 1

#除法，竖式除法，输入值*10000/开方结果的整数部分，由于int型开方最大也就46340，适用竖式除法
scoreboard players operation #output.sqrt large_number.int /= #output large_number.int
scoreboard players operation #sstemp3 large_number.int %= #output large_number.int
scoreboard players operation #sstemp3 large_number.int *= 10000 const
scoreboard players operation #sstemp3 large_number.int /= #output large_number.int

#加法，除出来的结果加上被开方数的整数部分，作为牛顿迭代法的分子
scoreboard players operation #output.sqrt large_number.int += #output large_number.int
scoreboard players operation #output.sqrt large_number.int *= 10000 const
scoreboard players operation #output.sqrt large_number.int += #sstemp3 large_number.int

#除以2
scoreboard players operation #output.sqrt large_number.int /= 2 const

#调整数位，把小数部分的长度钳制在四位，不拆了，直接放大一万倍输出，减少计算消耗
execute if score #input.sqrt large_number.int matches 1..9 run scoreboard players operation #output.sqrt large_number.int /= 10000 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #output.sqrt large_number.int /= 1000 const
execute if score #input.sqrt large_number.int matches 1000..99999 run scoreboard players operation #output.sqrt large_number.int /= 100 const
execute if score #input.sqrt large_number.int matches 100000..9999999 run scoreboard players operation #output.sqrt large_number.int /= 10 const
