#获得线段中点
data modify storage large_number:math sstemp1 set from storage large_number:math temp_lnb_points[0]
data modify storage large_number:math sstemp2 set from storage large_number:math temp_lnb_points[1]
execute store result score #b1 int run data get storage large_number:math sstemp2[0] 100
execute store result score #b2 int run data get storage large_number:math sstemp2[1] 100
execute store result score #b3 int run data get storage large_number:math sstemp2[2] 100
execute store result score #temp_x int run data get storage large_number:math sstemp1[0] 100
execute store result score #temp_y int run data get storage large_number:math sstemp1[1] 100
execute store result score #temp_z int run data get storage large_number:math sstemp1[2] 100
scoreboard players operation #temp_x int += #b1 int
scoreboard players operation #temp_y int += #b2 int
scoreboard players operation #temp_z int += #b3 int
scoreboard players operation #temp_x int /= 2 const
scoreboard players operation #temp_y int /= 2 const
scoreboard players operation #temp_z int /= 2 const


#把中点坐标加上一些随机值作为偏移量。

#Ethan提供的立方体随机法。
#若采用向量角随机则会导致偏移量不断累加产生无限远离初始两点的折线，而立方体随机法即使最差的情况也不会让闪电无限远离初始两点。
#给出两点A和B，以AB的中点o为中心作平行于xyz坐标的立方体。立方体的边长的一半是k*|AB|，k的范围是[0,0.5]。设立方体的半径为u，让o的坐标都加上[-u,u]范围的随机值即可实现立方体偏移。

#k*|AB|得到随机数的上下限
execute store result storage large_number:math temp_k double .0001 run scoreboard players get #lightning_bolt.k int
execute store result storage large_number:math q0 int 1 run scoreboard players get #distance int
execute store result score #uniform_distribution.max int run function large_number:particle/lightning_bolt_instant/1/macro2_k with storage large_number:math
scoreboard players operation #uniform_distribution.max*2 int = #uniform_distribution.max int
scoreboard players operation #uniform_distribution.max*2 int *= 2 const

#随机Δx
execute store result score #temp9 int run random value 0..2147483646
scoreboard players operation #temp9 int %= #uniform_distribution.max*2 int
scoreboard players operation #temp9 int -= #uniform_distribution.max int
execute store result storage large_number:math buffer_all_xyz[0] double .01 run scoreboard players operation #temp_x int += #temp9 int

#随机Δy
execute store result score #temp9 int run random value 0..2147483646
scoreboard players operation #temp9 int %= #uniform_distribution.max*2 int
scoreboard players operation #temp9 int -= #uniform_distribution.max int
execute store result storage large_number:math buffer_all_xyz[1] double .01 run scoreboard players operation #temp_y int += #temp9 int

#随机Δz
execute store result score #temp9 int run random value 0..2147483646
scoreboard players operation #temp9 int %= #uniform_distribution.max*2 int
scoreboard players operation #temp9 int -= #uniform_distribution.max int
execute store result storage large_number:math buffer_all_xyz[2] double .01 run scoreboard players operation #temp_z int += #temp9 int

#把得到的中点坐标加到输入的列表里以备作重复检查
data modify storage large_number:math temp_lnb_points insert 1 from storage large_number:math buffer_all_xyz
