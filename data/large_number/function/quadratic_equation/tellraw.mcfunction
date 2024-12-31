data remove storage large_number:math quadratic_equation_out_json_tellraw
data modify storage large_number:math quadratic_equation_out_json_tellraw.b set value ""
data modify storage large_number:math quadratic_equation_out_json_tellraw.c set value ""
execute if score #X_squ_equ.b int matches 0.. run data modify storage large_number:math quadratic_equation_out_json_tellraw.b set value "+"
execute if score #X_squ_equ.c int matches 0.. run data modify storage large_number:math quadratic_equation_out_json_tellraw.c set value "+"
data modify storage large_number:math quadratic_equation_out_json_tellraw.json1 set value '{"translate":"large_number.quadratic_equation.tell.1","with": [{"score":{"name":"#X_squ_equ.a","objective":"int"}},{"nbt":"quadratic_equation_out_json_tellraw.b","storage":"large_number:math"},{"score":{"name":"#X_squ_equ.b","objective":"int"}},{"nbt":"quadratic_equation_out_json_tellraw.c","storage":"large_number:math"},{"score":{"name":"#X_squ_equ.c","objective":"int"}}],"fallback":"方程: \\"%1$sx²%2$s%3$sx%4$s%5$s=0\\", "}'

execute if score #X_squ_equ.roots int matches 2 run data modify storage large_number:math quadratic_equation_out_json_tellraw.x1 set string storage large_number:math quadratic_equation_out.double[0] 0 -1
execute if score #X_squ_equ.roots int matches 2 run data modify storage large_number:math quadratic_equation_out_json_tellraw.x2 set string storage large_number:math quadratic_equation_out.double[1] 0 -1
execute if score #X_squ_equ.roots int matches 2 run data modify storage large_number:math quadratic_equation_out_json_tellraw.json2 set value '{"translate":"large_number.quadratic_equation.tell.2","with":[{"nbt":"quadratic_equation_out_json_tellraw.x1","storage":"large_number:math"},{"nbt":"quadratic_equation_out_json_tellraw.x2","storage":"large_number:math"}],"fallback": "解得: x₁=%1$s, x₂=%2$s"}'
execute if score #X_squ_equ.roots int matches 1 run data modify storage large_number:math quadratic_equation_out_json_tellraw.x1 set string storage large_number:math quadratic_equation_out.double 0 -1
execute if score #X_squ_equ.roots int matches 1 run data modify storage large_number:math quadratic_equation_out_json_tellraw.json2 set value '{"translate":"large_number.quadratic_equation.tell.3","with":[{"nbt":"quadratic_equation_out_json_tellraw.x1","storage":"large_number:math"}],"fallback": "解得: x=%1$s"}'
execute if score #X_squ_equ.roots int matches 0 run data modify storage large_number:math quadratic_equation_out_json_tellraw.json2 set value '{"translate":"large_number.quadratic_equation.tell.4","fallback":"解得: 无实数根"}'

#tellraw @a [{"nbt":"quadratic_equation_out_json_tellraw.json1","storage":"large_number:math","interpret":true},{"nbt":"quadratic_equation_out_json_tellraw.json2","storage":"large_number:math","interpret":true}]
