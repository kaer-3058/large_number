execute store result score #temp1 int run data get storage large_number:math cubic_equation.roots

data modify storage large_number:math temp1 set string storage large_number:math temp_b 0 1
data modify storage large_number:math temp2 set string storage large_number:math temp_c 0 1
data modify storage large_number:math temp3 set string storage large_number:math temp_d 0 1
data modify storage large_number:math cubic_equation.tellraw.sign1 set value "+"
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math cubic_equation.tellraw.sign1 set value ""
data modify storage large_number:math cubic_equation.tellraw.sign2 set value "+"
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math cubic_equation.tellraw.sign2 set value ""
data modify storage large_number:math cubic_equation.tellraw.sign3 set value "+"
execute if data storage large_number:math {temp3:"-"} run data modify storage large_number:math cubic_equation.tellraw.sign3 set value ""

data modify storage large_number:math cubic_equation.tellraw.a set string storage large_number:math cubic_equation.input[0] 0 -1
data modify storage large_number:math cubic_equation.tellraw.b set string storage large_number:math cubic_equation.input[1] 0 -1
data modify storage large_number:math cubic_equation.tellraw.c set string storage large_number:math cubic_equation.input[2] 0 -1
data modify storage large_number:math cubic_equation.tellraw.d set string storage large_number:math cubic_equation.input[3] 0 -1

execute if score #temp1 int matches 3 run data modify storage large_number:math cubic_equation.tellraw.x set value ["","",""]
execute if score #temp1 int matches 3 run data modify storage large_number:math cubic_equation.tellraw.x[0] set string storage large_number:math cubic_equation.output[0] 0 -1
execute if score #temp1 int matches 3 run data modify storage large_number:math cubic_equation.tellraw.x[1] set string storage large_number:math cubic_equation.output[1] 0 -1
execute if score #temp1 int matches 3 run data modify storage large_number:math cubic_equation.tellraw.x[2] set string storage large_number:math cubic_equation.output[2] 0 -1
execute if score #temp1 int matches 2 run data modify storage large_number:math cubic_equation.tellraw.x set value ["",""]
execute if score #temp1 int matches 2 run data modify storage large_number:math cubic_equation.tellraw.x[0] set string storage large_number:math cubic_equation.output[0] 0 -1
execute if score #temp1 int matches 2 run data modify storage large_number:math cubic_equation.tellraw.x[1] set string storage large_number:math cubic_equation.output[1] 0 -1
execute if score #temp1 int matches 1 run data modify storage large_number:math cubic_equation.tellraw.x set string storage large_number:math cubic_equation.output 0 -1

execute if score #temp1 int matches 1 run data modify storage large_number:math cubic_equation.tellraw.json set value '["方程: \\"(",{"nbt":"cubic_equation.tellraw.a","storage":"large_number:math"},")x³(",{"nbt":"cubic_equation.tellraw.sign1","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.b","storage":"large_number:math"},")x²(",{"nbt":"cubic_equation.tellraw.sign2","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.c","storage":"large_number:math"},")x",{"nbt":"cubic_equation.tellraw.sign3","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.d","storage":"large_number:math"},"=0\\", ","解得: ","x=",{"nbt":"cubic_equation.tellraw.x","storage":"large_number:math"}]'
execute if score #temp1 int matches 2 run data modify storage large_number:math cubic_equation.tellraw.json set value '["方程: \\"(",{"nbt":"cubic_equation.tellraw.a","storage":"large_number:math"},")x³(",{"nbt":"cubic_equation.tellraw.sign1","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.b","storage":"large_number:math"},")x²(",{"nbt":"cubic_equation.tellraw.sign2","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.c","storage":"large_number:math"},")x",{"nbt":"cubic_equation.tellraw.sign3","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.d","storage":"large_number:math"},"=0\\", ","解得: ","x₁=",{"nbt":"cubic_equation.tellraw.x[0]","storage":"large_number:math"},", x₂=",{"nbt":"cubic_equation.tellraw.x[1]","storage":"large_number:math"}]'
execute if score #temp1 int matches 3 run data modify storage large_number:math cubic_equation.tellraw.json set value '["方程: \\"(",{"nbt":"cubic_equation.tellraw.a","storage":"large_number:math"},")x³(",{"nbt":"cubic_equation.tellraw.sign1","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.b","storage":"large_number:math"},")x²(",{"nbt":"cubic_equation.tellraw.sign2","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.c","storage":"large_number:math"},")x",{"nbt":"cubic_equation.tellraw.sign3","storage":"large_number:math"},{"nbt":"cubic_equation.tellraw.d","storage":"large_number:math"},"=0\\", ","解得: ","x₁=",{"nbt":"cubic_equation.tellraw.x[0]","storage":"large_number:math"},", x₂=",{"nbt":"cubic_equation.tellraw.x[1]","storage":"large_number:math"},", x₃=",{"nbt":"cubic_equation.tellraw.x[2]","storage":"large_number:math"}]'


#tellraw @a [{"nbt":"cubic_equation.tellraw.json","storage":"large_number:math","interpret":true}]
