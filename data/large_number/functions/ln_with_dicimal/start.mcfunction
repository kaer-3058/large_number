##带小数的ln(x)
#限取前九位(整数部分+小数部分一共九位)，若整数部分达到了九位则只取整数部分，数值范围为区间：[1,2147483647]
#输入：data modify storage math ln_with_dicimal.input set value 12.745d

execute store result score #temp1 int run data get storage math ln_with_dicimal.input
execute if score #temp1 int matches 0 store success storage math temp1 int 207232 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 1000000000
execute if score #temp1 int matches 1..9 store success storage math temp1 int 184206 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 100000000
execute if score #temp1 int matches 10..99 store success storage math temp1 int 161180 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 10000000
execute if score #temp1 int matches 100..999 store success storage math temp1 int 138155 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 1000000
execute if score #temp1 int matches 1000..9999 store success storage math temp1 int 115129 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 100000
execute if score #temp1 int matches 10000..99999 store success storage math temp1 int 92103 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 10000
execute if score #temp1 int matches 100000..999999 store success storage math temp1 int 69077 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 1000
execute if score #temp1 int matches 1000000..9999999 store success storage math temp1 int 46051 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 100
execute if score #temp1 int matches 10000000..99999999 store success storage math temp1 int 23025 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input 10
execute if score #temp1 int matches 100000000.. store success storage math temp1 int 0 store result score #loga.b.tempinp int run data get storage math ln_with_dicimal.input

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
execute store result storage math ln_with_dicimal.output double 0.0001 store result score #ln_with_dicimal.output int run scoreboard players operation #loga.b.output int -= #subtract_ln(10^n) int
