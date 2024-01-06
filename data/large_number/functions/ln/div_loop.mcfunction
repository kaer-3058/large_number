#载入除数
execute store result score #temp3 int run data get storage math temp_listfront[0]
execute store result score #temp4 int run data get storage math temp_listbehind[0]
execute store result score #ln_e_expon int run data get storage math temp_listdivexpon[0]

#载入被除数
execute store result score #temp2 int run scoreboard players operation #temp1 int = #store_#ln(x) int
scoreboard players operation #temp1 int /= 10000 const
scoreboard players operation #temp2 int %= 10000 const
scoreboard players operation #ln_expon int = #temp_ln_expon int

#除法

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
execute store result storage math temp5 int 1.0 run scoreboard players operation #ln_expon int -= #ln_e_expon int

#测试除法结果大小，如果大于10000就滚动列表，继续除法
execute store result storage math temp3 int 1.0 run scoreboard players get #temp1 int
execute store result storage math temp4 int 1.0 run scoreboard players get #temp2 int
function large_number:ln/div.test_output with storage math
execute store result score #temp5 int run data get storage math temp6

execute if score #temp5 int matches 10001.. run data remove storage math temp_listfront[0]
execute if score #temp5 int matches 10001.. run data remove storage math temp_listbehind[0]
execute if score #temp5 int matches 10001.. run data remove storage math temp_listdivexpon[0]
execute if score #temp5 int matches 10001.. run function large_number:ln/div_loop
