##阿基米德螺线

#1000倍输入a：scoreboard players set #archimedean_spiral.a large_number.int 100
#1000倍输入b：scoreboard players set #archimedean_spiral.b large_number.int 8
#100倍输入起始角度：scoreboard players set #archimedean_spiral.startθ large_number.int 0
#100倍输入弧长步长：scoreboard players set #archimedean_spiral.arc_size large_number.int 35
#100倍输入角度步长：scoreboard players set #archimedean_spiral.θ_size large_number.int 1000
#步数：scoreboard players set #archimedean_spiral.length large_number.int 200
#n步后使用弧长来计算点的间隔：scoreboard players set #archimedean_spiral.to_arc large_number.int 30

#公式：r=a+bθ

scoreboard players set #sstempd large_number.int 0
data modify storage large_number:math archimedean_spiral_out_listX set value []
data modify storage large_number:math archimedean_spiral_out_listY set value []

scoreboard players operation #store_startθ large_number.int = #archimedean_spiral.startθ large_number.int
scoreboard players operation #store_loops large_number.int = #archimedean_spiral.length large_number.int

execute if score #store_loops large_number.int matches 1.. run function large_number:particle/archimedean_spiral/loop
