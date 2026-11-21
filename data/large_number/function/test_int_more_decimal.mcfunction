##整型数字的开平方-6~9位小数

#输入
#scoreboard players set #input.sqrt large_number.int 2147483647

#估值公式，根据已知的正整数X，X的平方根的整数部分N，估算A的小数部分Z
#Z≈(X-N^2)/2N
#X越大，估值越精确，因此改进版估值公式，是在X小于九位数的时候把X数位补足到八位或九位，并保持X的数位的奇偶性
#然后根据X先前乘的倍率还原原数，精确度可达四位小数

scoreboard players operation #inp large_number.int = #input.sqrt large_number.int
execute if score #input.sqrt large_number.int matches 1..9 run scoreboard players operation #inp large_number.int *= 100000000 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #inp large_number.int *= 1000000 const
execute if score #input.sqrt large_number.int matches 1000..99999 run scoreboard players operation #inp large_number.int *= 10000 const
execute if score #input.sqrt large_number.int matches 100000..9999999 run scoreboard players operation #inp large_number.int *= 100 const

execute store result score #6.1 large_number.int store result score #8.3 large_number.int store result score #8.4 large_number.int store result score #8.5 large_number.int store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int run scoreboard players operation #output.sqrt large_number.int = #inp large_number.int
scoreboard players operation #output.sqrt large_number.int /= 32768 const
execute unless score #inp large_number.int matches 0 run scoreboard players add #output.sqrt large_number.int 2456
scoreboard players operation #t1 large_number.int /= #output.sqrt large_number.int
scoreboard players operation #output.sqrt large_number.int += #t1 large_number.int
scoreboard players operation #output.sqrt large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #output.sqrt large_number.int
scoreboard players operation #output.sqrt large_number.int += #t2 large_number.int
scoreboard players operation #output.sqrt large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #output.sqrt large_number.int
scoreboard players operation #output.sqrt large_number.int += #t3 large_number.int
scoreboard players operation #output.sqrt large_number.int /= 2 const
scoreboard players operation #inp large_number.int /= #output.sqrt large_number.int
execute if score #output.sqrt large_number.int > #inp large_number.int run scoreboard players remove #output.sqrt large_number.int 1

execute store result score #9.1 large_number.int store result score #8.7 large_number.int store result score #8.1 large_number.int store result score #7.1 large_number.int run scoreboard players operation #6.2 large_number.int = #output.sqrt large_number.int

#估值公式
scoreboard players operation #6.2 large_number.int *= #6.2 large_number.int
scoreboard players operation #6.1 large_number.int -= #6.2 large_number.int
scoreboard players operation #6.1 large_number.int *= 10000 const
scoreboard players operation #9.1 large_number.int *= 2 const
scoreboard players add #9.1 large_number.int 1
execute store result score #8.2 large_number.int run scoreboard players operation #6.1 large_number.int /= #9.1 large_number.int

execute if score #input.sqrt large_number.int matches 0..9 run scoreboard players operation #output.sqrt large_number.int /= 10000 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #output.sqrt large_number.int /= 1000 const
execute if score #input.sqrt large_number.int matches 1000..99999 run scoreboard players operation #output.sqrt large_number.int /= 100 const
execute if score #input.sqrt large_number.int matches 100000..9999999 run scoreboard players operation #output.sqrt large_number.int /= 10 const


##估值公式的二次迭代
#选取前三位小数再次估值

#6.4是数位修正后的小数部分，#inp是数位修正前的被开方数，#7.1是数位修正前的整数部分，#7.2是数位修正前的小数部分，后两个如果用不到可删
execute store result score #10.1 large_number.int run scoreboard players operation #8.2 large_number.int /= 10 const
scoreboard players operation #8.1 large_number.int *= 1000 const
execute store result score #x large_number.int store result score #y large_number.int run scoreboard players operation #8.1 large_number.int += #8.2 large_number.int

#不超过八位的大数的平方

execute store result score #1.3 large_number.int run scoreboard players operation #y large_number.int %= 10000 const
execute store result score #1.2 large_number.int run scoreboard players operation #x large_number.int /= 10000 const

execute store result score #4.4 large_number.int run scoreboard players operation #1.3 large_number.int *= #y large_number.int
scoreboard players operation #1.2 large_number.int *= #y large_number.int
scoreboard players operation #y large_number.int *= #x large_number.int
scoreboard players operation #x large_number.int *= #x large_number.int
scoreboard players operation #y large_number.int += #1.2 large_number.int
scoreboard players operation #4.4 large_number.int /= 10000 const
execute store result score #4.3 large_number.int run scoreboard players operation #y large_number.int += #4.4 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #x large_number.int += #4.3 large_number.int
execute store result score #1.0 large_number.int run scoreboard players operation #4.2 large_number.int /= 10000 const
scoreboard players operation #1.3 large_number.int %= 10000 const
scoreboard players operation #y large_number.int %= 10000 const
scoreboard players operation #x large_number.int %= 10000 const


#取数位修正前的被开方数，然后拆位，数位对应，便于进行大数计算
scoreboard players operation #8.5 large_number.int %= 100 const
scoreboard players operation #8.5 large_number.int *= 100 const
scoreboard players operation #8.4 large_number.int %= 1000000 const
scoreboard players operation #8.4 large_number.int /= 100 const
scoreboard players operation #8.3 large_number.int /= 1000000 const
scoreboard players set #8.6 large_number.int 0

#减法
execute if score #8.6 large_number.int < #1.3 large_number.int run scoreboard players remove #8.5 large_number.int 1
execute if score #8.6 large_number.int < #1.3 large_number.int run scoreboard players add #8.6 large_number.int 10000
scoreboard players operation #8.6 large_number.int -= #1.3 large_number.int

execute if score #8.5 large_number.int < #y large_number.int run scoreboard players remove #8.4 large_number.int 1
execute if score #8.5 large_number.int < #y large_number.int run scoreboard players add #8.5 large_number.int 10000
scoreboard players operation #8.5 large_number.int -= #y large_number.int

execute if score #8.4 large_number.int < #x large_number.int run scoreboard players remove #8.3 large_number.int 1
execute if score #8.4 large_number.int < #x large_number.int run scoreboard players add #8.4 large_number.int 10000
scoreboard players operation #8.4 large_number.int -= #x large_number.int

scoreboard players operation #8.3 large_number.int -= #1.0 large_number.int

#二次迭代的估值公式的分子
scoreboard players operation #8.5 large_number.int *= 100000 const
scoreboard players operation #8.6 large_number.int *= 10 const
scoreboard players operation #8.5 large_number.int += #8.6 large_number.int

#注释掉的这两句是扔掉了估值公式二次迭代的分母的小数部分
#scoreboard players operation #8.7 large_number.int *= 1000 const
#scoreboard players operation #8.7 large_number.int += #8.2 large_number.int
scoreboard players operation #8.7 large_number.int *= 2 const
scoreboard players add #8.7 large_number.int 1

#分别对应放大后的二次迭代的估值公式分子和分母，得数位修正前的被开方数的开方结果的4~6位小数
scoreboard players operation #8.5 large_number.int /= #8.7 large_number.int

# #8.2是前三位，8.5是后四位，7.1是数位修正前的整数。#inp是数位修正前的被开方数，10.1是1~7位
scoreboard players operation #10.1 large_number.int *= 10000 const
scoreboard players operation #10.1 large_number.int += #8.5 large_number.int

execute if score #input.sqrt large_number.int matches 1..9 run scoreboard players operation #10.1 large_number.int /= 100 const
execute if score #input.sqrt large_number.int matches 1..9 run scoreboard players operation #7.1 large_number.int %= 10000 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #10.1 large_number.int /= 10 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #7.1 large_number.int %= 1000 const
execute if score #input.sqrt large_number.int matches 1000..99999 run scoreboard players operation #7.1 large_number.int %= 100 const
execute if score #input.sqrt large_number.int matches 100000..9999999 run scoreboard players operation #7.1 large_number.int %= 10 const

execute unless score #input.sqrt large_number.int matches 1..9999999 run scoreboard players set #7.1 large_number.int 0

execute if score #input.sqrt large_number.int matches 1..9 run scoreboard players operation #7.1 large_number.int *= 100000 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #7.1 large_number.int *= 1000000 const
execute unless score #input.sqrt large_number.int matches 1..999 run scoreboard players operation #7.1 large_number.int *= 10000000 const
execute store result score #output.decimal large_number.int run scoreboard players operation #7.1 large_number.int += #10.1 large_number.int

#被开方数1~5位时，开方结果保留9位小数
#被开方数6~7位时，开方结果保留8位小数
#被开方数8~10位时，开方结果保留7位小数
#如果保留小数位数不足期望的位数，则读数时应在数的前面补0补足数位

#通常求得的最后一位小数会有稍许的精度损失
