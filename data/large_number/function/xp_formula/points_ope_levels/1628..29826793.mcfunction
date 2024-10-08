##根据输入的经验总数求经验等级和经验余数
#反向经验公式：[√(72x-54215) +325] / 18 (x≥1758)
#经验公式是个一元二次方程，对其用求根公式反推，然后只保留x≥0的根，得到了这个反向经验公式
#理论上输入值不应大于 2.07526*10^19

#乘法 *72
scoreboard players operation #xp_2.input[2] int *= 72 const
scoreboard players operation #xp_2.input[3] int *= 72 const
execute store result score #5.4 int run scoreboard players operation #xp_2.input[4] int *= 72 const

scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #xp_2.input[3] int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
scoreboard players operation #xp_2.input[2] int += #5.3 int

scoreboard players operation #xp_2.input[3] int %= 10000 const
scoreboard players operation #xp_2.input[4] int %= 10000 const


#减法 -54215
execute if score #xp_2.input[4] int matches ..4214 run scoreboard players remove #xp_2.input[3] int 1
execute if score #xp_2.input[4] int matches ..4214 run scoreboard players add #xp_2.input[4] int 10000
scoreboard players remove #xp_2.input[4] int 4215

execute if score #xp_2.input[3] int matches ..4 run scoreboard players remove #xp_2.input[2] int 1
execute if score #xp_2.input[3] int matches ..4 run scoreboard players add #xp_2.input[3] int 10000
scoreboard players remove #xp_2.input[3] int 5

execute if score #xp_2.input[2] int matches ..-1 run scoreboard players remove #xp_2.input[1] int 1
execute if score #xp_2.input[2] int matches ..-1 run scoreboard players add #xp_2.input[2] int 10000

scoreboard players operation #xp_2.input[2] int *= 10000 const
scoreboard players operation #xp_2.input[2] int += #xp_2.input[3] int
scoreboard players operation #xp_2.input[2] int *= 10000 const
scoreboard players operation #xp_2.input[2] int += #xp_2.input[4] int

##简易开根 - 向下取整

execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #t4 int run scoreboard players operation #xp_2.out_level int = #xp_2.input[2] int
execute if score #xp_2.input[2] int matches 0..1515359 run scoreboard players operation #xp_2.out_level int /= 559 const
execute if score #xp_2.input[2] int matches 0..1515359 run scoreboard players add #xp_2.out_level int 15
execute if score #xp_2.input[2] int matches 1515360.. run scoreboard players operation #xp_2.out_level int /= 32768 const
execute if score #xp_2.input[2] int matches 1515360.. run scoreboard players add #xp_2.out_level int 2456
scoreboard players operation #t1 int /= #xp_2.out_level int
scoreboard players operation #xp_2.out_level int += #t1 int
scoreboard players operation #xp_2.out_level int /= 2 const
scoreboard players operation #t2 int /= #xp_2.out_level int
scoreboard players operation #xp_2.out_level int += #t2 int
scoreboard players operation #xp_2.out_level int /= 2 const
scoreboard players operation #t3 int /= #xp_2.out_level int
scoreboard players operation #xp_2.out_level int += #t3 int
scoreboard players operation #xp_2.out_level int /= 2 const
scoreboard players operation #t4 int /= #xp_2.out_level int
execute if score #xp_2.out_level int > #t4 int run scoreboard players remove #xp_2.out_level int 1

scoreboard players add #xp_2.out_level int 325
execute store result storage large_number:math xp_points_ope_levels.output_levels int 1 run scoreboard players operation #xp_2.out_level int /= 18 const

##把得到的等级数代入经验公式算经验差

#经验公式：y=4.5x^2 -162.5x +2220
#这是对"当经验等级≥32时，升级到下一级的经验为9n-158"求和后+1507得到的，从n=31开始求和

scoreboard players operation #temp1 int = #xp_2.out_level int
scoreboard players operation #temp1 int *= #temp1 int
scoreboard players operation #temp1 int *= 45 const
scoreboard players operation #temp1 int /= 10 const

scoreboard players operation #temp2 int = #xp_2.out_level int
scoreboard players operation #temp2 int *= 1625 const
scoreboard players operation #temp2 int /= 10 const

scoreboard players operation #temp1 int -= #temp2 int
scoreboard players add #temp1 int 2220


#减法，输入值减去算出来的值
execute store result score #xp_2.input[3] int run data get storage large_number:math xp_points_ope_levels.input[-2]
execute store result score #xp_2.input[4] int run data get storage large_number:math xp_points_ope_levels.input[-1]

scoreboard players operation #xp_2.input[3] int *= 10000 const
scoreboard players operation #xp_2.input[3] int += #xp_2.input[4] int

execute store result score #xp_2.input[4] int run scoreboard players operation #xp_2.input[3] int -= #temp1 int
scoreboard players operation #xp_2.input[3] int /= 10000 const
scoreboard players operation #xp_2.input[4] int %= 10000 const


data modify storage large_number:math xp_points_ope_levels.remaining_points set value [I;0,0,0,0,0]
execute store result storage large_number:math xp_points_ope_levels.remaining_points[3] int 1 run scoreboard players get #xp_2.input[3] int
execute store result storage large_number:math xp_points_ope_levels.remaining_points[4] int 1 run scoreboard players get #xp_2.input[4] int
