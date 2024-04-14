execute store result storage math temp1 int 1 run scoreboard players get #conti_frac.sqrt.input int
execute store result storage math temp2 int 1 run scoreboard players get #conti_frac.sqrt.tell.inte int
execute store result storage math temp3 int 1 run scoreboard players get #conti_frac.sqrt.tell.A int
execute store result storage math temp4 int 1 run scoreboard players get #conti_frac.sqrt.tell.N int
execute unless score #conti_frac.sqrt.tell.A int matches 0 run function large_number:sqrt_continued_fraction/tellraw.macro with storage math
execute if score #conti_frac.sqrt.tell.A int matches 0 run function large_number:sqrt_continued_fraction/tellraw.macro.2 with storage math