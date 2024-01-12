scoreboard players set #X_squ_equ.roots int 2

execute store result storage math temp1 int 1 store result score #6.1 int run scoreboard players operation #inp int = #X_squ_equ.delta int
execute if score #X_squ_equ.delta int matches 1..9 store result score #6.1 int run scoreboard players operation #inp int *= 100000000 const
execute if score #X_squ_equ.delta int matches 10..999 store result score #6.1 int run scoreboard players operation #inp int *= 1000000 const
execute if score #X_squ_equ.delta int matches 1000..99999 store result score #6.1 int run scoreboard players operation #inp int *= 10000 const
execute if score #X_squ_equ.delta int matches 100000..9999999 store result score #6.1 int run scoreboard players operation #inp int *= 100 const

execute store result score #1.0 int store result score #1.1 int run scoreboard players operation output.sqrt int = #inp int
execute if score #inp int matches 1..329475 run function large_number:simple_int_sqrt_range/int_sqrt/0
execute if score #inp int matches 329476..18688328 run function large_number:simple_int_sqrt_range/1
execute if score #inp int matches 18688329..533609999 run function large_number:simple_int_sqrt_range/2
execute if score #inp int matches 533610000.. run function large_number:simple_int_sqrt_range/3
scoreboard players operation #1.0 int /= output.sqrt int
scoreboard players operation output.sqrt int += #1.0 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #1.1 int /= output.sqrt int
scoreboard players operation output.sqrt int += #1.1 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation output.sqrt int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > #inp int run scoreboard players remove output.sqrt int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < #inp int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add output.sqrt int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > #inp int run scoreboard players remove output.sqrt int 1

execute store result score #7.1 int store result score #6.5 int store result score #6.3 int run scoreboard players operation #6.2 int = output.sqrt int

#估值算法
scoreboard players operation #6.2 int *= #6.2 int
scoreboard players operation #6.1 int -= #6.2 int
scoreboard players operation #6.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
scoreboard players operation #6.1 int /= #7.1 int

execute if score #X_squ_equ.delta int matches 1..9 run function large_number:int_sqrt_scb_tree/1-9
execute if score #X_squ_equ.delta int matches 10..999 run function large_number:int_sqrt_scb_tree/10-999
execute if score #X_squ_equ.delta int matches 1000..99999 run function large_number:int_sqrt_scb_tree/1000-99999
execute if score #X_squ_equ.delta int matches 100000..9999999 run function large_number:int_sqrt_scb_tree/100000-9999999
execute if score #X_squ_equ.delta int matches 10..9999999 store result score output.dicimal int run scoreboard players operation #6.5 int += #6.1 int

execute unless score #X_squ_equ.delta int matches 1..9999999 run scoreboard players operation output.dicimal int = #6.1 int


scoreboard players operation #X_squ_equ.squdelta int = output.sqrt int
scoreboard players operation #X_squ_equ.squdelta int *= 10000 const
scoreboard players operation #X_squ_equ.squdelta int += output.dicimal int

scoreboard players operation #stemp2 int = #X_squ_equ.b int
scoreboard players operation #stemp1 int = #X_squ_equ.a int
execute store result storage math temp2 int 1 run scoreboard players operation #stemp2 int *= -1 const
execute store result storage math temp3 int 1 run scoreboard players operation #stemp1 int *= 2 const

# delta：#X_squ_equ.delta，-b：#stemp2 int，2a：#stemp1 int

function large_number:quadratic_equation/roots.2.expression with storage math

execute store result score #stemp200 int run scoreboard players operation #stemp2 int *= 10000 const
scoreboard players operation #stemp2 int += #X_squ_equ.squdelta int
scoreboard players operation #stemp200 int -= #X_squ_equ.squdelta int
data modify storage math quadratic_equation_out.double set value [0.0d,0.0d]
execute store result storage math quadratic_equation_out.double[0] double 0.0001 store result score #X_squ_equ.x1 int run scoreboard players operation #stemp2 int /= #stemp1 int
execute store result storage math quadratic_equation_out.double[1] double 0.0001 store result score #X_squ_equ.x2 int run scoreboard players operation #stemp200 int /= #stemp1 int
