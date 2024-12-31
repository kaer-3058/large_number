##整数开根 - 连分数迭代法

#输入：scoreboard players set #conti_frac.sqrt.input int <正整数>
#迭代次数：scoreboard players set #conti_frac.sqrt.loops int <正整数>
#显示连分数表达式：scoreboard players set #conti_frac.sqrt.tellraw int 1
#输出:（#conti_frac.sqrt.A int／#conti_frac.sqrt.N int）＋#conti_frac.sqrt.inte int
#连分数表达式：data get storage large_number:math conti_frac_sqrt_expression
#精确度可达14位小数

execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #conti_frac.sqrt.A int store result score #11.2 int run scoreboard players operation #11.1 int = #conti_frac.sqrt.input int
execute if score #11.1 int matches 0..1515359 run scoreboard players operation #11.2 int /= 559 const
execute if score #11.1 int matches 0..1515359 run scoreboard players add #11.2 int 15
execute if score #11.1 int matches 1515360.. run scoreboard players operation #11.2 int /= 32768 const
execute if score #11.1 int matches 1515360.. run scoreboard players add #11.2 int 2456
scoreboard players operation #t1 int /= #11.2 int
scoreboard players operation #11.2 int += #t1 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #t2 int /= #11.2 int
scoreboard players operation #11.2 int += #t2 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #t3 int /= #11.2 int
scoreboard players operation #11.2 int += #t3 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #11.1 int /= #11.2 int
execute if score #11.2 int > #11.1 int run scoreboard players remove #11.2 int 1

execute store result score #conti_frac.sqrt.tell.inte int store result score #conti_frac.sqrt.inte int store result score #conti_frac.sqrt.N^2 int run scoreboard players operation #conti_frac.sqrt.N int = #11.2 int
scoreboard players operation #conti_frac.sqrt.N^2 int *= #conti_frac.sqrt.N^2 int

#分子
execute store result score #conti_frac.sqrt.tell.A int store result score #store.#conti_frac.sqrt.A int run scoreboard players operation #conti_frac.sqrt.A int -= #conti_frac.sqrt.N^2 int

#分母
execute store result score #conti_frac.sqrt.tell.N int store result score #store.#conti_frac.sqrt.N int run scoreboard players operation #conti_frac.sqrt.N int *= 2 const

#连分数迭代
scoreboard players operation #store_conti_frac.sqrt.loops int = #conti_frac.sqrt.loops int
execute if score #store_conti_frac.sqrt.loops int matches 2.. unless score #conti_frac.sqrt.A int matches 0 run function large_number:sqrt_continued_fraction/loop

execute if score #conti_frac.sqrt.tellraw int matches 1 run function large_number:sqrt_continued_fraction/tellraw
