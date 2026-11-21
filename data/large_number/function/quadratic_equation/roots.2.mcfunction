scoreboard players set #X_squ_equ.roots large_number.int 2

execute store result storage large_number:math temp1 int 1 run scoreboard players operation #inp large_number.int = #X_squ_equ.delta large_number.int
execute if score #X_squ_equ.delta large_number.int matches 1..9 run scoreboard players operation #inp large_number.int *= 100000000 const
execute if score #X_squ_equ.delta large_number.int matches 10..999 run scoreboard players operation #inp large_number.int *= 1000000 const
execute if score #X_squ_equ.delta large_number.int matches 1000..99999 run scoreboard players operation #inp large_number.int *= 10000 const
execute if score #X_squ_equ.delta large_number.int matches 100000..9999999 run scoreboard players operation #inp large_number.int *= 100 const

execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int store result score #6.1 large_number.int run scoreboard players operation #X_squ_equ.squdelta large_number.int = #inp large_number.int
scoreboard players operation #X_squ_equ.squdelta large_number.int /= 32768 const
execute unless score #inp large_number.int matches 0 run scoreboard players add #X_squ_equ.squdelta large_number.int 2456
scoreboard players operation #t1 large_number.int /= #X_squ_equ.squdelta large_number.int
scoreboard players operation #X_squ_equ.squdelta large_number.int += #t1 large_number.int
scoreboard players operation #X_squ_equ.squdelta large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #X_squ_equ.squdelta large_number.int
scoreboard players operation #X_squ_equ.squdelta large_number.int += #t2 large_number.int
scoreboard players operation #X_squ_equ.squdelta large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #X_squ_equ.squdelta large_number.int
scoreboard players operation #X_squ_equ.squdelta large_number.int += #t3 large_number.int
scoreboard players operation #X_squ_equ.squdelta large_number.int /= 2 const
scoreboard players operation #inp large_number.int /= #X_squ_equ.squdelta large_number.int
execute if score #X_squ_equ.squdelta large_number.int > #inp large_number.int run scoreboard players remove #X_squ_equ.squdelta large_number.int 1

execute store result score #7.1 large_number.int store result score #6.5 large_number.int store result score #6.3 large_number.int run scoreboard players operation #6.2 large_number.int = #X_squ_equ.squdelta large_number.int

#估值算法
scoreboard players operation #6.2 large_number.int *= #6.2 large_number.int
scoreboard players operation #6.1 large_number.int -= #6.2 large_number.int
scoreboard players operation #6.1 large_number.int *= 10000 const
scoreboard players operation #7.1 large_number.int *= 2 const
scoreboard players add #7.1 large_number.int 1
scoreboard players operation #6.1 large_number.int /= #7.1 large_number.int

scoreboard players operation #X_squ_equ.squdelta large_number.int *= 10000 const
scoreboard players operation #X_squ_equ.squdelta large_number.int += #6.1 large_number.int

execute if score #X_squ_equ.delta large_number.int matches 0..9 run scoreboard players operation #X_squ_equ.squdelta large_number.int /= 10000 const
execute if score #X_squ_equ.delta large_number.int matches 10..999 run scoreboard players operation #X_squ_equ.squdelta large_number.int /= 1000 const
execute if score #X_squ_equ.delta large_number.int matches 1000..99999 run scoreboard players operation #X_squ_equ.squdelta large_number.int /= 100 const
execute if score #X_squ_equ.delta large_number.int matches 100000..9999999 run scoreboard players operation #X_squ_equ.squdelta large_number.int /= 10 const


scoreboard players operation #stemp2 large_number.int = #X_squ_equ.b large_number.int
scoreboard players operation #stemp1 large_number.int = #X_squ_equ.a large_number.int
execute store result storage large_number:math temp2 int 1 run scoreboard players operation #stemp2 large_number.int *= -1 const
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #stemp1 large_number.int *= 2 const
execute if score #stemp2 large_number.int matches 0 run data modify storage large_number:math temp2 set value ""

# delta：#X_squ_equ.delta，-b：#stemp2 large_number.int，2a：#stemp1 large_number.int

function large_number:quadratic_equation/roots.2.expression with storage large_number:math

execute store result score #stemp200 large_number.int run scoreboard players operation #stemp2 large_number.int *= 10000 const
scoreboard players operation #stemp2 large_number.int += #X_squ_equ.squdelta large_number.int
scoreboard players operation #stemp200 large_number.int -= #X_squ_equ.squdelta large_number.int
data modify storage large_number:math quadratic_equation_out.double set value [0.0d,0.0d]
execute store result storage large_number:math quadratic_equation_out.double[0] double 0.0001 store result score #X_squ_equ.x1 large_number.int run scoreboard players operation #stemp2 large_number.int /= #stemp1 large_number.int
execute store result storage large_number:math quadratic_equation_out.double[1] double 0.0001 store result score #X_squ_equ.x2 large_number.int run scoreboard players operation #stemp200 large_number.int /= #stemp1 large_number.int
