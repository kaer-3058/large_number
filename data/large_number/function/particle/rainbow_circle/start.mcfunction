##彩虹圆
#圆的半径：#3d.circle.r int
#粒子密度：#3d.circle.angle int
#执行：function large_number:particle/rainbow_circle/start

data modify storage large_number:math rainbow_circle_color set value []
scoreboard players set #loop int 3600
function large_number:particle/rainbow_circle/loop
