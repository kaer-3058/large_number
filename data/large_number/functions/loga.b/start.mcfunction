##换底公式计算log.a(b)

#底数：scoreboard players set #loga.b_a int 5
#真数：scoreboard players set #loga.b_b int 12

#ln(b)
scoreboard players operation #loga.b.tempinp int = #loga.b_b int

execute if score #loga.b.tempinp int matches 1..59874 run function large_number:loga.b/ln_inte/1..59874
execute if score #loga.b.tempinp int matches 59875..2147483647 run function large_number:loga.b/ln_inte/59875..2147483647

execute if score #loga.b.tempinp int matches 1..10000 store result storage math temp int 1.0 run scoreboard players get #loga.b.tempinp int
execute if score #loga.b.tempinp int matches 1..10000 run function large_number:loga.b/1..10000 with storage math
execute if score #loga.b.tempinp int matches 10001.. run function large_number:loga.b/10001..

scoreboard players operation #loga.b.tempinte int *= 10000 const
execute store result score #store_loga.b.ln(b) int store result score #loga.b.ln(b) int run scoreboard players operation #loga.b.tempinte int += #loga.b.tempdicimal int


#ln(a)
scoreboard players operation #loga.b.tempinp int = #loga.b_a int

execute if score #loga.b.tempinp int matches 1..59874 run function large_number:loga.b/ln_inte/1..59874
execute if score #loga.b.tempinp int matches 59875..2147483647 run function large_number:loga.b/ln_inte/59875..2147483647

execute if score #loga.b.tempinp int matches 1..10000 store result storage math temp int 1.0 run scoreboard players get #loga.b.tempinp int
execute if score #loga.b.tempinp int matches 1..10000 run function large_number:loga.b/1..10000 with storage math
execute if score #loga.b.tempinp int matches 10001.. run function large_number:loga.b/10001..

scoreboard players operation #loga.b.tempinte int *= 10000 const
execute store result score #store_loga.b.ln(a) int store result score #loga.b.ln(a) int run scoreboard players operation #loga.b.tempinte int += #loga.b.tempdicimal int


#除法

execute if score #store_loga.b.ln(b) int matches 0..9 run scoreboard players set #ln_expon int -3
execute if score #store_loga.b.ln(b) int matches 0..9 run scoreboard players operation #loga.b.ln(b) int *= 10000000 const
execute if score #store_loga.b.ln(b) int matches 10..99 run scoreboard players set #ln_expon int -2
execute if score #store_loga.b.ln(b) int matches 10..99 run scoreboard players operation #loga.b.ln(b) int *= 1000000 const
execute if score #store_loga.b.ln(b) int matches 100..999 run scoreboard players set #ln_expon int -1
execute if score #store_loga.b.ln(b) int matches 100..999 run scoreboard players operation #loga.b.ln(b) int *= 100000 const
execute if score #store_loga.b.ln(b) int matches 1000..9999 run scoreboard players set #ln_expon int 0
execute if score #store_loga.b.ln(b) int matches 1000..9999 run scoreboard players operation #loga.b.ln(b) int *= 10000 const
execute if score #store_loga.b.ln(b) int matches 10000..99999 run scoreboard players set #ln_expon int 1
execute if score #store_loga.b.ln(b) int matches 10000..99999 run scoreboard players operation #loga.b.ln(b) int *= 1000 const
execute if score #store_loga.b.ln(b) int matches 100000..999999 run scoreboard players set #ln_expon int 2
execute if score #store_loga.b.ln(b) int matches 100000..999999 run scoreboard players operation #loga.b.ln(b) int *= 100 const

execute if score #store_loga.b.ln(a) int matches 0..9 run scoreboard players set #ln_e_expon int -3
execute if score #store_loga.b.ln(a) int matches 0..9 run scoreboard players operation #loga.b.ln(a) int *= 10000000 const
execute if score #store_loga.b.ln(a) int matches 10..99 run scoreboard players set #ln_e_expon int -2
execute if score #store_loga.b.ln(a) int matches 10..99 run scoreboard players operation #loga.b.ln(a) int *= 1000000 const
execute if score #store_loga.b.ln(a) int matches 100..999 run scoreboard players set #ln_e_expon int -1
execute if score #store_loga.b.ln(a) int matches 100..999 run scoreboard players operation #loga.b.ln(a) int *= 100000 const
execute if score #store_loga.b.ln(a) int matches 1000..9999 run scoreboard players set #ln_e_expon int 0
execute if score #store_loga.b.ln(a) int matches 1000..9999 run scoreboard players operation #loga.b.ln(a) int *= 10000 const
execute if score #store_loga.b.ln(a) int matches 10000..99999 run scoreboard players set #ln_e_expon int 1
execute if score #store_loga.b.ln(a) int matches 10000..99999 run scoreboard players operation #loga.b.ln(a) int *= 1000 const
execute if score #store_loga.b.ln(a) int matches 100000..999999 run scoreboard players set #ln_e_expon int 2
execute if score #store_loga.b.ln(a) int matches 100000..999999 run scoreboard players operation #loga.b.ln(a) int *= 100 const

#载入被除数
execute store result score #temp1 int run scoreboard players operation #temp2 int = #loga.b.ln(b) int
scoreboard players operation #temp1 int /= 10000 const
scoreboard players operation #temp2 int %= 10000 const

#载入除数
execute store result score #stemp9 int store result score #temp3 int run scoreboard players operation #temp4 int = #loga.b.ln(a) int
scoreboard players operation #temp3 int /= 10000 const
scoreboard players operation #temp4 int %= 10000 const

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
execute store result storage math temp2 int 1.0 run scoreboard players operation #ln_expon int -= #ln_e_expon int


scoreboard players operation #temp1 int *= 10000 const
execute store result storage math temp1 int 1.0 run scoreboard players operation #temp1 int += #temp2 int
function large_number:loga.b/craft with storage math
execute if score #stemp9 int matches 0 run data modify storage math "log.a(b).output" set value 9.99E400
execute store result score #loga.b.inte int store result score #stemp1 int run data get storage math "log.a(b).output"
execute if score #stemp1 int matches 0..9 run scoreboard players operation #stemp1 int *= 10000000 const
execute if score #stemp1 int matches 10..99 run scoreboard players operation #stemp1 int *= 1000000 const

execute store result score #loga.b.dicimal int run scoreboard players operation #temp1 int -= #stemp1 int
execute if score #stemp9 int matches 0 run scoreboard players set #loga.b.dicimal int 0
execute if score #loga.b.inte int matches 1..9 run scoreboard players operation #loga.b.dicimal int *= 10 const
execute if score #loga.b.inte int matches 10..99 run scoreboard players operation #loga.b.dicimal int *= 100 const
execute if score #loga.b.inte int matches 0 if score #ln_expon int matches -1 run scoreboard players operation #loga.b.dicimal int /= 10 const
