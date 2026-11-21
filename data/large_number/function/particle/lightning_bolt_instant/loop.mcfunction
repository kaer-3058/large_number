#获得起始两点的坐标差
data modify storage large_number:math sstemp1 set from storage large_number:math temp_lnb_points[0]
data modify storage large_number:math sstemp2 set from storage large_number:math temp_lnb_points[1]
execute store result score #distance large_number.int run data get storage large_number:math sstemp2[0] 100
execute store result score #v.y large_number.int run data get storage large_number:math sstemp2[1] 100
execute store result score #v.z large_number.int run data get storage large_number:math sstemp2[2] 100
execute store result score #a1 large_number.int run data get storage large_number:math sstemp1[0] 100
execute store result score #a2 large_number.int run data get storage large_number:math sstemp1[1] 100
execute store result score #a3 large_number.int run data get storage large_number:math sstemp1[2] 100
execute store result storage large_number:math s0[0] double .01 run scoreboard players operation #distance large_number.int -= #a1 large_number.int
execute store result storage large_number:math s0[1] double .01 run scoreboard players operation #v.y large_number.int -= #a2 large_number.int
execute store result storage large_number:math s0[2] double .01 run scoreboard players operation #v.z large_number.int -= #a3 large_number.int

#把坐标差取绝对值，用单位向量法进行测距
execute if score #distance large_number.int matches ..-1 run scoreboard players operation #distance large_number.int *= -1 const
execute if score #v.y large_number.int matches ..-1 run scoreboard players operation #v.y large_number.int *= -1 const
execute if score #v.z large_number.int matches ..-1 run scoreboard players operation #v.z large_number.int *= -1 const
execute store result storage large_number:math buffer_all_xyz[0] double .0001 run scoreboard players get #distance large_number.int
execute store result storage large_number:math buffer_all_xyz[1] double .0001 run scoreboard players get #v.y large_number.int
execute store result storage large_number:math buffer_all_xyz[2] double .0001 run scoreboard players get #v.z large_number.int

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/lightning_bolt_instant/unit_vector_for_distance_modu
execute store result score #i.x large_number.int run data get storage large_number:math buffer_all_xyz[0] 1000
execute store result score #i.y large_number.int run data get storage large_number:math buffer_all_xyz[1] 1000
execute store result score #i.z large_number.int run data get storage large_number:math buffer_all_xyz[2] 1000
scoreboard players operation #distance large_number.int += #v.y large_number.int
execute store result score #temp1 large_number.int run scoreboard players operation #distance large_number.int += #v.z large_number.int
scoreboard players operation #i.x large_number.int += #i.y large_number.int
scoreboard players operation #i.x large_number.int += #i.z large_number.int
scoreboard players operation #distance large_number.int /= #i.x large_number.int
scoreboard players operation #distance large_number.int *= 1000 const
scoreboard players operation #temp1 large_number.int %= #i.x large_number.int
scoreboard players operation #temp1 large_number.int *= 1000 const
scoreboard players operation #temp1 large_number.int /= #i.x large_number.int
scoreboard players operation #distance large_number.int += #temp1 large_number.int

#如果两点距离大于给定值则取中点作偏移，否则把第一点挪到结果列表
execute if score #distance large_number.int > #lightning_bolt.a_segment large_number.int run function large_number:particle/lightning_bolt_instant/1/start
execute unless score #distance large_number.int > #lightning_bolt.a_segment large_number.int run function large_number:particle/lightning_bolt_instant/loop.unless
execute if data storage large_number:math temp_lnb_points[1] run function large_number:particle/lightning_bolt_instant/loop
