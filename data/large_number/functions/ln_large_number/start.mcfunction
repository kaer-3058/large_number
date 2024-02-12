##对极大数或极小数求自然对数 (解double或float的科学记数法形式)

#输入值必须为大于等于10000000或小于等于0.0001的double型或float型
#公式：ln(7.45*10^26)=ln(7.45)+26*ln(10)
#输入：data modify storage math ln_large_number.input set value 8.2184074E307d

data modify storage math ln_la_temp1 set string storage math ln_large_number.input 0 -1

#判断是否为科学计数法
data modify storage math temp2 set string storage math ln_la_temp1 -5 -4
data modify storage math temp3 set string storage math ln_la_temp1 -4 -3
data modify storage math temp4 set string storage math ln_la_temp1 -3 -2
data modify storage math temp5 set string storage math ln_la_temp1 -2 -1

execute store success score #5.1 int if data storage math {temp2:"E"}
execute store success score #5.2 int if data storage math {temp3:"E"}
execute store success score #5.3 int if data storage math {temp4:"E"}
execute store success score #5.4 int if data storage math {temp5:"E"}

execute if score #5.1 int matches 1 run data modify storage math ln_la_temp_expon set string storage math ln_la_temp1 -4
execute if score #5.2 int matches 1 run data modify storage math ln_la_temp_expon set string storage math ln_la_temp1 -3
execute if score #5.3 int matches 1 run data modify storage math ln_la_temp_expon set string storage math ln_la_temp1 -2
execute if score #5.4 int matches 1 run data modify storage math ln_la_temp_expon set string storage math ln_la_temp1 -1
execute if score #5.1 int matches 1 run data modify storage math ln_la_temp1 set string storage math ln_la_temp1 0 -5
execute if score #5.2 int matches 1 run data modify storage math ln_la_temp1 set string storage math ln_la_temp1 0 -4
execute if score #5.3 int matches 1 run data modify storage math ln_la_temp1 set string storage math ln_la_temp1 0 -3
execute if score #5.4 int matches 1 run data modify storage math ln_la_temp1 set string storage math ln_la_temp1 0 -2

function large_number:ln_large_number/craft.1 with storage math
execute store result storage math ln_la_temp5 double 2.302585092994 run scoreboard players get #ln_large_number.expon int

execute store result score #temp1 int run data get storage math ln_la_temp3
execute if score #temp1 int matches 0 store success storage math temp1 int 207232 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 1000000000
execute if score #temp1 int matches 1..9 store success storage math temp1 int 184206 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 100000000
execute if score #temp1 int matches 10..99 store success storage math temp1 int 161180 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 10000000
execute if score #temp1 int matches 100..999 store success storage math temp1 int 138155 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 1000000
execute if score #temp1 int matches 1000..9999 store success storage math temp1 int 115129 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 100000
execute if score #temp1 int matches 10000..99999 store success storage math temp1 int 92103 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 10000
execute if score #temp1 int matches 100000..999999 store success storage math temp1 int 69077 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 1000
execute if score #temp1 int matches 1000000..9999999 store success storage math temp1 int 46051 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 100
execute if score #temp1 int matches 10000000..99999999 store success storage math temp1 int 23025 store result score #loga.b.tempinp int run data get storage math ln_la_temp3 10
execute if score #temp1 int matches 100000000.. store success storage math temp1 int 0 store result score #loga.b.tempinp int run data get storage math ln_la_temp3

execute store result score #subtract_ln(10^n) int run data get storage math temp1

execute if score #loga.b.tempinp int matches ..178482300 run scoreboard players set #loga.b.tempinte int 18
execute if score #loga.b.tempinp int matches 178482301..485165195 run scoreboard players set #loga.b.tempinte int 19
execute if score #loga.b.tempinp int matches 485165196..1318815734 run scoreboard players set #loga.b.tempinte int 20
execute if score #loga.b.tempinp int matches 1318815735.. run scoreboard players set #loga.b.tempinte int 21

execute store result storage math temp int 0.3678794411714 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.1353352832366 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0497870683679 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0183156388887 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0067379469991 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0024787521767 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0009118819656 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0003354626279 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0001234098041 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0000453999298 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0000167017008 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0000061442124 run scoreboard players get #loga.b.tempinp int
execute store result score #temp1 int run data get storage math temp
execute if score #temp1 int matches 10001.. store result storage math temp int 0.0000022603294 run scoreboard players get #loga.b.tempinp int

function large_number:loga.b/1..10000 with storage math
scoreboard players operation #loga.b.output int %= 10000 const
scoreboard players operation #loga.b.tempinte int *= 10000 const
scoreboard players operation #loga.b.output int += #loga.b.tempinte int

#ln(7.25)=ln(725/100)=ln(725)-ln(100)
scoreboard players operation #loga.b.output int -= #subtract_ln(10^n) int

execute store result score #ln_large_number.output int run data get storage math ln_la_temp5 10000
execute store result storage math ln_large_number.output double 0.0001 run scoreboard players operation #ln_large_number.output int += #loga.b.output int
