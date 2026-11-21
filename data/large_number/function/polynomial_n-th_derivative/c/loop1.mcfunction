execute unless data storage large_number:math list_ope_const_inp[1] run data modify storage large_number:math list_ope_const_inp set value [{x:0d,i:0d}]
execute if data storage large_number:math list_ope_const_inp[1] run function large_number:polynomial_n-th_derivative/c/loop1_next

scoreboard players remove #polynomial_n-th_derivative.n large_number.int 1
execute if score #polynomial_n-th_derivative.n large_number.int matches 1.. run function large_number:polynomial_n-th_derivative/c/loop1
