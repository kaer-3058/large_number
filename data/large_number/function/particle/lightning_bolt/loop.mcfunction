#获得起始两点的坐标差
data modify storage large_number:math sstemp1 set from storage large_number:math temp_lnb_points[0]
data modify storage large_number:math sstemp2 set from storage large_number:math temp_lnb_points[1]
execute store result score #distance int run data get storage large_number:math sstemp2[0] 100
execute store result score #v.y int run data get storage large_number:math sstemp2[1] 100
execute store result score #v.z int run data get storage large_number:math sstemp2[2] 100
execute store result score #a1 int run data get storage large_number:math sstemp1[0] 100
execute store result score #a2 int run data get storage large_number:math sstemp1[1] 100
execute store result score #a3 int run data get storage large_number:math sstemp1[2] 100
execute store result storage large_number:math s0[0] double .01 run scoreboard players operation #distance int -= #a1 int
execute store result storage large_number:math s0[1] double .01 run scoreboard players operation #v.y int -= #a2 int
execute store result storage large_number:math s0[2] double .01 run scoreboard players operation #v.z int -= #a3 int

#把坐标差取绝对值，用单位向量法进行测距
execute if score #distance int matches ..-1 run scoreboard players operation #distance int *= -1 const
execute if score #v.y int matches ..-1 run scoreboard players operation #v.y int *= -1 const
execute if score #v.z int matches ..-1 run scoreboard players operation #v.z int *= -1 const
execute store result storage large_number:math buffer_all_xyz[0] double .0001 run scoreboard players get #distance int
execute store result storage large_number:math buffer_all_xyz[1] double .0001 run scoreboard players get #v.y int
execute store result storage large_number:math buffer_all_xyz[2] double .0001 run scoreboard players get #v.z int

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/lightning_bolt/unit_vector_for_distance_modu
execute store result score #i.x int run data get storage large_number:math buffer_all_xyz[0] 1000
execute store result score #i.y int run data get storage large_number:math buffer_all_xyz[1] 1000
execute store result score #i.z int run data get storage large_number:math buffer_all_xyz[2] 1000
scoreboard players operation #distance int += #v.y int
execute store result score #temp1 int run scoreboard players operation #distance int += #v.z int
scoreboard players operation #i.x int += #i.y int
scoreboard players operation #i.x int += #i.z int
scoreboard players operation #distance int /= #i.x int
scoreboard players operation #distance int *= 1000 const
scoreboard players operation #temp1 int %= #i.x int
scoreboard players operation #temp1 int *= 1000 const
scoreboard players operation #temp1 int /= #i.x int
scoreboard players operation #distance int += #temp1 int

#如果两点距离大于给定值则取中点作偏移，否则把第一点挪到结果列表
execute if score #distance int > #lightning_bolt.a_segment int run function large_number:particle/lightning_bolt/1/start
execute unless score #distance int > #lightning_bolt.a_segment int run data modify storage large_number:math lightning_bolt_Pos append from storage large_number:math temp_lnb_points[0]
execute unless score #distance int > #lightning_bolt.a_segment int run data remove storage large_number:math temp_lnb_points[0]
execute if data storage large_number:math temp_lnb_points[1] run function large_number:particle/lightning_bolt/loop
