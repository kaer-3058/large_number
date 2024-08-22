scoreboard players operation #int_+dicimal.input1 int = #loop int
scoreboard players operation #int_+dicimal.input1 int *= 2 const
scoreboard players operation #int_+dicimal.input2 int = #heart-shaped_line.r int
function large_number:division/int_8dicimal/start
execute store result score #arcsin_cos.input int run data get storage large_number:math int_more_dicimal_out 10000
execute unless score #arcsin_cos.input int matches ..-1 run scoreboard players operation #arcsin_cos.input int *= -1 const
execute store result score #x int store result score #sstemp1 int run scoreboard players add #arcsin_cos.input int 10000
scoreboard players operation #sstemp1 int *= #sstemp1 int
scoreboard players operation #sstemp1 int *= -1 const
scoreboard players add #sstemp1 int 100000000

##反余弦 arccos(x)

#简易开根
execute store result score #t1 int store result score #t2 int store result score #t3 int run scoreboard players operation #y int = #sstemp1 int
execute if score #sstemp1 int matches 0..1515359 run scoreboard players operation #y int /= 559 const
execute if score #sstemp1 int matches 0..1515359 run scoreboard players add #y int 15
execute if score #sstemp1 int matches 1515360.. run scoreboard players operation #y int /= 32768 const
execute if score #sstemp1 int matches 1515360.. run scoreboard players add #y int 2456
scoreboard players operation #t1 int /= #y int
scoreboard players operation #y int += #t1 int
scoreboard players operation #y int /= 2 const
scoreboard players operation #t2 int /= #y int
scoreboard players operation #y int += #t2 int
scoreboard players operation #y int /= 2 const
scoreboard players operation #t3 int /= #y int
scoreboard players operation #y int += #t3 int
scoreboard players operation #y int /= 2 const

#atan2
execute store result storage large_number:math buffer_all_xyz[0] double -0.0001 run scoreboard players get #y int
execute store result storage large_number:math buffer_all_xyz[2] double 0.0001 run scoreboard players get #x int
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s .0 .0 .0 ~ ~


execute store result storage large_number:math temp2 int 0.174532925199432957692369 run data get entity @s Rotation[0] 10000000
execute store result score #arccos int run data get storage large_number:math temp2
execute store result storage large_number:math temp1 double 0.000000000001 run scoreboard players remove #arccos int 314159265
function large_number:particle/heart-shaped_line/macro2 with storage large_number:math
execute store result storage large_number:math sstemp0[0] double 0.0001 run scoreboard players get #loop int
data modify storage large_number:math heart-shaped_line_Pos append from storage large_number:math sstemp0

scoreboard players operation #loop int += #heart-shaped_line.t int
execute unless score #loop int > #heart-shaped_line.r int run function large_number:particle/heart-shaped_line/loop2
