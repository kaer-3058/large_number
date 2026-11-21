#辗转相除法 (欧几里得算法) 取最大公约数
execute if score #int_simplify.greatest_common_divisor large_number.int > #sstemp1 large_number.int run scoreboard players operation #sstemp1 large_number.int >< #int_simplify.greatest_common_divisor large_number.int
scoreboard players operation #sstemp1 large_number.int %= #int_simplify.greatest_common_divisor large_number.int
execute unless score #sstemp1 large_number.int matches 0 run scoreboard players operation #sstemp1 large_number.int >< #int_simplify.greatest_common_divisor large_number.int

execute unless score #sstemp1 large_number.int matches 0 run function large_number:int_simplify/loop
