#整合显示的json文本
data modify storage large_number:math parabola_tellraw.1 set value "+"
execute if score #coef.b large_number.int matches ..-1 run data modify storage large_number:math parabola_tellraw.1 set value ""
data modify storage large_number:math parabola_tellraw.2 set value "+"
execute if score #coef.c large_number.int matches ..-1 run data modify storage large_number:math parabola_tellraw.1 set value ""
execute store result storage large_number:math parabola_tellraw.a double 0.001 run scoreboard players get #coef.a large_number.int
execute store result storage large_number:math parabola_tellraw.b double 0.001 run scoreboard players get #coef.b large_number.int
execute store result storage large_number:math parabola_tellraw.c double 0.001 run scoreboard players get #coef.c large_number.int
data modify storage large_number:math parabola_tellraw.a set string storage large_number:math parabola_tellraw.a 0 -1
data modify storage large_number:math parabola_tellraw.b set string storage large_number:math parabola_tellraw.b 0 -1
data modify storage large_number:math parabola_tellraw.c set string storage large_number:math parabola_tellraw.c 0 -1
