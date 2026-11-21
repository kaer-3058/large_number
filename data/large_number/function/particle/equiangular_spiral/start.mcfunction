##等角螺线 (对数螺线)

#a：scoreboard players set #equiangular_spiral.a large_number.int 5000
#b：scoreboard players set #equiangular_spiral.b large_number.int 560
#1000倍输入起始半径：scoreboard players set #equiangular_spiral.start_r large_number.int 0
#1000倍输入半径步长：scoreboard players set #equiangular_spiral.r_size large_number.int 50
#步数：scoreboard players set #equiangular_spiral.length large_number.int 250

#公式：θ=a*ln(b*r)

data modify storage large_number:math equiangular_spiral_out_listX set value []
data modify storage large_number:math equiangular_spiral_out_listY set value []

scoreboard players operation #start_r large_number.int = #equiangular_spiral.start_r large_number.int
scoreboard players operation #store_loops large_number.int = #equiangular_spiral.length large_number.int
tp b09e-44-fded-6-efa5ffffef64 .0 .0 .0 .0 .0

execute if score #store_loops large_number.int matches 1.. run function large_number:particle/equiangular_spiral/loop
