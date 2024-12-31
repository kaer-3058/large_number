##解析二次函数的表达式为点的相对坐标

#一千倍输入系数abc，一百倍输入起始x值，输入步数，一百倍输入步长
#scoreboard players set #coef.a int 1200
#scoreboard players set #coef.b int 3100
#scoreboard players set #coef.c int -5200
#scoreboard players set #parabola_expre_x.start int 1540
#scoreboard players set #parabola_expre_x.length int 100
#scoreboard players set #parabola_expre_x.step_size int 10

data modify storage large_number:math parabola_expre_x set value []
data modify storage large_number:math parabola_expre_y set value []
scoreboard players operation #store_parabola_expre_x.start int = #parabola_expre_x.start int
scoreboard players operation #store_parabola_expre_x.length int = #parabola_expre_x.length int
scoreboard players reset #store_parabola_expre_y int
scoreboard players set #parabola_mathstep int 0

execute if score #store_parabola_expre_x.length int matches 1.. run function large_number:parabola/loop

execute if score #parabola_.tellraw int matches 1 run function large_number:parabola/tellraw

tellraw @a {"translate":"large_number.parabola.end","fallback":"\u00A77抛物线解析完成"}

#知道什么比魔法更酷吗？是数学！ ——《蜘蛛侠·英雄无归》


#tellraw @a ["f(x)=",{"nbt":"parabola_tellraw.a","storage":"large_number:math"},"x²",{"nbt":"parabola_tellraw.1","storage":"large_number:math"},{"nbt":"parabola_tellraw.b","storage":"large_number:math"},"x",{"nbt":"parabola_tellraw.2","storage":"large_number:math"},{"nbt":"parabola_tellraw.c","storage":"large_number:math"}]

#data modify entity @e[tag=display,limit=1] text set value '["f(x)=",{"nbt":"parabola_tellraw.a","storage":"large_number:math"},"x²",{"nbt":"parabola_tellraw.1","storage":"large_number:math"},{"nbt":"parabola_tellraw.b","storage":"large_number:math"},"x",{"nbt":"parabola_tellraw.2","storage":"large_number:math"},{"nbt":"parabola_tellraw.c","storage":"large_number:math"}]'
