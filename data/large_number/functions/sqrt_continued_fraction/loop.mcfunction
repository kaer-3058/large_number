#+分母，取倒数，循环

scoreboard players operation #temp.a int = #conti_frac.sqrt.A int
execute store result score #stemp1 int run scoreboard players operation #temp.b int = #conti_frac.sqrt.N int
scoreboard players operation #stemp1 int *= #store.#conti_frac.sqrt.N int
scoreboard players operation #temp.a int += #stemp1 int
scoreboard players operation #temp.b int *= #store.#conti_frac.sqrt.A int

#约分
scoreboard players operation #stemp1 int = #temp.b int
scoreboard players operation #stemp2 int = #temp.a int
scoreboard players reset #sstemp1 int
execute if score #conti_frac.sqrt.reduction_fraction int matches 1 unless score #temp.b int = #temp.a int run function large_number:sqrt_continued_fraction/loop.reduction_fraction
execute if score #sstemp1 int matches 1 if score #conti_frac.sqrt.reduction_fraction int matches 1 run scoreboard players operation #temp.a int /= #stemp2 int
execute if score #sstemp1 int matches 1 if score #conti_frac.sqrt.reduction_fraction int matches 1 run scoreboard players operation #temp.b int /= #stemp2 int

scoreboard players operation #conti_frac.sqrt.N int = #temp.a int
scoreboard players operation #conti_frac.sqrt.A int = #temp.b int
scoreboard players remove #conti_frac.sqrt.loops int 1
execute if score #conti_frac.sqrt.loops int matches 2.. run function large_number:sqrt_continued_fraction/loop
