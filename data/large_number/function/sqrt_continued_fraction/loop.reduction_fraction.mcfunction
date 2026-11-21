#辗转相除法(欧几里得算法)取分子分母的最大公约数
execute if score #stemp2 large_number.int > #stemp1 large_number.int run scoreboard players operation #stemp1 large_number.int >< #stemp2 large_number.int
execute store success score #sstemp1 large_number.int run scoreboard players operation #stemp1 large_number.int %= #stemp2 large_number.int
execute unless score #stemp1 large_number.int matches 0 run scoreboard players operation #stemp1 large_number.int >< #stemp2 large_number.int

execute unless score #stemp1 large_number.int matches 0 unless score #stemp1 large_number.int matches ..-1 unless score #stemp2 large_number.int matches ..-1 run function large_number:sqrt_continued_fraction/loop.reduction_fraction
