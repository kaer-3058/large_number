##一元函数在[a,b]的图像

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取变量为ｘ。

#a (1000倍)：scoreboard players set #fourier_series_numerical_particle.a int -7000
#b (1000倍)：scoreboard players set #fourier_series_numerical_particle.b int 7000
#步长 (1000倍)：scoreboard players set #fourier_series_numerical_particle.step int 200
#[a,b]区间不应超出函数实际允许的输入值范围

data modify storage large_number:math fourier_series_numerical_particle_Pos set value []

data modify storage large_number:math temp_xy set value [0.0,0.0]
scoreboard players operation #loop1 int = #fourier_series_numerical_particle.a int
execute unless score #loop1 int > #fourier_series_numerical_particle.b int run function large_number:fourier_series_numerical/particle/loop1


execute if score #fourier_series_numerical.tell_mode int matches 1..2 run tellraw @a {"translate":"large_number.fourier_series_numerical_particle.end","fallback":"\u00A77\u00A7o傅里叶级数展开式的图像绘制完成"}
