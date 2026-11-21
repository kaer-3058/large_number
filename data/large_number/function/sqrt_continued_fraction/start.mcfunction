##整数开根 - 连分数迭代法

#输入：scoreboard players set #conti_frac.sqrt.input large_number.int <正整数>
#迭代次数：scoreboard players set #conti_frac.sqrt.loops large_number.int <正整数>
#显示连分数表达式：scoreboard players set #conti_frac.sqrt.tellraw large_number.int 1
#输出:（#conti_frac.sqrt.A large_number.int／#conti_frac.sqrt.N large_number.int）＋#conti_frac.sqrt.inte large_number.int
#连分数表达式：data get storage large_number:math conti_frac_sqrt_expression
#精确度可达14位小数

execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int store result score #conti_frac.sqrt.A large_number.int store result score #11.2 large_number.int run scoreboard players operation #11.1 large_number.int = #conti_frac.sqrt.input large_number.int
execute if score #11.1 large_number.int matches 0..1515359 run scoreboard players operation #11.2 large_number.int /= 559 const
execute if score #11.1 large_number.int matches 0..1515359 run scoreboard players add #11.2 large_number.int 15
execute if score #11.1 large_number.int matches 1515360.. run scoreboard players operation #11.2 large_number.int /= 32768 const
execute if score #11.1 large_number.int matches 1515360.. run scoreboard players add #11.2 large_number.int 2456
scoreboard players operation #t1 large_number.int /= #11.2 large_number.int
scoreboard players operation #11.2 large_number.int += #t1 large_number.int
scoreboard players operation #11.2 large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #11.2 large_number.int
scoreboard players operation #11.2 large_number.int += #t2 large_number.int
scoreboard players operation #11.2 large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #11.2 large_number.int
scoreboard players operation #11.2 large_number.int += #t3 large_number.int
scoreboard players operation #11.2 large_number.int /= 2 const
scoreboard players operation #11.1 large_number.int /= #11.2 large_number.int
execute if score #11.2 large_number.int > #11.1 large_number.int run scoreboard players remove #11.2 large_number.int 1

execute store result score #conti_frac.sqrt.tell.inte large_number.int store result score #conti_frac.sqrt.inte large_number.int store result score #conti_frac.sqrt.N^2 large_number.int run scoreboard players operation #conti_frac.sqrt.N large_number.int = #11.2 large_number.int
scoreboard players operation #conti_frac.sqrt.N^2 large_number.int *= #conti_frac.sqrt.N^2 large_number.int

#分子
execute store result score #conti_frac.sqrt.tell.A large_number.int store result score #store.#conti_frac.sqrt.A large_number.int run scoreboard players operation #conti_frac.sqrt.A large_number.int -= #conti_frac.sqrt.N^2 large_number.int

#分母
execute store result score #conti_frac.sqrt.tell.N large_number.int store result score #store.#conti_frac.sqrt.N large_number.int run scoreboard players operation #conti_frac.sqrt.N large_number.int *= 2 const

#连分数迭代
scoreboard players operation #store_conti_frac.sqrt.loops large_number.int = #conti_frac.sqrt.loops large_number.int
execute if score #store_conti_frac.sqrt.loops large_number.int matches 2.. unless score #conti_frac.sqrt.A large_number.int matches 0 run function large_number:sqrt_continued_fraction/loop

execute if score #conti_frac.sqrt.tellraw large_number.int matches 1 run function large_number:sqrt_continued_fraction/tellraw
