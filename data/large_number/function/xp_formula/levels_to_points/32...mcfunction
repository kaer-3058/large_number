#经验公式：y=4.5x^2 -162.5x +2220
#这是对"当经验等级≥32时，升级到下一级的经验为9n-158"求和后+1507得到的，从n=32开始求和，一直加到x-1

# #4=经验等级的平方
execute store result score #a large_number.int store result score #b large_number.int run scoreboard players operation #c large_number.int = #xp_formula.levels large_number.int
execute store result score #6.3 large_number.int store result score #1.1 large_number.int store result score #1.2 large_number.int store result score #1.3 large_number.int run scoreboard players operation #c large_number.int %= 10000 const
scoreboard players operation #b large_number.int %= 100000000 const
execute store result score #6.2 large_number.int store result score #2.1 large_number.int store result score #2.2 large_number.int store result score #2.3 large_number.int run scoreboard players operation #b large_number.int /= 10000 const
execute store result score #6.1 large_number.int store result score #3.1 large_number.int store result score #3.2 large_number.int store result score #3.3 large_number.int run scoreboard players operation #a large_number.int /= 100000000 const

execute store result score #5.4 large_number.int store result score #4.5 large_number.int run scoreboard players operation #1.3 large_number.int *= #c large_number.int
execute store result score #4.4 large_number.int run scoreboard players operation #1.2 large_number.int *= #b large_number.int
execute store result score #4.3 large_number.int run scoreboard players operation #1.1 large_number.int *= #a large_number.int
scoreboard players operation #2.3 large_number.int *= #c large_number.int
scoreboard players operation #2.2 large_number.int *= #b large_number.int
execute store result score #4.2 large_number.int run scoreboard players operation #2.1 large_number.int *= #a large_number.int
scoreboard players operation #3.3 large_number.int *= #c large_number.int
scoreboard players operation #3.2 large_number.int *= #b large_number.int
execute store result score #4.1 large_number.int run scoreboard players operation #3.1 large_number.int *= #a large_number.int
scoreboard players operation #4.4 large_number.int += #2.3 large_number.int
scoreboard players operation #4.3 large_number.int += #2.2 large_number.int
scoreboard players operation #4.3 large_number.int += #3.3 large_number.int
scoreboard players operation #4.2 large_number.int += #3.2 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #4.3 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #4.2 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

scoreboard players operation #4.2 large_number.int %= 10000 const
scoreboard players operation #4.3 large_number.int %= 10000 const
scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const


#*4.5
execute store result score #5.4 large_number.int run scoreboard players operation #4.5 large_number.int *= 45 const
scoreboard players operation #4.4 large_number.int *= 45 const
scoreboard players operation #4.3 large_number.int *= 45 const
scoreboard players operation #4.2 large_number.int *= 45 const
scoreboard players operation #4.1 large_number.int *= 45 const
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #4.3 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #4.2 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

scoreboard players operation #4.2 large_number.int %= 10000 const
scoreboard players operation #4.3 large_number.int %= 10000 const
scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const


# *162.5
execute store result score #6.1 large_number.int store result score #6.2 large_number.int run scoreboard players operation #6.3 large_number.int = #xp_formula.levels large_number.int
scoreboard players operation #6.3 large_number.int %= 10000 const
scoreboard players operation #6.2 large_number.int %= 100000000 const
scoreboard players operation #6.2 large_number.int /= 10000 const
scoreboard players operation #6.1 large_number.int /= 100000000 const
execute store result score #6.-1 large_number.int run scoreboard players set #6.0 large_number.int 0

execute store result score #5.3 large_number.int run scoreboard players operation #6.3 large_number.int *= 1625 const
scoreboard players operation #6.2 large_number.int *= 1625 const
scoreboard players operation #6.1 large_number.int *= 1625 const
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #6.2 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #6.1 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
execute store result score #5.0 large_number.int run scoreboard players operation #6.0 large_number.int += #5.1 large_number.int
scoreboard players operation #5.0 large_number.int /= 10000 const
scoreboard players operation #6.-1 large_number.int += #5.0 large_number.int

scoreboard players operation #6.3 large_number.int %= 10000 const
scoreboard players operation #6.2 large_number.int %= 10000 const
scoreboard players operation #6.1 large_number.int %= 10000 const
scoreboard players operation #6.0 large_number.int %= 10000 const


#减法, #4-#6
execute if score #4.5 large_number.int < #6.3 large_number.int run scoreboard players remove #4.4 large_number.int 1
execute if score #4.5 large_number.int < #6.3 large_number.int run scoreboard players add #4.5 large_number.int 10000
scoreboard players operation #4.5 large_number.int -= #6.3 large_number.int

execute if score #4.4 large_number.int < #6.2 large_number.int run scoreboard players remove #4.3 large_number.int 1
execute if score #4.4 large_number.int < #6.2 large_number.int run scoreboard players add #4.4 large_number.int 10000
scoreboard players operation #4.4 large_number.int -= #6.2 large_number.int

execute if score #4.3 large_number.int < #6.1 large_number.int run scoreboard players remove #4.2 large_number.int 1
execute if score #4.3 large_number.int < #6.1 large_number.int run scoreboard players add #4.3 large_number.int 10000
scoreboard players operation #4.3 large_number.int -= #6.1 large_number.int

execute if score #4.2 large_number.int < #6.0 large_number.int run scoreboard players remove #4.1 large_number.int 1
execute if score #4.2 large_number.int < #6.0 large_number.int run scoreboard players add #4.2 large_number.int 10000
scoreboard players operation #4.2 large_number.int -= #6.0 large_number.int

scoreboard players operation #4.1 large_number.int -= #6.-1 large_number.int


# /10
scoreboard players operation #4.5 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #4.4 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
scoreboard players operation #4.5 large_number.int += #5.4 large_number.int
scoreboard players operation #4.4 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #4.3 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #4.3 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #4.2 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
scoreboard players operation #4.3 large_number.int += #5.4 large_number.int
scoreboard players operation #4.2 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #4.1 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
scoreboard players operation #4.2 large_number.int += #5.4 large_number.int
scoreboard players operation #4.1 large_number.int /= 10 const


#+2220
execute store result score #5.4 large_number.int run scoreboard players add #4.5 large_number.int 2220
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #4.3 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #4.2 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

scoreboard players operation #4.2 large_number.int %= 10000 const
scoreboard players operation #4.3 large_number.int %= 10000 const
scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const

