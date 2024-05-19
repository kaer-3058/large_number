#经验公式：y=4.5x^2 -162.5x +2099
#这是对"当经验等级≥32时，升级到下一级的经验为9n-158"求和后+1507得到的，从n=32开始求和，一直加到x-1

# #4=经验等级的平方
execute store result score #a int store result score #b int run scoreboard players operation #c int = #xp_formula.levels int
execute store result score #6.3 int store result score #1.1 int store result score #1.2 int store result score #1.3 int run scoreboard players operation #c int %= 10000 const
scoreboard players operation #b int %= 100000000 const
execute store result score #6.2 int store result score #2.1 int store result score #2.2 int store result score #2.3 int run scoreboard players operation #b int /= 10000 const
execute store result score #6.1 int store result score #3.1 int store result score #3.2 int store result score #3.3 int run scoreboard players operation #a int /= 100000000 const

execute store result score #5.4 int store result score #4.5 int run scoreboard players operation #1.3 int *= #c int
execute store result score #4.4 int run scoreboard players operation #1.2 int *= #b int
execute store result score #4.3 int run scoreboard players operation #1.1 int *= #a int
scoreboard players operation #2.3 int *= #c int
scoreboard players operation #2.2 int *= #b int
execute store result score #4.2 int run scoreboard players operation #2.1 int *= #a int
scoreboard players operation #3.3 int *= #c int
scoreboard players operation #3.2 int *= #b int
execute store result score #4.1 int run scoreboard players operation #3.1 int *= #a int
scoreboard players operation #4.4 int += #2.3 int
scoreboard players operation #4.3 int += #2.2 int
scoreboard players operation #4.3 int += #3.3 int
scoreboard players operation #4.2 int += #3.2 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
scoreboard players operation #4.1 int += #5.1 int

scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const


#*4.5
execute store result score #5.4 int run scoreboard players operation #4.5 int *= 45 const
scoreboard players operation #4.4 int *= 45 const
scoreboard players operation #4.3 int *= 45 const
scoreboard players operation #4.2 int *= 45 const
scoreboard players operation #4.1 int *= 45 const
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
scoreboard players operation #4.1 int += #5.1 int

scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const


# *162.5
execute store result score #6.1 int store result score #6.2 int run scoreboard players operation #6.3 int = #xp_formula.levels int
scoreboard players operation #6.3 int %= 10000 const
scoreboard players operation #6.2 int %= 100000000 const
scoreboard players operation #6.2 int /= 10000 const
scoreboard players operation #6.1 int /= 100000000 const
execute store result score #6.-1 int run scoreboard players set #6.0 int 0

execute store result score #5.3 int run scoreboard players operation #6.3 int *= 1625 const
scoreboard players operation #6.2 int *= 1625 const
scoreboard players operation #6.1 int *= 1625 const
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #6.2 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #6.1 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
execute store result score #5.0 int run scoreboard players operation #6.0 int += #5.1 int
scoreboard players operation #5.0 int /= 10000 const
scoreboard players operation #6.-1 int += #5.0 int

scoreboard players operation #6.3 int %= 10000 const
scoreboard players operation #6.2 int %= 10000 const
scoreboard players operation #6.1 int %= 10000 const
scoreboard players operation #6.0 int %= 10000 const


#减法, #4-#6
execute if score #4.5 int < #6.3 int run scoreboard players remove #4.4 int 1
execute if score #4.5 int < #6.3 int run scoreboard players add #4.5 int 10000
scoreboard players operation #4.5 int -= #6.3 int

execute if score #4.4 int < #6.2 int run scoreboard players remove #4.3 int 1
execute if score #4.4 int < #6.2 int run scoreboard players add #4.4 int 10000
scoreboard players operation #4.4 int -= #6.2 int

execute if score #4.3 int < #6.1 int run scoreboard players remove #4.2 int 1
execute if score #4.3 int < #6.1 int run scoreboard players add #4.3 int 10000
scoreboard players operation #4.3 int -= #6.1 int

execute if score #4.2 int < #6.0 int run scoreboard players remove #4.1 int 1
execute if score #4.2 int < #6.0 int run scoreboard players add #4.2 int 10000
scoreboard players operation #4.2 int -= #6.0 int

scoreboard players operation #4.1 int -= #6.-1 int


# /10
scoreboard players operation #4.5 int /= 10 const
scoreboard players operation #5.4 int = #4.4 int
scoreboard players operation #5.4 int %= 10 const
scoreboard players operation #5.4 int *= 1000 const
scoreboard players operation #4.5 int += #5.4 int
scoreboard players operation #4.4 int /= 10 const
scoreboard players operation #5.4 int = #4.3 int
scoreboard players operation #5.4 int %= 10 const
scoreboard players operation #5.4 int *= 1000 const
scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #4.3 int /= 10 const
scoreboard players operation #5.4 int = #4.2 int
scoreboard players operation #5.4 int %= 10 const
scoreboard players operation #5.4 int *= 1000 const
scoreboard players operation #4.3 int += #5.4 int
scoreboard players operation #4.2 int /= 10 const
scoreboard players operation #5.4 int = #4.1 int
scoreboard players operation #5.4 int %= 10 const
scoreboard players operation #5.4 int *= 1000 const
scoreboard players operation #4.2 int += #5.4 int
scoreboard players operation #4.1 int /= 10 const


#+2099
execute store result score #5.4 int run scoreboard players add #4.5 int 2099
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
scoreboard players operation #4.1 int += #5.1 int

scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const

