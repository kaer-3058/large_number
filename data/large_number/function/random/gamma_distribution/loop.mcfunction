#指数分布
execute store result storage large_number:math random_number_0_1 double .000000001 run random value 0..1000000000
execute store result score #ln(x) large_number.int run data get storage large_number:math random_number_0_1 1000000000
execute if score #ln(x) large_number.int matches ..-1 store result score #ln(x) large_number.int run random value 0..1000000000
execute if score #ln(x) large_number.int matches 1000000001.. store result score #ln(x) large_number.int run random value 0..1000000000
scoreboard players operation #ln(x) large_number.int *= -1 const
scoreboard players add #ln(x) large_number.int 1000000000
function large_number:ln/start
scoreboard players remove #ln(x).output large_number.int 207232
scoreboard players operation #ln(x).output large_number.int *= -1000 const
scoreboard players operation #ln(x).output large_number.int /= #exponential_distribution.λ large_number.int
scoreboard players operation #sstempu large_number.int += #ln(x).output large_number.int

scoreboard players remove #loop large_number.int 1
execute if score #loop large_number.int matches 1.. run function large_number:random/gamma_distribution/loop
