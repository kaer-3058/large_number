#指数分布
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #ln(x) int run data get storage large_number:math random_number_0_1 1000000000
execute if score #ln(x) int matches ..-1 store result score #ln(x) int run random value 0..1000000000
execute if score #ln(x) int matches 1000000001.. store result score #ln(x) int run random value 0..1000000000
scoreboard players operation #ln(x) int *= -1 const
scoreboard players add #ln(x) int 1000000000
function large_number:ln/start
scoreboard players remove #ln(x).output int 207232
scoreboard players operation #ln(x).output int *= -1000 const
scoreboard players operation #ln(x).output int /= #exponential_distribution.λ int
scoreboard players operation #sstempu int += #ln(x).output int

scoreboard players remove #loop int 1
execute if score #loop int matches 1.. run function large_number:random/gamma_distribution/loop
