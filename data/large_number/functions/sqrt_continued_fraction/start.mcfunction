##连分数迭代法求根号
#输入：scoreboard players set #conti_frac.sqrt.input int <正整数>
#迭代次数：scoreboard players set #conti_frac.sqrt.loops int <正整数>
#整合：scoreboard players set #conti_frac.sqrt.merge int 1
#约分：scoreboard players set #conti_frac.sqrt.reduction_fraction int 1
#显示连分数表达式：scoreboard players set #conti_frac.sqrt.tellraw int 1
#输出(整合)：#conti_frac.sqrt.A／#conti_frac.sqrt.N，整数部分：#conti_frac.sqrt.inte int
#输出(未整合):（#conti_frac.sqrt.A／#conti_frac.sqrt.N）＋#conti_frac.sqrt.inte int
#连分数表达式：data get storage math conti_frac_sqrt_expression
#适用于万以内的数，精确度可达12位小数

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

#简易开根：#11.1是输入，#11.2是输出

execute store result score #conti_frac.sqrt.tell.inte int store result score #conti_frac.sqrt.inte int store result score #conti_frac.sqrt.N^2 int run scoreboard players operation #conti_frac.sqrt.N int = #11.2 int
scoreboard players operation #conti_frac.sqrt.N^2 int *= #conti_frac.sqrt.N^2 int

#分子
execute store result score #conti_frac.sqrt.tell.A int store result score #store.#conti_frac.sqrt.A int run scoreboard players operation #conti_frac.sqrt.A int -= #conti_frac.sqrt.N^2 int

#分母
execute store result score #conti_frac.sqrt.tell.N int store result score #store.#conti_frac.sqrt.N int run scoreboard players operation #conti_frac.sqrt.N int *= 2 const

#连分数迭代
execute if score #conti_frac.sqrt.loops int matches 2.. unless score #conti_frac.sqrt.A int matches 0 run function large_number:sqrt_continued_fraction/loop

#整合
execute if score #conti_frac.sqrt.merge int matches 1 run scoreboard players operation #11.2 int *= #conti_frac.sqrt.N int
execute if score #conti_frac.sqrt.merge int matches 1 run scoreboard players operation #conti_frac.sqrt.A int += #11.2 int

#整合后约分
scoreboard players operation #stemp1 int = #conti_frac.sqrt.A int
scoreboard players operation #stemp2 int = #conti_frac.sqrt.N int
scoreboard players reset #sstemp1 int
execute if score #conti_frac.sqrt.merge int matches 1 if score #conti_frac.sqrt.reduction_fraction int matches 1 unless score #conti_frac.sqrt.A int = #conti_frac.sqrt.N int run function large_number:sqrt_continued_fraction/loop.reduction_fraction
execute if score #sstemp1 int matches 1 if score #conti_frac.sqrt.reduction_fraction int matches 1 run scoreboard players operation #conti_frac.sqrt.A int /= #stemp2 int
execute if score #sstemp1 int matches 1 if score #conti_frac.sqrt.reduction_fraction int matches 1 run scoreboard players operation #conti_frac.sqrt.N int /= #stemp2 int

execute if score #conti_frac.sqrt.tellraw int matches 1 run function large_number:sqrt_continued_fraction/tellraw
