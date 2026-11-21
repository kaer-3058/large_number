##整型数字的开平方-四位小数

#输入：scoreboard players set #input.sqrt large_number.int 2147483647

#估值算法，根据已知的正整数X，X的平方根的整数部分N，估算A的小数部分Z
#Z≈(X-N^2)/(2N+1)
#X越大，估值越精确，因此改进版估值算法，是在X小于九位数的时候把X数位补到八位或九位
#然后根据X先前乘的倍率还原原数，精确度可达前四位小数

scoreboard players operation #inp large_number.int = #input.sqrt large_number.int
execute if score #input.sqrt large_number.int matches 1..9 run scoreboard players operation #inp large_number.int *= 100000000 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #inp large_number.int *= 1000000 const
execute if score #input.sqrt large_number.int matches 1000..99999 run scoreboard players operation #inp large_number.int *= 10000 const
execute if score #input.sqrt large_number.int matches 100000..9999999 run scoreboard players operation #inp large_number.int *= 100 const

execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int store result score #X large_number.int run scoreboard players operation #output.sqrt large_number.int = #inp large_number.int
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

execute store result score #2N large_number.int run scoreboard players operation #N^2 large_number.int = #output.sqrt large_number.int

#估值算法
scoreboard players operation #N^2 large_number.int *= #N^2 large_number.int
scoreboard players operation #X large_number.int -= #N^2 large_number.int
scoreboard players operation #X large_number.int *= 10000 const
scoreboard players operation #2N large_number.int *= 2 const
scoreboard players add #2N large_number.int 1
scoreboard players operation #X large_number.int /= #2N large_number.int

scoreboard players operation #output.sqrt large_number.int *= 10000 const
scoreboard players operation #output.sqrt large_number.int += #X large_number.int

execute if score #input.sqrt large_number.int matches 0..9 run scoreboard players operation #output.sqrt large_number.int /= 10000 const
execute if score #input.sqrt large_number.int matches 10..999 run scoreboard players operation #output.sqrt large_number.int /= 1000 const
execute if score #input.sqrt large_number.int matches 1000..99999 run scoreboard players operation #output.sqrt large_number.int /= 100 const
execute if score #input.sqrt large_number.int matches 100000..9999999 run scoreboard players operation #output.sqrt large_number.int /= 10 const
