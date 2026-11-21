##对浮点数取ln(x)
#输入：data modify storage large_number:math ln_double.input set value 12.745d

#转化为字符串
data modify storage large_number:math temp1 set string storage large_number:math ln_double.input 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #ln_double.expon large_number.int run function large_number:ln_double/craft.1 with storage large_number:math
execute store result storage large_number:math ln_la_temp5 double 2.30258509299404568401799145 run scoreboard players get #ln_double.expon large_number.int

execute store result score #temp1 large_number.int run data get storage large_number:math ln_la_temp3
execute if score #temp1 large_number.int matches 0 run function large_number:ln_double/input_is_0
execute if score #temp1 large_number.int matches 1..9 store success storage large_number:math temp1 int 184206 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3 100000000
execute if score #temp1 large_number.int matches 10..99 store success storage large_number:math temp1 int 161180 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3 10000000
execute if score #temp1 large_number.int matches 100..999 store success storage large_number:math temp1 int 138155 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3 1000000
execute if score #temp1 large_number.int matches 1000..9999 store success storage large_number:math temp1 int 115129 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3 100000
execute if score #temp1 large_number.int matches 10000..99999 store success storage large_number:math temp1 int 92103 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3 10000
execute if score #temp1 large_number.int matches 100000..999999 store success storage large_number:math temp1 int 69077 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3 1000
execute if score #temp1 large_number.int matches 1000000..9999999 store success storage large_number:math temp1 int 46051 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3 100
execute if score #temp1 large_number.int matches 10000000..99999999 store success storage large_number:math temp1 int 23025 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3 10
execute if score #temp1 large_number.int matches 100000000.. store success storage large_number:math temp1 int 0 store result score #loga.b.tempinp large_number.int run data get storage large_number:math ln_la_temp3

execute store result score #subtract_ln(10^n) large_number.int run data get storage large_number:math temp1

execute if score #loga.b.tempinp large_number.int matches ..178482300 run scoreboard players set #loga.b.tempinte large_number.int 18
execute if score #loga.b.tempinp large_number.int matches 178482301..485165195 run scoreboard players set #loga.b.tempinte large_number.int 19
execute if score #loga.b.tempinp large_number.int matches 485165196..1318815734 run scoreboard players set #loga.b.tempinte large_number.int 20
execute if score #loga.b.tempinp large_number.int matches 1318815735.. run scoreboard players set #loga.b.tempinte large_number.int 21

execute store result storage large_number:math temp int 0.36787944117144200 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.13533528323661300 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.04978706836786390 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.01831563888873420 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00673794699908547 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00247875217666636 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00091188196555452 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00033546262790251 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00012340980408668 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00004539992976248 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00001670170079025 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00000614421235333 run scoreboard players get #loga.b.tempinp large_number.int
execute store result score #temp1 large_number.int run data get storage large_number:math temp
execute if score #temp1 large_number.int matches 10001.. store result storage large_number:math temp int 0.00000226032940698 run scoreboard players get #loga.b.tempinp large_number.int

execute store result score #loga.b.output large_number.int run function large_number:loga.b/1..10000 with storage large_number:math
scoreboard players operation #loga.b.output large_number.int %= 10000 const
scoreboard players operation #loga.b.tempinte large_number.int *= 10000 const
scoreboard players operation #loga.b.output large_number.int += #loga.b.tempinte large_number.int

#ln(7.25)=ln(725/100)=ln(725)-ln(100)
scoreboard players operation #loga.b.output large_number.int -= #subtract_ln(10^n) large_number.int

#ln(7.45*10^26)=ln(7.45)+26*ln(10)
execute store result score #ln_double.output large_number.int run data get storage large_number:math ln_la_temp5 10000
execute store result storage large_number:math ln_double.output double 0.0001 run scoreboard players operation #ln_double.output large_number.int += #loga.b.output large_number.int
