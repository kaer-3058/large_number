##简易开根 - 向下取整
#算法来源：https://github.com/Triton365/fast_integer_sqrt/blob/main/functions/isqrt_nofunction.mcfunction
# INPUT: scoreboard players set #input.sqrt large_number.int 2

execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int run scoreboard players operation #output.sqrt large_number.int = #input.sqrt large_number.int
execute if score #input.sqrt large_number.int matches 0..1515359 run scoreboard players operation #output.sqrt large_number.int /= 559 const
execute if score #input.sqrt large_number.int matches 0..1515359 run scoreboard players add #output.sqrt large_number.int 15
execute if score #input.sqrt large_number.int matches 1515360.. run scoreboard players operation #output.sqrt large_number.int /= 32768 const
execute if score #input.sqrt large_number.int matches 1515360.. run scoreboard players add #output.sqrt large_number.int 2456
scoreboard players operation #t1 large_number.int /= #output.sqrt large_number.int
scoreboard players operation #output.sqrt large_number.int += #t1 large_number.int
scoreboard players operation #output.sqrt large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #output.sqrt large_number.int
scoreboard players operation #output.sqrt large_number.int += #t2 large_number.int
scoreboard players operation #output.sqrt large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #output.sqrt large_number.int
scoreboard players operation #output.sqrt large_number.int += #t3 large_number.int
scoreboard players operation #output.sqrt large_number.int /= 2 const
scoreboard players operation #input.sqrt large_number.int /= #output.sqrt large_number.int
execute if score #output.sqrt large_number.int > #input.sqrt large_number.int run scoreboard players remove #output.sqrt large_number.int 1

# OUTPUT: scoreboard players get #output.sqrt large_number.int
