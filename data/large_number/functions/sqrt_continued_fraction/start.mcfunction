##连分数迭代法求根号
#输入：scoreboard players set #conti_frac.sqrt.input int <正整数>
#迭代次数：scoreboard players set #conti_frac.sqrt.loops int <正整数>
#整合：scoreboard players set #conti_frac.sqrt.merge int 1
#约分：scoreboard players set #conti_frac.sqrt.reduction_fraction int 1
#输出(整合)：#conti_frac.sqrt.A／#conti_frac.sqrt.N，整数部分：#conti_frac.sqrt.inte int
#输出(未整合):（#conti_frac.sqrt.A／#conti_frac.sqrt.N）＋#conti_frac.sqrt.inte int
#适用于万以内的数，精确度可达12位小数

execute store result score #conti_frac.sqrt.A int store result score #1.0 int store result score #1.1 int store result score #11.2 int run scoreboard players operation #11.1 int = #conti_frac.sqrt.input int
execute if score #11.1 int matches 1..329475 run function large_number:simple_int_sqrt_range/large_sqrt/0
execute if score #11.1 int matches 329476..18688328 run function large_number:simple_int_sqrt_range/large_sqrt/1
execute if score #11.1 int matches 18688329..533609999 run function large_number:simple_int_sqrt_range/large_sqrt/2
execute if score #11.1 int matches 533610000.. run function large_number:simple_int_sqrt_range/large_sqrt/3
scoreboard players operation #1.0 int /= #11.2 int
scoreboard players operation #11.2 int += #1.0 int
scoreboard players operation #11.2 int /= 2 const
scoreboard players operation #1.1 int /= #11.2 int
scoreboard players operation #11.2 int += #1.1 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation #11.2 int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > #11.1 int run scoreboard players remove #11.2 int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < #11.1 int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add #11.2 int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > #11.1 int run scoreboard players remove #11.2 int 1

#简易开根：#11.1是输入，#11.2是输出

execute store result score #conti_frac.sqrt.inte int store result score #conti_frac.sqrt.N^2 int run scoreboard players operation #conti_frac.sqrt.N int = #11.2 int
scoreboard players operation #conti_frac.sqrt.N^2 int *= #conti_frac.sqrt.N^2 int

#分子
execute store result score #store.#conti_frac.sqrt.A int run scoreboard players operation #conti_frac.sqrt.A int -= #conti_frac.sqrt.N^2 int

#分母
execute store result score #store.#conti_frac.sqrt.N int run scoreboard players operation #conti_frac.sqrt.N int *= 2 const

#连分数迭代
execute if score #conti_frac.sqrt.loops int matches 2.. run function large_number:sqrt_continued_fraction/loop

#整合
execute if score #conti_frac.sqrt.merge int matches 1 run scoreboard players operation #11.2 int *= #conti_frac.sqrt.N int
execute if score #conti_frac.sqrt.merge int matches 1 run scoreboard players operation #conti_frac.sqrt.A int += #11.2 int

#整合后约分
scoreboard players operation #stemp1 int = #conti_frac.sqrt.A int
scoreboard players operation #stemp2 int = #conti_frac.sqrt.N int
scoreboard players reset #sstemp1 int
execute if score #conti_frac.sqrt.merge int matches 1 if score #conti_frac.sqrt.reduction_fraction int matches 1 unless score #conti_frac.sqrt.A int = #conti_frac.sqrt.N int run function large_number:sqrt_continued_fraction/loop.reduction_fraction
execute if score #sstemp1 int matches 1 if score #conti_frac.sqrt.reduction_fraction int matches 1 run scoreboard players operation #temp.a int /= #stemp2 int
execute if score #sstemp1 int matches 1 if score #conti_frac.sqrt.reduction_fraction int matches 1 run scoreboard players operation #temp.b int /= #stemp2 int
