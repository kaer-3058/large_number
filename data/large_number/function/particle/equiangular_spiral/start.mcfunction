##等角螺线 (对数螺线)

#a：scoreboard players set #equiangular_spiral.a int 5000
#b：scoreboard players set #equiangular_spiral.b int 560
#1000倍输入起始半径：scoreboard players set #equiangular_spiral.start_r int 0
#1000倍输入半径步长：scoreboard players set #equiangular_spiral.r_size int 50
#步数：scoreboard players set #equiangular_spiral.length int 250

#公式：θ=a*ln(b*r)

data modify storage large_number:math equiangular_spiral_out_listX set value []
data modify storage large_number:math equiangular_spiral_out_listY set value []

scoreboard players operation #start_r int = #equiangular_spiral.start_r int
scoreboard players operation #store_loops int = #equiangular_spiral.length int
tp b09e-44-fded-6-efa5ffffef64 .0 .0 .0 .0 .0

execute if score #store_loops int matches 1.. run function large_number:particle/equiangular_spiral/loop

tp b09e-44-fded-6-efa5ffffef64 .0 .0 .0 .0 .0
