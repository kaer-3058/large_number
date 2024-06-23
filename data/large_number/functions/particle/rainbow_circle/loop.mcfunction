execute if score #loop int matches 0..600 run function large_number:particle/rainbow_circle/ope_color/1
execute if score #loop int matches 601..1200 run function large_number:particle/rainbow_circle/ope_color/2
execute if score #loop int matches 1201..1800 run function large_number:particle/rainbow_circle/ope_color/3
execute if score #loop int matches 1801..2400 run function large_number:particle/rainbow_circle/ope_color/4
execute if score #loop int matches 2401..3000 run function large_number:particle/rainbow_circle/ope_color/5
execute if score #loop int matches 3001..3600 run function large_number:particle/rainbow_circle/ope_color/6
data modify storage large_number:math temp1 set value {R:0.0,G:0.0,B:0.0}
execute store result storage large_number:math temp1.R double 0.001 run scoreboard players get #R int
execute store result storage large_number:math temp1.G double 0.001 run scoreboard players get #G int
execute store result storage large_number:math temp1.B double 0.001 run scoreboard players get #B int
data modify storage large_number:math rainbow_circle_color append from storage large_number:math temp1

#递归
scoreboard players operation #loop int -= #3d.circle.angle int
execute if score #loop int matches 1.. run function large_number:particle/rainbow_circle/loop
