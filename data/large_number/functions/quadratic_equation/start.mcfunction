##整系数一元二次方程计算器
#a b c 的绝对值尽量不大于20724

#scoreboard players set #X_squ_equ.a int 0
#scoreboard players set #X_squ_equ.b int 0
#scoreboard players set #X_squ_equ.c int 0


#德尔塔
scoreboard players operation #temp2 int = #X_squ_equ.b int
scoreboard players operation #temp2 int *= #temp2 int
scoreboard players operation #temp1 int = #X_squ_equ.a int
scoreboard players operation #temp3 int = #X_squ_equ.c int
scoreboard players operation #temp1 int *= 4 const
scoreboard players operation #temp1 int *= #temp3 int
execute store result score #X_squ_equ.delta int run scoreboard players operation #temp2 int -= #temp1 int

execute if score #X_squ_equ.delta int matches 1.. run function large_number:quadratic_equation/roots.2
execute if score #X_squ_equ.delta int matches 0 run function large_number:quadratic_equation/roots.1
execute if score #X_squ_equ.delta int matches ..-1 run function large_number:quadratic_equation/roots.0

#表达式化简：非平方数且是分数，非平方数且不是分数，无意义分数，是平方数化且是分数，是平方数且不是分数

execute if score #X_squ_equ.tellraw int matches 1 run function large_number:quadratic_equation/tellraw
