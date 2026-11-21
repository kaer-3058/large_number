#+分母，取倒数，循环

scoreboard players operation #temp.a large_number.int = #conti_frac.sqrt.A large_number.int
execute store result score #stemp1 large_number.int run scoreboard players operation #temp.b large_number.int = #conti_frac.sqrt.N large_number.int

#防溢出检查，#temp.e int的分数为1就是溢出了
scoreboard players set #temp.e large_number.int 0
execute store result score #temp.d large_number.int store result score #temp.c large_number.int run scoreboard players set #temp.f large_number.int 2147483647
scoreboard players operation #temp.f large_number.int /= #stemp1 large_number.int
execute if score #temp.f large_number.int < #store.#conti_frac.sqrt.N large_number.int run scoreboard players set #temp.e large_number.int 1

execute if score #temp.e large_number.int matches 0 run scoreboard players operation #stemp1 large_number.int *= #store.#conti_frac.sqrt.N large_number.int

#防溢出检查
scoreboard players operation #temp.c large_number.int -= #temp.a large_number.int
scoreboard players operation #temp.d large_number.int /= #temp.b large_number.int
execute if score #temp.c large_number.int < #stemp1 large_number.int run scoreboard players set #temp.e large_number.int 1
execute if score #temp.d large_number.int < #store.#conti_frac.sqrt.A large_number.int run scoreboard players set #temp.e large_number.int 1

scoreboard players operation #temp.a large_number.int += #stemp1 large_number.int
scoreboard players operation #temp.b large_number.int *= #store.#conti_frac.sqrt.A large_number.int

#约分
scoreboard players operation #stemp1 large_number.int = #temp.b large_number.int
scoreboard players operation #stemp2 large_number.int = #temp.a large_number.int
scoreboard players reset #sstemp1 large_number.int
execute if score #temp.e large_number.int matches 0 unless score #temp.b large_number.int = #temp.a large_number.int run function large_number:sqrt_continued_fraction/loop.reduction_fraction
execute if score #sstemp1 large_number.int matches 1 run scoreboard players operation #temp.a large_number.int /= #stemp2 large_number.int
execute if score #sstemp1 large_number.int matches 1 run scoreboard players operation #temp.b large_number.int /= #stemp2 large_number.int

execute if score #temp.e large_number.int matches 0 run scoreboard players operation #conti_frac.sqrt.N large_number.int = #temp.a large_number.int
execute if score #temp.e large_number.int matches 0 run scoreboard players operation #conti_frac.sqrt.A large_number.int = #temp.b large_number.int

scoreboard players remove #store_conti_frac.sqrt.loops large_number.int 1
execute if score #temp.e large_number.int matches 0 if score #store_conti_frac.sqrt.loops large_number.int matches 2.. run function large_number:sqrt_continued_fraction/loop
