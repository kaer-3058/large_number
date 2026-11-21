##在聊天栏报出信息

#function large_number:linear_equations/tell/start

#tellraw @a {storage:"large_number:math",nbt:"linear_equations_tell.tell",interpret:1b}

data remove storage large_number:math linear_equations_tell
data modify storage large_number:math linear_equations_inp set from storage large_number:math linear_equations.inputA

execute store result score #determinant.order large_number.int run data get storage large_number:math linear_equations.order
execute if score #determinant.order large_number.int matches 1 run function large_number:linear_equations/tell/1
execute if score #determinant.order large_number.int matches 2 run function large_number:linear_equations/tell/2
execute if score #determinant.order large_number.int matches 3 run function large_number:linear_equations/tell/3
execute if score #determinant.order large_number.int matches 4 run function large_number:linear_equations/tell/4
execute if score #determinant.order large_number.int matches 5 run function large_number:linear_equations/tell/5
execute if score #determinant.order large_number.int matches 6 run function large_number:linear_equations/tell/6
execute if score #determinant.order large_number.int matches 7 run function large_number:linear_equations/tell/7
execute if score #determinant.order large_number.int matches 8 run function large_number:linear_equations/tell/8
execute if score #determinant.order large_number.int matches 9 run function large_number:linear_equations/tell/9
execute if score #determinant.order large_number.int matches 10 run function large_number:linear_equations/tell/10
