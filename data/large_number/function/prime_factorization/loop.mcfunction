function large_number:prime_factorization/loop2
execute if score #temp1 int matches 0 run data modify storage large_number:math prime_factorization_output append from storage large_number:math sstempt[0]
execute if score #temp1 int matches 0 run scoreboard players operation #store_prime_factorization.input int /= #temp2 int
execute unless score #store_prime_factorization.input int matches 0..1 if data storage large_number:math sstempt[0] run function large_number:prime_factorization/loop
