##牛顿迭代法算开根号四位小数
#输入：scoreboard players set input.sqrt int 2
#公式：((n/x₁)+x₁)/2=x₂

#放大输入值，这样把输入值区间钳制在8~10位，可以让牛顿迭代法只需迭代一次便可算很高的精度
scoreboard players operation #inp int = input.sqrt int
execute if score input.sqrt int matches 1..9 run scoreboard players operation #inp int *= 100000000 const
execute if score input.sqrt int matches 10..999 run scoreboard players operation #inp int *= 1000000 const
execute if score input.sqrt int matches 1000..99999 run scoreboard players operation #inp int *= 10000 const
execute if score input.sqrt int matches 100000..9999999 run scoreboard players operation #inp int *= 100 const

#算开方结果的整数部分
execute store result score #sstemp3 int store result score output.sqrt int store result score #t1 int store result score #t2 int store result score #t3 int run scoreboard players operation #output int = #inp int
scoreboard players operation #output int /= 32768 const
execute unless score #inp int matches 0 run scoreboard players add #output int 2456
scoreboard players operation #t1 int /= #output int
scoreboard players operation #output int += #t1 int
scoreboard players operation #output int /= 2 const
scoreboard players operation #t2 int /= #output int
scoreboard players operation #output int += #t2 int
scoreboard players operation #output int /= 2 const
scoreboard players operation #t3 int /= #output int
scoreboard players operation #output int += #t3 int
scoreboard players operation #output int /= 2 const
scoreboard players operation #inp int /= #output int
execute if score #output int > #inp int run scoreboard players remove #output int 1

#除法，竖式除法，输入值*10000/开方结果的整数部分，由于int型开方最大也就46340，适用竖式除法
scoreboard players operation output.sqrt int /= #output int
scoreboard players operation #sstemp3 int %= #output int
scoreboard players operation #sstemp3 int *= 10000 const
scoreboard players operation #sstemp3 int /= #output int

#加法，除出来的结果加上被开方数的整数部分，作为牛顿迭代法的分子
scoreboard players operation output.sqrt int += #output int
scoreboard players operation output.sqrt int *= 10000 const
scoreboard players operation output.sqrt int += #sstemp3 int

#除以2
scoreboard players operation output.sqrt int /= 2 const

#调整数位，把小数部分的长度钳制在四位，不拆了，直接放大一万倍输出，减少计算消耗
execute if score input.sqrt int matches 1..9 run scoreboard players operation output.sqrt int /= 10000 const
execute if score input.sqrt int matches 10..999 run scoreboard players operation output.sqrt int /= 1000 const
execute if score input.sqrt int matches 1000..99999 run scoreboard players operation output.sqrt int /= 100 const
execute if score input.sqrt int matches 100000..9999999 run scoreboard players operation output.sqrt int /= 10 const
