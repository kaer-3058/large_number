data remove storage math quadratic_equation_out_json_tellraw
data modify storage math quadratic_equation_out_json_tellraw.b set value ""
data modify storage math quadratic_equation_out_json_tellraw.c set value ""
execute if score #X_squ_equ.b int matches 0.. run data modify storage math quadratic_equation_out_json_tellraw.b set value "+"
execute if score #X_squ_equ.c int matches 0.. run data modify storage math quadratic_equation_out_json_tellraw.c set value "+"
data modify storage math quadratic_equation_out_json_tellraw.json1 set value '["方程: \\"",{"score":{"name":"#X_squ_equ.a","objective":"int"}},"x²",{"nbt":"quadratic_equation_out_json_tellraw.b","storage":"math"},{"score":{"name":"#X_squ_equ.b","objective":"int"}},"x",{"nbt":"quadratic_equation_out_json_tellraw.c","storage":"math"},{"score":{"name":"#X_squ_equ.c","objective":"int"}},"=0\\", "]'
execute if score #X_squ_equ.roots int matches 2 run data modify storage math quadratic_equation_out_json_tellraw.x1 set string storage math quadratic_equation_out.double[0] 0 -1
execute if score #X_squ_equ.roots int matches 2 run data modify storage math quadratic_equation_out_json_tellraw.x2 set string storage math quadratic_equation_out.double[1] 0 -1
execute if score #X_squ_equ.roots int matches 2 run data modify storage math quadratic_equation_out_json_tellraw.json2 set value '["解得: ","x₁=",{"nbt":"quadratic_equation_out_json_tellraw.x1","storage":"math"},", x₂=",{"nbt":"quadratic_equation_out_json_tellraw.x2","storage":"math"}]'
execute if score #X_squ_equ.roots int matches 1 run data modify storage math quadratic_equation_out_json_tellraw.x1 set string storage math quadratic_equation_out.double 0 -1
execute if score #X_squ_equ.roots int matches 1 run data modify storage math quadratic_equation_out_json_tellraw.json2 set value '["解得: ","x=",{"nbt":"quadratic_equation_out_json_tellraw.x1","storage":"math"}]'
execute if score #X_squ_equ.roots int matches 0 run data modify storage math quadratic_equation_out_json_tellraw.json2 set value '{"text":"解得: 无实数根"}'

#tellraw @a [{"nbt":"quadratic_equation_out_json_tellraw.json1","storage":"math","interpret":true},{"nbt":"quadratic_equation_out_json_tellraw.json2","storage":"math","interpret":true}]
