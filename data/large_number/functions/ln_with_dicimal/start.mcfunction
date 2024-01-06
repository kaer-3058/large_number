##带小数的ln(x)
#限取前九位(整数部分+小数部分一共九位)，若整数部分达到了九位则只取整数部分，数值范围为区间：[1,2147483647]
#输入：data modify storage math ln_with_dicimal.input set value 12.745d

execute store result score #temp1 int run data get storage math ln_with_dicimal.input
execute if score #temp1 int matches 0 store success storage math temp2 int 20 store success storage math temp1 int 7232 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 1000000000
execute if score #temp1 int matches 1..9 store success storage math temp2 int 18 store success storage math temp1 int 4206 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 100000000
execute if score #temp1 int matches 10..99 store success storage math temp2 int 16 store success storage math temp1 int 1180 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 10000000
execute if score #temp1 int matches 100..999 store success storage math temp2 int 13 store success storage math temp1 int 8155 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 1000000
execute if score #temp1 int matches 1000..9999 store success storage math temp2 int 11 store success storage math temp1 int 5129 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 100000
execute if score #temp1 int matches 10000..99999 store success storage math temp2 int 9 store success storage math temp1 int 2103 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 10000
execute if score #temp1 int matches 100000..999999 store success storage math temp2 int 6 store success storage math temp1 int 9077 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 1000
execute if score #temp1 int matches 1000000..9999999 store success storage math temp2 int 4 store success storage math temp1 int 6051 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 100
execute if score #temp1 int matches 10000000..99999999 store success storage math temp2 int 2 store success storage math temp1 int 3025 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input 10
execute if score #temp1 int matches 100000000.. store success storage math temp2 int 0 store success storage math temp1 int 0 store result score #kuoda_ln_wd.inp int run data get storage math ln_with_dicimal.input

execute store result score #subtract_inte int run data get storage math temp2
execute store result score #subtract_dicimal int run data get storage math temp1
scoreboard players operation #subtract_inte int *= 10000 const
scoreboard players operation #subtract_inte int += #subtract_dicimal int


scoreboard players operation #loga.b.tempinp int = #kuoda_ln_wd.inp int

execute if score #loga.b.tempinp int matches 1..59874 run function large_number:loga.b/ln_inte/1..59874
execute if score #loga.b.tempinp int matches 59875..2147483647 run function large_number:loga.b/ln_inte/59875..2147483647

execute if score #loga.b.tempinp int matches 1..10000 store result storage math temp int 1.0 run scoreboard players get #loga.b.tempinp int
execute if score #loga.b.tempinp int matches 1..10000 run function large_number:loga.b/1..10000 with storage math
execute if score #loga.b.tempinp int matches 10001.. run function large_number:loga.b/10001..

#loga.b.tempinte int
#loga.b.tempdicimal int

scoreboard players operation #loga.b.tempinte int *= 10000 const
scoreboard players operation #loga.b.tempinte int += #loga.b.tempdicimal int

#ln(7.25)=ln(725/100)=ln(725)-ln(100)
execute store result score #ln_wd.out.inte int store result score #ln_wd.out.dicimal int run scoreboard players operation #loga.b.tempinte int -= #subtract_inte int

#取绝对值再相除
data modify storage math temp5 set value ""
execute if score #ln_wd.out.inte int matches ..-1 run data modify storage math temp5 set value "-"
execute if score #ln_wd.out.inte int matches ..-1 run scoreboard players operation #ln_wd.out.inte int *= -1 const
execute if score #ln_wd.out.dicimal int matches ..-1 run scoreboard players operation #ln_wd.out.dicimal int *= -1 const

execute store result storage math temp3 int 1 run scoreboard players operation #ln_wd.out.inte int /= 10000 const
execute store result storage math temp4 int 1 run scoreboard players operation #ln_wd.out.dicimal int %= 10000 const

function large_number:ln_with_dicimal/craft with storage math
