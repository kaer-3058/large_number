execute store result score #temp1 int run data get storage large_number:math quadratic_equation_double.roots

data modify storage large_number:math temp1 set string storage large_number:math temp_b 0 1
data modify storage large_number:math temp2 set string storage large_number:math temp_c 0 1
data modify storage large_number:math quadratic_equation_double.tellraw.sign1 set value "+"
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math quadratic_equation_double.tellraw.sign1 set value ""
data modify storage large_number:math quadratic_equation_double.tellraw.sign2 set value "+"
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math quadratic_equation_double.tellraw.sign2 set value ""

data modify storage large_number:math quadratic_equation_double.tellraw.a set string storage large_number:math quadratic_equation_double.input[0] 0 -1
data modify storage large_number:math quadratic_equation_double.tellraw.b set string storage large_number:math quadratic_equation_double.input[1] 0 -1
data modify storage large_number:math quadratic_equation_double.tellraw.c set string storage large_number:math quadratic_equation_double.input[2] 0 -1

execute if score #temp1 int matches 2 run data modify storage large_number:math quadratic_equation_double.tellraw.x set value ["",""]
execute if score #temp1 int matches 2 run data modify storage large_number:math quadratic_equation_double.tellraw.x[0] set string storage large_number:math quadratic_equation_double.output[0] 0 -1
execute if score #temp1 int matches 2 run data modify storage large_number:math quadratic_equation_double.tellraw.x[1] set string storage large_number:math quadratic_equation_double.output[1] 0 -1
execute if score #temp1 int matches 1 run data modify storage large_number:math quadratic_equation_double.tellraw.x set string storage large_number:math quadratic_equation_double.output 0 -1

execute if score #temp1 int matches 2 run data modify storage large_number:math quadratic_equation_double.tellraw.json set value '{"translate": "large_number.quadratic_equation_double.tell.1","fallback":"方程: \\"(%1$s)x²(%2$s%3$s)x%4$s%5$s=0\\", 解得: x₁=%6$s, x₂=%7$s","with":[{"nbt":"quadratic_equation_double.tellraw.a","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.sign1","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.b","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.sign2","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.c","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.x[0]","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.x[1]","storage":"large_number:math"}]}'
execute if score #temp1 int matches 1 run data modify storage large_number:math quadratic_equation_double.tellraw.json set value '{"translate": "large_number.quadratic_equation_double.tell.2","fallback":"方程: \\"(%1$s)x²(%2$s%3$s)x%4$s%5$s=0\\", 解得: x₁=x₂=%6$s","with":[{"nbt":"quadratic_equation_double.tellraw.a","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.sign1","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.b","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.sign2","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.c","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.x","storage":"large_number:math"}]}'
execute if score #temp1 int matches 0 run data modify storage large_number:math quadratic_equation_double.tellraw.json set value '{"translate": "large_number.quadratic_equation_double.tell.3","fallback":"方程: \\"(%1$s)x²(%2$s%3$s)x%4$s%5$s=0\\", 解得: 无实数根","with":[{"nbt":"quadratic_equation_double.tellraw.a","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.sign1","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.b","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.sign2","storage":"large_number:math"},{"nbt":"quadratic_equation_double.tellraw.c","storage":"large_number:math"}]}'


#tellraw @a [{"nbt":"quadratic_equation_double.tellraw.json","storage":"large_number:math","interpret":true}]
