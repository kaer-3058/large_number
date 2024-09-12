##三维空间任意方向的椭圆

#1000倍输入 a：#3d.ellipse.a int [1,2147483]
#1000倍输入 b：#3d.ellipse.b int [1,2147483]

#粒子密度：#3d.ellipse.density int
#粒子密度就是每n次迭代描一个点，范围为1~3600

#横滚角(1000倍输入)：#3d.ellipse.roll.θ int

#计算坐标：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_ellipse/start

#显示粒子：execute positioned x y z rotated x y run function large_number:particle/3d_ar_ellipse/particle
#执行朝向就是椭圆的朝向，执行位置就是椭圆的位置

tp @s 0.0 0.0 0.0 90.0 0.0

scoreboard players operation #store_3d.ellipse.a int = #3d.ellipse.a int
scoreboard players operation #store_3d.ellipse.b int = #3d.ellipse.b int
execute if score #store_3d.ellipse.a int > #store_3d.ellipse.b int run scoreboard players operation #store_3d.ellipse.a int >< #store_3d.ellipse.b int

scoreboard players operation #b/a int = #store_3d.ellipse.b int
scoreboard players operation #b/a int *= 1000 const
scoreboard players operation #b/a int /= #store_3d.ellipse.a int

execute store result storage large_number:math temp_r double .001 run scoreboard players get #store_3d.ellipse.a int
execute store result storage large_number:math temp_rn double .001 run scoreboard players get #3d.ellipse.roll.θ int

data modify storage large_number:math 3d_ar_ellipse_pos set value []
execute store result entity @s Rotation[1] float -0.1 run scoreboard players set #loop int 3600
function large_number:particle/3d_ar_ellipse/loop

execute store result entity @s Rotation[1] float 0.001 run scoreboard players get #3d.ellipse.roll.θ int
execute positioned 0.0 0.0 0.0 rotated as @s rotated 90.0 ~ run function large_number:particle/3d_ar_ellipse/scan

tp .0 .0 .0
