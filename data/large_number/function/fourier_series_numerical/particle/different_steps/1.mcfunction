##一元函数在[a,b]的图像 - 多tick绘制法

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取变量为ｘ。

#a (1000倍)：scoreboard players set #fourier_series_numerical_particle.a large_number.int -7000
#b (1000倍)：scoreboard players set #fourier_series_numerical_particle.b large_number.int 7000
#步长 (1000倍)：scoreboard players set #fourier_series_numerical_particle.step large_number.int 200
#单tick递归次数(不可小于1)：scoreboard players set #fourier_series_numerical_particle.loops large_number.int 2
#开始信号：scoreboard players set #fourier_series_numerical_particle.start large_number.int 1
#[a,b]区间不应超出函数实际允许的输入值范围

#从x=a绘制到x=b，绘制完成会在聊天框有提示
#若在此期间执行粒子显示函数，会看到函数图像逐渐出现的动画

#需要tick执行：function large_number:fourier_series_numerical/particle/different_steps/tick

execute unless score #large_number.all_tellraw_set large_number.int matches 1 if score #fourier_series_numerical.tell_mode large_number.int matches 1..2 run tellraw @a {"translate":"large_number.fourier_series_numerical_particle.diff_start","fallback":"\u00A77\u00A7o傅里叶级数展开式的图像开始绘制"}

data modify storage large_number:math fourier_series_numerical_particle_Pos set value []

data modify storage large_number:math temp_xy set value [0.0,0.0]
scoreboard players operation #loop1 large_number.int = #fourier_series_numerical_particle.a large_number.int
scoreboard players set #fourier_series_numerical_particle.start large_number.int 2
