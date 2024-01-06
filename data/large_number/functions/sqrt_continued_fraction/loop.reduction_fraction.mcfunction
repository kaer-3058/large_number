#辗转相除法(欧几里得算法)取分子分母的最大公约数
execute if score #stemp2 int > #stemp1 int run scoreboard players operation #stemp1 int >< #stemp2 int
execute store success score #sstemp1 int run scoreboard players operation #stemp1 int %= #stemp2 int
execute unless score #stemp1 int matches 0 run scoreboard players operation #stemp1 int >< #stemp2 int
execute if score #stemp1 int matches ..-1 run return fail
execute if score #stemp2 int matches ..-1 run return fail
execute unless score #stemp1 int matches 0 run function large_number:sqrt_continued_fraction/loop.reduction_fraction