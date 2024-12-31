#+分母，取倒数，循环

scoreboard players operation #temp.a int = #conti_frac.sqrt.A int
execute store result score #stemp1 int run scoreboard players operation #temp.b int = #conti_frac.sqrt.N int

#防溢出检查，#temp.e int的分数为1就是溢出了
scoreboard players set #temp.e int 0
execute store result score #temp.d int store result score #temp.c int run scoreboard players set #temp.f int 2147483647
scoreboard players operation #temp.f int /= #stemp1 int
execute if score #temp.f int < #store.#conti_frac.sqrt.N int run scoreboard players set #temp.e int 1

execute if score #temp.e int matches 0 run scoreboard players operation #stemp1 int *= #store.#conti_frac.sqrt.N int

#防溢出检查
scoreboard players operation #temp.c int -= #temp.a int
scoreboard players operation #temp.d int /= #temp.b int
execute if score #temp.c int < #stemp1 int run scoreboard players set #temp.e int 1
execute if score #temp.d int < #store.#conti_frac.sqrt.A int run scoreboard players set #temp.e int 1

scoreboard players operation #temp.a int += #stemp1 int
scoreboard players operation #temp.b int *= #store.#conti_frac.sqrt.A int

#约分
scoreboard players operation #stemp1 int = #temp.b int
scoreboard players operation #stemp2 int = #temp.a int
scoreboard players reset #sstemp1 int
execute if score #temp.e int matches 0 unless score #temp.b int = #temp.a int run function large_number:sqrt_continued_fraction/loop.reduction_fraction
execute if score #sstemp1 int matches 1 run scoreboard players operation #temp.a int /= #stemp2 int
execute if score #sstemp1 int matches 1 run scoreboard players operation #temp.b int /= #stemp2 int

execute if score #temp.e int matches 0 run scoreboard players operation #conti_frac.sqrt.N int = #temp.a int
execute if score #temp.e int matches 0 run scoreboard players operation #conti_frac.sqrt.A int = #temp.b int

scoreboard players remove #store_conti_frac.sqrt.loops int 1
execute if score #temp.e int matches 0 if score #store_conti_frac.sqrt.loops int matches 2.. run function large_number:sqrt_continued_fraction/loop
