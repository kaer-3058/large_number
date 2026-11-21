##整系数一元二次方程计算器
#a b c 的绝对值尽量不大于20724

#scoreboard players set #X_squ_equ.a large_number.int 0
#scoreboard players set #X_squ_equ.b large_number.int 0
#scoreboard players set #X_squ_equ.c large_number.int 0

#delta
scoreboard players operation #temp2 large_number.int = #X_squ_equ.b large_number.int
scoreboard players operation #temp2 large_number.int *= #temp2 large_number.int
scoreboard players operation #temp1 large_number.int = #X_squ_equ.a large_number.int
scoreboard players operation #temp3 large_number.int = #X_squ_equ.c large_number.int
scoreboard players operation #temp1 large_number.int *= 4 const
scoreboard players operation #temp1 large_number.int *= #temp3 large_number.int
execute store result score #X_squ_equ.delta large_number.int run scoreboard players operation #temp2 large_number.int -= #temp1 large_number.int

execute unless score #X_squ_equ.a large_number.int matches 0 if score #X_squ_equ.delta large_number.int matches 1.. run function large_number:quadratic_equation/roots.2
execute unless score #X_squ_equ.a large_number.int matches 0 if score #X_squ_equ.delta large_number.int matches 0 run function large_number:quadratic_equation/roots.1
execute unless score #X_squ_equ.a large_number.int matches 0 if score #X_squ_equ.delta large_number.int matches ..-1 run function large_number:quadratic_equation/roots.0

execute if score #X_squ_equ.a large_number.int matches 0 run function large_number:quadratic_equation/a_is_0

#表达式化简：非平方数且是分数，非平方数且不是分数，无意义分数，是平方数化且是分数，是平方数且不是分数

#当b=0，且a和c都不为0时，方程根为：±✓(-c/a)
#当b=0且c=0时，方程根恒为0
#当b=0，a=1，c不为0时，方程根为±✓(-c)

execute if score #X_squ_equ.tellraw large_number.int matches 1 run function large_number:quadratic_equation/tellraw
