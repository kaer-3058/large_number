scoreboard players set #X_squ_equ.roots large_number.int 1

scoreboard players operation #stemp2 large_number.int = #X_squ_equ.c large_number.int
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #stemp2 large_number.int *= -1 const
execute store result storage large_number:math temp2 int 1 run scoreboard players get #X_squ_equ.b large_number.int

# -c：#stemp2 large_number.int，b：#X_squ_equ.b large_number.int

function large_number:quadratic_equation/roots.1.expression with storage large_number:math

scoreboard players operation #stemp2 large_number.int *= 10000 const
execute store result storage large_number:math quadratic_equation_out.double double 0.0001 store result score #X_squ_equ.x2 large_number.int store result score #X_squ_equ.x1 large_number.int run scoreboard players operation #stemp2 large_number.int /= #X_squ_equ.b large_number.int
