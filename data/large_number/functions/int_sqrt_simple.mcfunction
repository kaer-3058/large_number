##简易开根 - 向下取整
#算法来源：https://github.com/Triton365/fast_integer_sqrt/blob/main/functions/isqrt_nofunction.mcfunction
# INPUT: scoreboard players set input.sqrt int 2

execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #t4 int run scoreboard players operation output.sqrt int = input.sqrt int
execute if score input.sqrt int matches 0..1515359 run scoreboard players operation output.sqrt int /= 559 const
execute if score input.sqrt int matches 0..1515359 run scoreboard players add output.sqrt int 15
execute if score input.sqrt int matches 1515360.. run scoreboard players operation output.sqrt int /= 32768 const
execute if score input.sqrt int matches 1515360.. run scoreboard players add output.sqrt int 2456
scoreboard players operation #t1 int /= output.sqrt int
scoreboard players operation output.sqrt int += #t1 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #t2 int /= output.sqrt int
scoreboard players operation output.sqrt int += #t2 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #t3 int /= output.sqrt int
scoreboard players operation output.sqrt int += #t3 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #t4 int /= output.sqrt int
execute if score output.sqrt int > #t4 int run scoreboard players remove output.sqrt int 1

# OUTPUT: scoreboard players get output.sqrt int
