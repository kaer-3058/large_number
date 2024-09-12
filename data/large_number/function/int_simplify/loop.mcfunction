#辗转相除法 (欧几里得算法) 取最大公约数
execute if score #int_simplify.greatest_common_divisor int > #sstemp1 int run scoreboard players operation #sstemp1 int >< #int_simplify.greatest_common_divisor int
scoreboard players operation #sstemp1 int %= #int_simplify.greatest_common_divisor int
execute unless score #sstemp1 int matches 0 run scoreboard players operation #sstemp1 int >< #int_simplify.greatest_common_divisor int

execute unless score #sstemp1 int matches 0 run function large_number:int_simplify/loop
