###欧拉角转四元数
#算法来源：T算法库 t_algorithm_lib:maths/angle2quat/_start

#欧拉角：第一个是横滚(roll)，第二个是俯仰(pitch)，第三个是偏航(yaw)

#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:quaternion/euler_angles_to_xyzw
#输入：data modify storage large_number:math euler_angles_input set value [0.0,0.0,0.0]
#输出：data get storage large_number:math xyzw

#角度/2 + 获取对应的cos，sin (世界实体)
execute store result score #euler_angles.x large_number.int run data get storage large_number:math euler_angles_input[0] 1000
execute store result score #euler_angles.y large_number.int run data get storage large_number:math euler_angles_input[1] 1000
execute store result score #euler_angles.z large_number.int run data get storage large_number:math euler_angles_input[2] 1000

execute store result entity @s Rotation[0] float -0.001 run scoreboard players operation #euler_angles.x large_number.int /= 2 const
execute rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~
execute store result score #euler_angles.x.sin large_number.int run data get entity @s Pos[2] 1000
execute store result score #euler_angles.x.cos large_number.int run data get entity @s Pos[0] 1000

execute store result entity @s Rotation[0] float -0.001 run scoreboard players operation #euler_angles.y large_number.int /= 2 const
execute rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~
execute store result score #euler_angles.y.sin large_number.int run data get entity @s Pos[2] 1000
execute store result score #euler_angles.y.cos large_number.int run data get entity @s Pos[0] 1000

execute store result entity @s Rotation[0] float -0.001 run scoreboard players operation #euler_angles.z large_number.int /= 2 const
execute rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~
execute store result score #euler_angles.z.sin large_number.int run data get entity @s Pos[2] 1000
execute store result score #euler_angles.z.cos large_number.int run data get entity @s Pos[0] 1000

# q3 = cos(x/2)*cos(y/2)*cos(z/2) + sin(x/2)*sin(y/2)*sin(z/2)
scoreboard players operation #euler_angles.q large_number.int = #euler_angles.x.cos large_number.int
scoreboard players operation #euler_angles.q large_number.int *= #euler_angles.y.cos large_number.int
scoreboard players operation #euler_angles.q large_number.int *= #euler_angles.z.cos large_number.int
scoreboard players operation #euler_angles.q_ large_number.int = #euler_angles.x.sin large_number.int
scoreboard players operation #euler_angles.q_ large_number.int *= #euler_angles.y.sin large_number.int
scoreboard players operation #euler_angles.q_ large_number.int *= #euler_angles.z.sin large_number.int
execute store result storage large_number:math xyzw[3] float 0.000000001 run scoreboard players operation #euler_angles.q large_number.int += #euler_angles.q_ large_number.int

# q2 = sin(x/2)*cos(y/2)*cos(z/2) - cos(x/2)*sin(y/2)*sin(z/2)
scoreboard players operation #euler_angles.q large_number.int = #euler_angles.x.sin large_number.int
scoreboard players operation #euler_angles.q large_number.int *= #euler_angles.y.cos large_number.int
scoreboard players operation #euler_angles.q large_number.int *= #euler_angles.z.cos large_number.int
scoreboard players operation #euler_angles.q_ large_number.int = #euler_angles.x.cos large_number.int
scoreboard players operation #euler_angles.q_ large_number.int *= #euler_angles.y.sin large_number.int
scoreboard players operation #euler_angles.q_ large_number.int *= #euler_angles.z.sin large_number.int
execute store result storage large_number:math xyzw[2] float -0.000000001 run scoreboard players operation #euler_angles.q large_number.int -= #euler_angles.q_ large_number.int

# q0 = cos(x/2)*sin(y/2)*cos(z/2) + sin(x/2)*cos(y/2)*sin(z/2)
scoreboard players operation #euler_angles.q large_number.int = #euler_angles.x.cos large_number.int
scoreboard players operation #euler_angles.q large_number.int *= #euler_angles.y.sin large_number.int
scoreboard players operation #euler_angles.q large_number.int *= #euler_angles.z.cos large_number.int
scoreboard players operation #euler_angles.q_ large_number.int = #euler_angles.x.sin large_number.int
scoreboard players operation #euler_angles.q_ large_number.int *= #euler_angles.y.cos large_number.int
scoreboard players operation #euler_angles.q_ large_number.int *= #euler_angles.z.sin large_number.int
execute store result storage large_number:math xyzw[0] float -0.000000001 run scoreboard players operation #euler_angles.q large_number.int += #euler_angles.q_ large_number.int

# q1 = cos(x/2)*cos(y/2)*sin(z/2) - sin(x/2)*sin(y/2)*cos(z/2)
scoreboard players operation #euler_angles.q large_number.int = #euler_angles.x.cos large_number.int
scoreboard players operation #euler_angles.q large_number.int *= #euler_angles.y.cos large_number.int
scoreboard players operation #euler_angles.q large_number.int *= #euler_angles.z.sin large_number.int
scoreboard players operation #euler_angles.q_ large_number.int = #euler_angles.x.sin large_number.int
scoreboard players operation #euler_angles.q_ large_number.int *= #euler_angles.y.sin large_number.int
scoreboard players operation #euler_angles.q_ large_number.int *= #euler_angles.z.cos large_number.int
execute store result storage large_number:math xyzw[1] float 0.000000001 run scoreboard players operation #euler_angles.q large_number.int -= #euler_angles.q_ large_number.int
