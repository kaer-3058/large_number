##int质因数分解
#scoreboard players set #prime_factorization.input int 271142

#理论基础：
#每个大于等于2的正整数的质因数分解的结果是唯一的
#因为一个正整数n的质因数里只有一个可能大于根号n，所以int质因数分解只需要试除2~46337的质数就可以了，余数如果不为0或1那就作为输入值最大的质因数

data modify storage large_number:math prime_factorization_output set value []
data modify storage large_number:math sstempt set from storage large_number:math prime_factorization_database
scoreboard players operation #store_prime_factorization.input int = #prime_factorization.input int
execute if score #prime_factorization.input int matches 2.. run function large_number:prime_factorization/loop
execute unless score #store_prime_factorization.input int matches 0..1 store result storage large_number:math temp1 int 1 run scoreboard players get #store_prime_factorization.input int
execute unless score #store_prime_factorization.input int matches 0..1 run data modify storage large_number:math prime_factorization_output append from storage large_number:math temp1
