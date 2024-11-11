##星形线 - P范数定义

#半径：scoreboard players set #star_line.r int 50000
#粒子间距：scoreboard players set #star_line.step int 2000
#横滚角：scoreboard players set #star_line.roll int 100000
#P：scoreboard players set #star_line.p int 5000
#除了横滚角都必须是正数，皆放大一万倍输入

#四个顶点
data modify storage large_number:math star_line_Pos set value [[0d,0d],[0d,0d],[0d,0d],[0d,0d]]
execute store result storage large_number:math stemp1 double .0001 run scoreboard players get #star_line.r int
data modify storage large_number:math exp_any.input.base set from storage large_number:math stemp1
data modify storage large_number:math star_line_Pos[0][0] set from storage large_number:math stemp1
data modify storage large_number:math star_line_Pos[2][1] set from storage large_number:math stemp1
execute store result storage large_number:math stemp1 double -.0001 run scoreboard players get #star_line.r int
data modify storage large_number:math star_line_Pos[1][0] set from storage large_number:math stemp1
data modify storage large_number:math star_line_Pos[3][1] set from storage large_number:math stemp1
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/star_line/as_entity_2

#r^p
execute store result storage large_number:math exp_any.input.expon double .0001 run scoreboard players get #star_line.p int
function large_number:exp_any/2
data modify storage large_number:math temp_r_p set from storage large_number:math exp_any.output

#分界点，r/(2^(1/p))
function large_number:particle/star_line/int_div_8deci
data modify storage large_number:math exp_e^x.input set from storage large_number:math int_more_decimal_out
function large_number:exp_e.x/2
data modify storage large_number:math float_division.input2 set from storage large_number:math exp_e^x.output
execute store result storage large_number:math float_division.input1 double .0001 run scoreboard players get #star_line.r int
function large_number:division/float/start
execute store result score #temp_cut.point int run data get storage large_number:math float_division.output 10000

scoreboard players operation #loop int = #temp_cut.point int
execute if score #star_line.p int matches ..10000 run function large_number:particle/star_line/loop1

scoreboard players operation #loop int = #star_line.step int
scoreboard players operation #temp_cut.point int += #star_line.step int
execute if score #star_line.p int matches 10001.. run function large_number:particle/star_line/loop2
