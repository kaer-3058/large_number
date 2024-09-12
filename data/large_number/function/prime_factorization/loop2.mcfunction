scoreboard players operation #temp1 int = #store_prime_factorization.input int
execute store result score #temp2 int run data get storage large_number:math sstempt[0]
scoreboard players operation #temp1 int %= #temp2 int
execute unless score #temp1 int matches 0 run data remove storage large_number:math sstempt[0]
execute unless score #temp1 int matches 0 if data storage large_number:math sstempt[0] run function large_number:prime_factorization/loop2
