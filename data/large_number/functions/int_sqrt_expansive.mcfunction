##整型数字的开平方-四位小数

#输入
#scoreboard players set input.sqrt int 2147483647

#估值算法，根据已知的正整数X，X的平方根的整数部分N，估算A的小数部分Z
#Z≈(X-N^2)/(2N+1)
#X越大，估值越精确，因此改进版估值算法，是在X小于九位数的时候把X数位补到八位或九位
#然后根据X先前乘的倍率还原原数，精确度可达前四位小数

#感谢伊桑对此算法的改进

execute store result score #6.1 int run scoreboard players operation #inp int = input.sqrt int
execute if score input.sqrt int matches 1..9 store result score #6.1 int run scoreboard players operation #inp int *= 100000000 const
execute if score input.sqrt int matches 10..999 store result score #6.1 int run scoreboard players operation #inp int *= 1000000 const
execute if score input.sqrt int matches 1000..99999 store result score #6.1 int run scoreboard players operation #inp int *= 10000 const
execute if score input.sqrt int matches 100000..9999999 store result score #6.1 int run scoreboard players operation #inp int *= 100 const

execute store result score #1.0 int store result score #1.1 int run scoreboard players operation output.sqrt int = #inp int
execute if score #inp int matches 1..329475 run function large_number:simple_int_sqrt_range/int_sqrt/0
execute if score #inp int matches 329476..18688328 run function large_number:simple_int_sqrt_range/1
execute if score #inp int matches 18688329..533609999 run function large_number:simple_int_sqrt_range/2
execute if score #inp int matches 533610000.. run function large_number:simple_int_sqrt_range/3
scoreboard players operation #1.0 int /= output.sqrt int
scoreboard players operation output.sqrt int += #1.0 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #1.1 int /= output.sqrt int
scoreboard players operation output.sqrt int += #1.1 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation output.sqrt int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > #inp int run scoreboard players remove output.sqrt int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < #inp int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add output.sqrt int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > #inp int run scoreboard players remove output.sqrt int 1

execute store result score #7.1 int store result score #6.5 int store result score #6.3 int run scoreboard players operation #6.2 int = output.sqrt int

#估值算法
scoreboard players operation #6.2 int *= #6.2 int
scoreboard players operation #6.1 int -= #6.2 int
scoreboard players operation #6.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
scoreboard players operation #6.1 int /= #7.1 int

execute if score input.sqrt int matches 1..9 run function large_number:int_sqrt_scb_tree/int_sqrt_expansive/1-9
execute if score input.sqrt int matches 10..999 run function large_number:int_sqrt_scb_tree/int_sqrt_expansive/10-999
execute if score input.sqrt int matches 1000..99999 run function large_number:int_sqrt_scb_tree/int_sqrt_expansive/1000-99999
execute if score input.sqrt int matches 100000..9999999 run function large_number:int_sqrt_scb_tree/int_sqrt_expansive/100000-9999999
execute if score input.sqrt int matches 1..9999999 run scoreboard players operation #6.5 int *= 10000 const
execute if score input.sqrt int matches 1..9999999 store result score output.dicimal int run scoreboard players operation #6.5 int += #6.1 int

execute unless score input.sqrt int matches 1..9999999 run scoreboard players operation output.dicimal int = #6.1 int


#被开方数1位时，开方结果保留8位小数
#被开方数2~3位时，开方结果保留7位小数
#被开方数4~5位时，开方结果保留6位小数
#被开方数6~7位时，开方结果保留5位小数
#被开方数8~10位时，开方结果保留4位小数

#如果保留小数位数不足期望的位数，则读数时应在数的前面补0补足数位
