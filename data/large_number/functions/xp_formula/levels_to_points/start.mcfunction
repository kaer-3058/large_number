##大数计算 - 经验公式 - 根据经验等级计算已有经验的总数

#获取经验等级数和经验余数
#execute store result score #xp_formula.levels int run xp query @s levels
#execute store result score #xp_formula.points int run xp query @s points

#输入：
#等级：#xp_formula.levels int
#经验数：#xp_formula.points int
#经验数就是 /xp query @s points 获得的

#输出：storage large_number:math xp.output


#分情况讨论
execute if score #xp_formula.levels int matches 0..15 store result score #4.5 int run function large_number:xp_formula/levels_to_points/0..15

execute if score #xp_formula.levels int matches 16..31 store result score #4.5 int run function large_number:xp_formula/levels_to_points/16..31

execute if score #xp_formula.levels int matches 0..31 store result score #4.2 int store result score #4.3 int store result score #4.4 int run scoreboard players set #4.1 int 0

execute if score #xp_formula.levels int matches 32.. run function large_number:xp_formula/levels_to_points/32..


#加经验数
execute store result score #a int store result score #b int run scoreboard players operation #c int = #xp_formula.points int
scoreboard players operation #c int %= 10000 const
scoreboard players operation #b int %= 100000000 const
scoreboard players operation #b int /= 10000 const
scoreboard players operation #a int /= 100000000 const

execute store result score #5.4 int run scoreboard players operation #4.5 int += #c int
scoreboard players operation #4.4 int += #b int
scoreboard players operation #4.3 int += #a int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const


#整合
data modify storage large_number:math xp.output set value [I;0,0,0,0,0]
execute store result storage large_number:math xp.output[0] int 1 run scoreboard players operation #4.1 int += #5.1 int
execute store result storage large_number:math xp.output[1] int 1 run scoreboard players operation #4.2 int %= 10000 const
execute store result storage large_number:math xp.output[2] int 1 run scoreboard players operation #4.3 int %= 10000 const
execute store result storage large_number:math xp.output[3] int 1 run scoreboard players operation #4.4 int %= 10000 const
execute store result storage large_number:math xp.output[4] int 1 run scoreboard players operation #4.5 int %= 10000 const
