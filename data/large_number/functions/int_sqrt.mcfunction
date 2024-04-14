##整型数字的开平方-四位小数

#输入：scoreboard players set input.sqrt int 2147483647

#估值算法，根据已知的正整数X，X的平方根的整数部分N，估算A的小数部分Z
#Z≈(X-N^2)/(2N+1)
#X越大，估值越精确，因此改进版估值算法，是在X小于九位数的时候把X数位补到八位或九位
#然后根据X先前乘的倍率还原原数，精确度可达前四位小数

scoreboard players operation #inp int = input.sqrt int
execute if score input.sqrt int matches 1..9 run scoreboard players operation #inp int *= 100000000 const
execute if score input.sqrt int matches 10..999 run scoreboard players operation #inp int *= 1000000 const
execute if score input.sqrt int matches 1000..99999 run scoreboard players operation #inp int *= 10000 const
execute if score input.sqrt int matches 100000..9999999 run scoreboard players operation #inp int *= 100 const

execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #X int run scoreboard players operation output.sqrt int = #inp int
scoreboard players operation output.sqrt int /= 32768 const
execute unless score #inp int matches 0 run scoreboard players add output.sqrt int 2456
scoreboard players operation #t1 int /= output.sqrt int
scoreboard players operation output.sqrt int += #t1 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #t2 int /= output.sqrt int
scoreboard players operation output.sqrt int += #t2 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #t3 int /= output.sqrt int
scoreboard players operation output.sqrt int += #t3 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #inp int /= output.sqrt int
execute if score output.sqrt int > #inp int run scoreboard players remove output.sqrt int 1

execute store result score #2N int run scoreboard players operation #N^2 int = output.sqrt int

#估值算法
scoreboard players operation #N^2 int *= #N^2 int
scoreboard players operation #X int -= #N^2 int
scoreboard players operation #X int *= 10000 const
scoreboard players operation #2N int *= 2 const
scoreboard players add #2N int 1
scoreboard players operation #X int /= #2N int

scoreboard players operation output.sqrt int *= 10000 const
scoreboard players operation output.sqrt int += #X int

execute if score input.sqrt int matches 0..9 run scoreboard players operation output.sqrt int /= 10000 const
execute if score input.sqrt int matches 10..999 run scoreboard players operation output.sqrt int /= 1000 const
execute if score input.sqrt int matches 1000..99999 run scoreboard players operation output.sqrt int /= 100 const
execute if score input.sqrt int matches 100000..9999999 run scoreboard players operation output.sqrt int /= 10 const
