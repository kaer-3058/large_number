scoreboard players set #X_squ_equ.roots int 1

scoreboard players operation #stemp2 int = #X_squ_equ.b int
scoreboard players operation #stemp1 int = #X_squ_equ.a int
execute store result storage math temp1 int 1 run scoreboard players operation #stemp2 int *= -1 const
execute store result storage math temp2 int 1 run scoreboard players operation #stemp1 int *= 2 const

# -b：#stemp2 int，2a：#stemp1 int

function large_number:quadratic_equation/roots.1.expression with storage math

scoreboard players operation #stemp2 int *= 10000 const
execute store result storage math quadratic_equation_out.double double 0.0001 store result score #X_squ_equ.x2 int store result score #X_squ_equ.x1 int run scoreboard players operation #stemp2 int /= #stemp1 int
