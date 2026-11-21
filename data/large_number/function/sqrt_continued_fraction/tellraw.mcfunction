execute store result storage large_number:math temp1 int 1 run scoreboard players get #conti_frac.sqrt.input large_number.int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #conti_frac.sqrt.tell.inte large_number.int
execute store result storage large_number:math temp3 int 1 run scoreboard players get #conti_frac.sqrt.tell.A large_number.int
execute store result storage large_number:math temp4 int 1 run scoreboard players get #conti_frac.sqrt.tell.N large_number.int
execute unless score #conti_frac.sqrt.tell.A large_number.int matches 0 run function large_number:sqrt_continued_fraction/tellraw.macro with storage large_number:math
execute if score #conti_frac.sqrt.tell.A large_number.int matches 0 run function large_number:sqrt_continued_fraction/tellraw.macro.2 with storage large_number:math