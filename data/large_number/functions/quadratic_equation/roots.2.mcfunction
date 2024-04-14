scoreboard players set #X_squ_equ.roots int 2

execute store result storage math temp1 int 1 run scoreboard players operation #inp int = #X_squ_equ.delta int
execute if score #X_squ_equ.delta int matches 1..9 run scoreboard players operation #inp int *= 100000000 const
execute if score #X_squ_equ.delta int matches 10..999 run scoreboard players operation #inp int *= 1000000 const
execute if score #X_squ_equ.delta int matches 1000..99999 run scoreboard players operation #inp int *= 10000 const
execute if score #X_squ_equ.delta int matches 100000..9999999 run scoreboard players operation #inp int *= 100 const

execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #6.1 int run scoreboard players operation #X_squ_equ.squdelta int = #inp int
scoreboard players operation #X_squ_equ.squdelta int /= 32768 const
execute unless score #inp int matches 0 run scoreboard players add #X_squ_equ.squdelta int 2456
scoreboard players operation #t1 int /= #X_squ_equ.squdelta int
scoreboard players operation #X_squ_equ.squdelta int += #t1 int
scoreboard players operation #X_squ_equ.squdelta int /= 2 const
scoreboard players operation #t2 int /= #X_squ_equ.squdelta int
scoreboard players operation #X_squ_equ.squdelta int += #t2 int
scoreboard players operation #X_squ_equ.squdelta int /= 2 const
scoreboard players operation #t3 int /= #X_squ_equ.squdelta int
scoreboard players operation #X_squ_equ.squdelta int += #t3 int
scoreboard players operation #X_squ_equ.squdelta int /= 2 const
scoreboard players operation #inp int /= #X_squ_equ.squdelta int
execute if score #X_squ_equ.squdelta int > #inp int run scoreboard players remove #X_squ_equ.squdelta int 1

execute store result score #7.1 int store result score #6.5 int store result score #6.3 int run scoreboard players operation #6.2 int = #X_squ_equ.squdelta int

#估值算法
scoreboard players operation #6.2 int *= #6.2 int
scoreboard players operation #6.1 int -= #6.2 int
scoreboard players operation #6.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
scoreboard players operation #6.1 int /= #7.1 int

scoreboard players operation #X_squ_equ.squdelta int *= 10000 const
scoreboard players operation #X_squ_equ.squdelta int += #6.1 int

execute if score #X_squ_equ.delta int matches 0..9 run scoreboard players operation #X_squ_equ.squdelta int /= 10000 const
execute if score #X_squ_equ.delta int matches 10..999 run scoreboard players operation #X_squ_equ.squdelta int /= 1000 const
execute if score #X_squ_equ.delta int matches 1000..99999 run scoreboard players operation #X_squ_equ.squdelta int /= 100 const
execute if score #X_squ_equ.delta int matches 100000..9999999 run scoreboard players operation #X_squ_equ.squdelta int /= 10 const


scoreboard players operation #stemp2 int = #X_squ_equ.b int
scoreboard players operation #stemp1 int = #X_squ_equ.a int
execute store result storage math temp2 int 1 run scoreboard players operation #stemp2 int *= -1 const
execute store result storage math temp3 int 1 run scoreboard players operation #stemp1 int *= 2 const
execute if score #stemp2 int matches 0 run data modify storage math temp2 set value ""

# delta：#X_squ_equ.delta，-b：#stemp2 int，2a：#stemp1 int

function large_number:quadratic_equation/roots.2.expression with storage math

execute store result score #stemp200 int run scoreboard players operation #stemp2 int *= 10000 const
scoreboard players operation #stemp2 int += #X_squ_equ.squdelta int
scoreboard players operation #stemp200 int -= #X_squ_equ.squdelta int
data modify storage math quadratic_equation_out.double set value [0.0d,0.0d]
execute store result storage math quadratic_equation_out.double[0] double 0.0001 store result score #X_squ_equ.x1 int run scoreboard players operation #stemp2 int /= #stemp1 int
execute store result storage math quadratic_equation_out.double[1] double 0.0001 store result score #X_squ_equ.x2 int run scoreboard players operation #stemp200 int /= #stemp1 int
