##参数方程图像 - 多tick绘制法

#取参数变量为"ｔ"。

#输入逆波兰式：data modify storage large_number:math parametric_equation_particle.rev_polish_notation_X set value []
#data modify storage large_number:math parametric_equation_particle.rev_polish_notation_Y set value []

#输入t的范围：
#data modify storage large_number:math parametric_equation_particle.t_start set value 0.0
#data modify storage large_number:math parametric_equation_particle.t_end set value 6.283
#t的步长：data modify storage large_number:math parametric_equation_particle.t_step set value 0.1
#内部以一千倍放大存入int进行比较，因此允许的值的范围是：[-2147483, 2147483]
#注意t的范围不能超出函数允许的范围

#单tick递归次数(不可小于1)：scoreboard players set #parametric_equation_particle.loops int 5
#开始信号：scoreboard players set #parametric_equation_particle.start int 1

#绘制完成会在聊天框有提示
#若在此期间执行粒子显示函数，会看到函数图像逐渐出现的动画

#需要tick执行：function large_number:particle/parametric_equation/different_steps/tick

execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.parametric_equation_particle.ope.start","fallback": "\u00A77\u00A7o参数方程：图像开始绘制"}

data modify storage large_number:math parametric_equation_particle_Pos set value []
data modify storage large_number:math temp_xy set value [0.0,0.0]
execute store result score #parametric_equation_particle.t_start int run data get storage large_number:math parametric_equation_particle.t_start 1000
execute store result score #parametric_equation_particle.t_end int run data get storage large_number:math parametric_equation_particle.t_end 1000
execute store result score #parametric_equation_particle.t_step int run data get storage large_number:math parametric_equation_particle.t_step 1000

scoreboard players set #parametric_equation_particle.start int 2
