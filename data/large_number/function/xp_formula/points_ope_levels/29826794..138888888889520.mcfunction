##根据输入的经验总数求经验等级和经验余数
#反向经验公式：[√(72x-55503) +325] / 18 (x≥1758)
#经验公式是个一元二次方程，对其用求根公式反推，然后只保留x≥0的根，得到了这个反向经验公式
#理论上输入值不应大于 2.07526*10^19

#乘法 *72
scoreboard players operation #xp_2.input[0] large_number.int *= 72 const
scoreboard players operation #xp_2.input[1] large_number.int *= 72 const
scoreboard players operation #xp_2.input[2] large_number.int *= 72 const
scoreboard players operation #xp_2.input[3] large_number.int *= 72 const
execute store result score #5.4 large_number.int run scoreboard players operation #xp_2.input[4] large_number.int *= 72 const

scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #xp_2.input[3] large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #xp_2.input[2] large_number.int += #5.3 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #xp_2.input[1] large_number.int += #5.3 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #xp_2.input[-1] large_number.int run scoreboard players operation #xp_2.input[0] large_number.int += #5.3 large_number.int
scoreboard players operation #xp_2.input[-1] large_number.int /= 10000 const

scoreboard players operation #xp_2.input[0] large_number.int %= 10000 const
scoreboard players operation #xp_2.input[1] large_number.int %= 10000 const
scoreboard players operation #xp_2.input[2] large_number.int %= 10000 const
scoreboard players operation #xp_2.input[3] large_number.int %= 10000 const
scoreboard players operation #xp_2.input[4] large_number.int %= 10000 const


#减法 -54215
execute if score #xp_2.input[4] large_number.int matches ..4214 run scoreboard players remove #xp_2.input[3] large_number.int 1
execute if score #xp_2.input[4] large_number.int matches ..4214 run scoreboard players add #xp_2.input[4] large_number.int 10000
scoreboard players remove #xp_2.input[4] large_number.int 4215

execute if score #xp_2.input[3] large_number.int matches ..4 run scoreboard players remove #xp_2.input[2] large_number.int 1
execute if score #xp_2.input[3] large_number.int matches ..4 run scoreboard players add #xp_2.input[3] large_number.int 10000
scoreboard players remove #xp_2.input[3] large_number.int 5

execute if score #xp_2.input[2] large_number.int matches ..-1 run scoreboard players remove #xp_2.input[1] large_number.int 1
execute if score #xp_2.input[2] large_number.int matches ..-1 run scoreboard players add #xp_2.input[2] large_number.int 10000

execute if score #xp_2.input[1] large_number.int matches ..-1 run scoreboard players remove #xp_2.input[0] large_number.int 1
execute if score #xp_2.input[1] large_number.int matches ..-1 run scoreboard players add #xp_2.input[1] large_number.int 10000

execute if score #xp_2.input[0] large_number.int matches ..-1 run scoreboard players remove #xp_2.input[-1] large_number.int 1
execute if score #xp_2.input[0] large_number.int matches ..-1 run scoreboard players add #xp_2.input[0] large_number.int 10000


##开根号

execute unless data storage large_number:math large_sqrt_digit16.input[3] run data remove storage large_number:math large_sqrt_digit16
execute unless data storage large_number:math large_sqrt_digit16.input[3] run data modify storage large_number:math large_sqrt_digit16.input set value [I;0,0,0,0]
data modify storage large_number:math store_large_sqrt_digit16 set from storage large_number:math large_sqrt_digit16
execute store result storage large_number:math large_sqrt_digit16.input[0] int 1 run scoreboard players get #xp_2.input[1] large_number.int
execute store result storage large_number:math large_sqrt_digit16.input[1] int 1 run scoreboard players get #xp_2.input[2] large_number.int
execute store result storage large_number:math large_sqrt_digit16.input[2] int 1 run scoreboard players get #xp_2.input[3] large_number.int
execute store result storage large_number:math large_sqrt_digit16.input[3] int 1 run scoreboard players get #xp_2.input[4] large_number.int

execute store result score #digit1.1 large_number.int run data get storage large_number:math large_sqrt_digit16.input[0]
execute store result score #digit1.2 large_number.int run data get storage large_number:math large_sqrt_digit16.input[1]

execute if score #digit1.1 large_number.int matches 1.. run function large_number:large_sqrt_digit16.if/input/all1_
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 1000.. run function large_number:large_sqrt_digit16.if/input/0_1000_
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 10..999 run function large_number:large_sqrt_digit16.if/input/0_10_

execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int store result score #t4 large_number.int run scoreboard players operation #d2.1 large_number.int = #d1.1 large_number.int
scoreboard players operation #d2.1 large_number.int /= 32768 const
execute unless score #d1.1 large_number.int matches 0 run scoreboard players add #d2.1 large_number.int 2456
scoreboard players operation #t1 large_number.int /= #d2.1 large_number.int
scoreboard players operation #d2.1 large_number.int += #t1 large_number.int
scoreboard players operation #d2.1 large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #d2.1 large_number.int
scoreboard players operation #d2.1 large_number.int += #t2 large_number.int
scoreboard players operation #d2.1 large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #d2.1 large_number.int
scoreboard players operation #d2.1 large_number.int += #t3 large_number.int
scoreboard players operation #d2.1 large_number.int /= 2 const
scoreboard players operation #t4 large_number.int /= #d2.1 large_number.int
execute if score #d2.1 large_number.int > #t4 large_number.int run scoreboard players remove #d2.1 large_number.int 1

execute store result score #6.1 large_number.int run scoreboard players operation #7.1 large_number.int = #d2.1 large_number.int

#估值公式
scoreboard players operation #6.1 large_number.int *= #6.1 large_number.int
scoreboard players operation #d1.1 large_number.int -= #6.1 large_number.int
scoreboard players operation #d1.1 large_number.int *= 10000 const
scoreboard players operation #7.1 large_number.int *= 2 const
scoreboard players add #7.1 large_number.int 1
execute store result score #d3.1 large_number.int run scoreboard players operation #d1.1 large_number.int /= #7.1 large_number.int

#调整最后一位
#目前并不知道这里面的递归是否有可能出现停不下来的情况，所以我选择不用这一段……
#execute if score #digit1.1 large_number.int matches 1000.. if score #large_sqrt16.test16 large_number.int matches 1 run function large_number:large_sqrt_digit16.if/test16/if

#输出
scoreboard players operation #d2.1 large_number.int *= 10000 const
scoreboard players operation #d2.1 large_number.int += #d3.1 large_number.int
execute if score #digit1.1 large_number.int matches 1000.. store result score #xp_2.out_level large_number.int run scoreboard players get #d2.1 large_number.int
execute if score #digit1.1 large_number.int matches 10..999 store result score #xp_2.out_level large_number.int run scoreboard players operation #d2.1 large_number.int /= 10 const
execute if score #digit1.1 large_number.int matches 1..9 store result score #xp_2.out_level large_number.int run scoreboard players operation #d2.1 large_number.int /= 100 const
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 1000.. store result score #xp_2.out_level large_number.int run scoreboard players operation #d2.1 large_number.int /= 100 const
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 10..999 store result score #xp_2.out_level large_number.int run scoreboard players operation #d2.1 large_number.int /= 1000 const

data modify storage large_number:math large_sqrt_digit16 set from storage large_number:math store_large_sqrt_digit16

scoreboard players add #xp_2.out_level large_number.int 325
execute store result storage large_number:math xp_points_ope_levels.output_levels int 1 run scoreboard players operation #xp_2.out_level large_number.int /= 18 const


##把得到的等级数代入经验公式算经验差

#经验公式：y=4.5x^2 -162.5x +2220
#这是对"当经验等级≥32时，升级到下一级的经验为9n-158"求和后+1507得到的，从n=31开始求和

# #4=经验等级的平方
execute store result score #a large_number.int store result score #b large_number.int run scoreboard players operation #c large_number.int = #xp_2.out_level large_number.int
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
execute store result score #6.1 large_number.int store result score #6.2 large_number.int run scoreboard players operation #6.3 large_number.int = #xp_2.out_level large_number.int
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
#这些命令从这里被截断了……
#scoreboard players operation #4.3 large_number.int /= 10 const
#scoreboard players operation #5.4 large_number.int = #4.2 large_number.int
#scoreboard players operation #5.4 large_number.int %= 10 const
#scoreboard players operation #5.4 large_number.int *= 1000 const
#scoreboard players operation #4.3 large_number.int += #5.4 large_number.int
#scoreboard players operation #4.2 large_number.int /= 10 const
#scoreboard players operation #5.4 large_number.int = #4.1 large_number.int
#scoreboard players operation #5.4 large_number.int %= 10 const
#scoreboard players operation #5.4 large_number.int *= 1000 const
#scoreboard players operation #4.2 large_number.int += #5.4 large_number.int
#scoreboard players operation #4.1 large_number.int /= 10 const


#+2220
execute store result score #5.4 large_number.int run scoreboard players add #4.5 large_number.int 2220
scoreboard players operation #5.4 large_number.int /= 10000 const
scoreboard players operation #4.4 large_number.int += #5.4 large_number.int

scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const


#减法，输入值减去算出来的值
execute store result score #xp_2.input[3] large_number.int run data get storage large_number:math xp_points_ope_levels.input[-2]
execute store result score #xp_2.input[4] large_number.int run data get storage large_number:math xp_points_ope_levels.input[-1]


#减法
execute if score #xp_2.input[4] large_number.int < #4.5 large_number.int run scoreboard players remove #xp_2.input[3] large_number.int 1
execute if score #xp_2.input[4] large_number.int < #4.5 large_number.int run scoreboard players add #xp_2.input[4] large_number.int 10000
scoreboard players operation #xp_2.input[4] large_number.int -= #4.5 large_number.int

execute if score #xp_2.input[3] large_number.int < #4.4 large_number.int run scoreboard players remove #xp_2.input[2] large_number.int 1
execute if score #xp_2.input[3] large_number.int < #4.4 large_number.int run scoreboard players add #xp_2.input[3] large_number.int 10000
scoreboard players operation #xp_2.input[3] large_number.int -= #4.4 large_number.int

data modify storage large_number:math xp_points_ope_levels.remaining_points set value [I;0,0,0,0,0]
execute store result storage large_number:math xp_points_ope_levels.remaining_points[3] int 1 run scoreboard players get #xp_2.input[3] large_number.int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players get #xp_2.input[4] large_number.int
