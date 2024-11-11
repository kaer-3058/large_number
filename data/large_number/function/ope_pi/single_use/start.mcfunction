##计算圆周率π

#位数：scoreboard players set #ope_pi.digit int 20
#理论上最高支持107373位

#原理：https://zhuanlan.zhihu.com/p/114320417

#我们mcf也有自己的计算π的算法了

execute store result score #length lan.pi_information run scoreboard players operation #temp1 lan.pi_information = #ope_pi.digit int
execute store result score #temp3 lan.pi_information store result score #temp2 lan.pi_information run scoreboard players add #temp1 lan.pi_information 8

#生成x1
data modify storage large_number:pi_information temp_x1 set value []
execute if score #temp1 lan.pi_information matches 5.. run function large_number:ope_pi/single_use/loop1
execute if score #temp1 lan.pi_information matches 4 run data modify storage large_number:pi_information temp_x1 prepend value 8000
execute if score #temp1 lan.pi_information matches 3 run data modify storage large_number:pi_information temp_x1 prepend value 800
execute if score #temp1 lan.pi_information matches 2 run data modify storage large_number:pi_information temp_x1 prepend value 80
execute if score #temp1 lan.pi_information matches 1 run data modify storage large_number:pi_information temp_x1 prepend value 8
data modify storage large_number:pi_information temp_s1 set from storage large_number:pi_information temp_x1

#生成x2
data modify storage large_number:pi_information temp_x2 set value []
execute if score #temp2 lan.pi_information matches 29.. run function large_number:ope_pi/single_use/loop2
execute if score #temp2 lan.pi_information matches 1 run data modify storage large_number:pi_information temp1 set value [1000]
execute if score #temp2 lan.pi_information matches 2 run data modify storage large_number:pi_information temp1 set value [100]
execute if score #temp2 lan.pi_information matches 3 run data modify storage large_number:pi_information temp1 set value [50]
execute if score #temp2 lan.pi_information matches 4 run data modify storage large_number:pi_information temp1 set value [42]
execute if score #temp2 lan.pi_information matches 5 run data modify storage large_number:pi_information temp1 set value [41,9000]
execute if score #temp2 lan.pi_information matches 6 run data modify storage large_number:pi_information temp1 set value [41,8500]
execute if score #temp2 lan.pi_information matches 7 run data modify storage large_number:pi_information temp1 set value [41,8420]
execute if score #temp2 lan.pi_information matches 8 run data modify storage large_number:pi_information temp1 set value [41,8411]
execute if score #temp2 lan.pi_information matches 9 run data modify storage large_number:pi_information temp1 set value [41,8410,1000]
execute if score #temp2 lan.pi_information matches 10 run data modify storage large_number:pi_information temp1 set value [41,8410,50]
execute if score #temp2 lan.pi_information matches 11 run data modify storage large_number:pi_information temp1 set value [41,8410,420]
execute if score #temp2 lan.pi_information matches 12 run data modify storage large_number:pi_information temp1 set value [41,8410,419]
execute if score #temp2 lan.pi_information matches 13 run data modify storage large_number:pi_information temp1 set value [41,8410,418,5000]
execute if score #temp2 lan.pi_information matches 14 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4200]
execute if score #temp2 lan.pi_information matches 15 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4110]
execute if score #temp2 lan.pi_information matches 16 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4101]
execute if score #temp2 lan.pi_information matches 17 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,5000]
execute if score #temp2 lan.pi_information matches 18 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,420]
execute if score #temp2 lan.pi_information matches 19 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4190]
execute if score #temp2 lan.pi_information matches 20 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4185]
execute if score #temp2 lan.pi_information matches 21 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4184,200]
execute if score #temp2 lan.pi_information matches 22 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4184,110]
execute if score #temp2 lan.pi_information matches 23 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4184,1010]
execute if score #temp2 lan.pi_information matches 24 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4184,1005]
execute if score #temp2 lan.pi_information matches 25 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4184,1004,2000]
execute if score #temp2 lan.pi_information matches 26 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4184,1004,1900]
execute if score #temp2 lan.pi_information matches 27 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4184,1004,1850]
execute if score #temp2 lan.pi_information matches 28 run data modify storage large_number:pi_information temp1 set value [41,8410,418,4100,4184,1004,1842]
execute if score #temp2 lan.pi_information matches 1.. run data modify storage large_number:pi_information temp_x2 append from storage large_number:pi_information temp1[]
scoreboard players operation #temp3 lan.pi_information %= 4 const
scoreboard players set #large_list_div_const.divisor lan.pi_information 0
execute if score #temp3 lan.pi_information matches 1 run scoreboard players set #large_list_div_const.divisor lan.pi_information 1000
execute if score #temp3 lan.pi_information matches 2 run scoreboard players set #large_list_div_const.divisor lan.pi_information 100
execute if score #temp3 lan.pi_information matches 3 run scoreboard players set #large_list_div_const.divisor lan.pi_information 10
data modify storage large_number:pi_information sstemp1 set from storage large_number:pi_information temp_x2
execute if score #large_list_div_const.divisor lan.pi_information matches 1.. run function large_number:ope_pi/single_use/large_list_div_const/start
execute if score #large_list_div_const.divisor lan.pi_information matches 1.. run data modify storage large_number:pi_information temp_x2 set from storage large_number:pi_information sstemp2
data modify storage large_number:pi_information temp_s2 set from storage large_number:pi_information temp_x2

#算法核心，级数求和
scoreboard players operation #length lan.pi_information *= 2 const
scoreboard players remove #length lan.pi_information 1
scoreboard players operation #length lan.pi_information /= 2 const

scoreboard players set #loops lan.pi_information 1
data modify storage large_number:pi_information stemp_sum_list set value []
function large_number:ope_pi/single_use/loop_each_item
scoreboard players set #loops lan.pi_information 1
execute if data storage large_number:pi_information stemp_sum_list[1] run function large_number:ope_pi/single_use/loop_sum

#三部分相加

#递归减
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information temp_s1
data modify storage large_number:pi_information temp2 set from storage large_number:pi_information temp_s2
data modify storage large_number:pi_information temp9 set value []
execute if data storage large_number:pi_information temp1[-2] run function large_number:ope_pi/loop_subra/loop3.1
execute if data storage large_number:pi_information temp1[-1] run function large_number:ope_pi/loop_subra/loop3.2
data modify storage large_number:pi_information temp1 set from storage large_number:pi_information temp9

#递归减
data modify storage large_number:pi_information temp2 set from storage large_number:pi_information stemp_sum_list[0]
data modify storage large_number:pi_information temp9 set value []
execute if data storage large_number:pi_information temp1[-2] run function large_number:ope_pi/loop_subra/loop3.1
execute if data storage large_number:pi_information temp1[-1] run function large_number:ope_pi/loop_subra/loop3.2
data modify storage large_number:pi_information sstemp1 set from storage large_number:pi_information temp9

#s*4
data modify storage large_number:pi_information sstemp2 set value []
execute if data storage large_number:pi_information sstemp1[0] run function large_number:ope_pi/single_use/loop_s4

#进位
data modify storage large_number:pi_information sstemp3 set value []
execute if data storage large_number:pi_information sstemp2[1] run function large_number:ope_pi/single_use/loop_s4.2
execute if data storage large_number:pi_information sstemp2[0] run function large_number:ope_pi/single_use/loop_s4.3

#去掉前导0
execute store result score #temp1 lan.pi_information run data get storage large_number:pi_information sstemp3[0]
execute if score #temp1 lan.pi_information matches 0 if data storage large_number:pi_information sstemp3[1] run function large_number:ope_pi/single_use/s4_del_leading_zeros

#去掉最后8位并转化为字符串
data remove storage large_number:pi_information sstemp3[-1]
data remove storage large_number:pi_information sstemp3[-1]
data modify storage large_number:pi_information pi set value []
execute if data storage large_number:pi_information sstemp3[1] run function large_number:ope_pi/single_use/loop_to_string
data modify storage large_number:pi_information temp1 set string storage large_number:pi_information sstemp3[0]
data modify storage large_number:pi_information pi prepend from storage large_number:pi_information temp1


tellraw @a [{"text":"[\u00A7e卡儿的数学库\u00A7r]\n圆周率π ["},{"score":{"name":"#ope_pi.digit","objective":"int"}},{"text":"位]：\n"},{"nbt":"pi[]","storage":"large_number:pi_information","separator":""}]
