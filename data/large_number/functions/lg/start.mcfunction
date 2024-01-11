

scoreboard players operation #loga.b.tempinp int = #lg(x) int

execute if score #loga.b.tempinp int matches 1..59874 run function large_number:loga.b/ln_inte/1..59874
execute if score #loga.b.tempinp int matches 59875..2147483647 run function large_number:loga.b/ln_inte/59875..2147483647

execute if score #loga.b.tempinp int matches 1..10000 store result storage math temp int 1.0 run scoreboard players get #loga.b.tempinp int
execute if score #loga.b.tempinp int matches 1..10000 run function large_number:loga.b/1..10000 with storage math
execute if score #loga.b.tempinp int matches 10001.. run function large_number:loga.b/10001..

scoreboard players operation #loga.b.tempinte int *= 10000 const
execute store result score #store_lg(x)_ln(x) int store result score #lg(x)_ln(x) int run scoreboard players operation #loga.b.tempinte int += #loga.b.tempdicimal int


execute if score #store_lg(x)_ln(x) int matches 0..9 run scoreboard players set #ln_expon int -3
execute if score #store_lg(x)_ln(x) int matches 0..9 run scoreboard players operation #lg(x)_ln(x) int *= 10000000 const
execute if score #store_lg(x)_ln(x) int matches 10..99 run scoreboard players set #ln_expon int -2
execute if score #store_lg(x)_ln(x) int matches 10..99 run scoreboard players operation #lg(x)_ln(x) int *= 1000000 const
execute if score #store_lg(x)_ln(x) int matches 100..999 run scoreboard players set #ln_expon int -1
execute if score #store_lg(x)_ln(x) int matches 100..999 run scoreboard players operation #lg(x)_ln(x) int *= 100000 const
execute if score #store_lg(x)_ln(x) int matches 1000..9999 run scoreboard players set #ln_expon int 0
execute if score #store_lg(x)_ln(x) int matches 1000..9999 run scoreboard players operation #lg(x)_ln(x) int *= 10000 const
execute if score #store_lg(x)_ln(x) int matches 10000..99999 run scoreboard players set #ln_expon int 1
execute if score #store_lg(x)_ln(x) int matches 10000..99999 run scoreboard players operation #lg(x)_ln(x) int *= 1000 const
execute if score #store_lg(x)_ln(x) int matches 100000..999999 run scoreboard players set #ln_expon int 2
execute if score #store_lg(x)_ln(x) int matches 100000..999999 run scoreboard players operation #lg(x)_ln(x) int *= 100 const


#载入被除数
execute store result score #temp1 int run scoreboard players operation #temp2 int = #lg(x)_ln(x) int
scoreboard players operation #temp1 int /= 10000 const
scoreboard players operation #temp2 int %= 10000 const

#载入除数
scoreboard players set #temp3 int 2302
scoreboard players set #temp4 int 5850

#由万进制节计算除数和被除数
scoreboard players operation #temp1 int *= 10000 const
scoreboard players operation #temp1 int += #temp2 int
scoreboard players operation #temp1 int *= 10 const
scoreboard players operation #sstempd int = #temp3 int
scoreboard players operation #sstempd int *= 10000 const
scoreboard players operation #sstempd int += #temp4 int

#计算结果前后4位精度
scoreboard players operation #sstemp0 int = #sstempd int
scoreboard players operation #sstempd int /= 25 const
scoreboard players operation #sstemp0 int %= 25 const
scoreboard players operation #sstemp1 int = #temp1 int
scoreboard players operation #temp1 int /= #sstempd int
scoreboard players operation #temp1 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #temp2 int = #sstemp1 int
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #temp1 int += #sstemp1 int
scoreboard players operation #temp2 int %= #sstempd int
scoreboard players operation #temp2 int *= 25 const
scoreboard players operation #sstemp2 int = #sstemp0 int
scoreboard players operation #sstemp2 int *= #temp1 int
scoreboard players operation #temp2 int -= #sstemp2 int
scoreboard players operation #temp2 int *= 10 const
scoreboard players operation #sstemp1 int = #temp2 int
scoreboard players operation #temp2 int /= #sstempd int
scoreboard players operation #temp2 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #temp2 int += #sstemp1 int

#对齐小数点
execute if score #temp1 int matches 10000.. run function large_number:division/hpo/ln/div_align

#指数
execute store result storage math temp2 int 1.0 run scoreboard players remove #ln_expon int 1


scoreboard players operation #temp1 int *= 10000 const
scoreboard players operation #temp1 int += #temp2 int
execute if score #lg(x) int matches 10 run scoreboard players set #temp1 int 10000000
execute if score #lg(x) int matches 100 run scoreboard players set #temp1 int 20000000
execute if score #lg(x) int matches 1000 run scoreboard players set #temp1 int 30000000
execute if score #lg(x) int matches 10000 run scoreboard players set #temp1 int 40000000
execute if score #lg(x) int matches 100000 run scoreboard players set #temp1 int 50000000
execute if score #lg(x) int matches 1000000 run scoreboard players set #temp1 int 60000000
execute if score #lg(x) int matches 10000000 run scoreboard players set #temp1 int 70000000
execute if score #lg(x) int matches 100000000 run scoreboard players set #temp1 int 80000000
execute if score #lg(x) int matches 1000000000 run scoreboard players set #temp1 int 90000000

execute store result storage math temp1 int 1.0 store result score #lg(x)_out_dicimal int run scoreboard players get #temp1 int
function large_number:lg/craft with storage math
execute store result score #lg(x)_out_inte int run data get storage math lg(x)_output
execute if score #lg(x)_out_inte int matches 1..9 run scoreboard players operation #lg(x)_out_dicimal int %= 10000000 const
execute if score #lg(x)_out_inte int matches 1..9 run scoreboard players operation #lg(x)_out_dicimal int *= 10 const
