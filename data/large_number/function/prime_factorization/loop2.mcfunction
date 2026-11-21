scoreboard players operation #temp1 large_number.int = #store_prime_factorization.input large_number.int
execute store result score #temp2 large_number.int run data get storage large_number:math sstempt[0]
scoreboard players operation #temp1 large_number.int %= #temp2 large_number.int
execute unless score #temp1 large_number.int matches 0 run data remove storage large_number:math sstempt[0]
execute unless score #temp1 large_number.int matches 0 if data storage large_number:math sstempt[0] run function large_number:prime_factorization/loop2
