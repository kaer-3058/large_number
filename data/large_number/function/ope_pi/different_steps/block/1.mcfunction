##计算圆周率π

#位数：scoreboard players set #ope_pi.digit int 20
#理论上最高支持107373位

#原理：https://zhuanlan.zhihu.com/p/114320417

#我们mcf也有自己的计算π的算法了

execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.ope_pi.diff_start","fallback":"[圆周率 π]：开始分步计算圆周率..."}

execute store result score #length lan.pi_information run scoreboard players operation #temp1 lan.pi_information = #ope_pi.digit int
execute store result score #temp3 lan.pi_information store result score #temp2 lan.pi_information run scoreboard players add #temp1 lan.pi_information 8

#生成x1
data modify storage large_number:pi_information temp_x1 set value []
execute if score #temp1 lan.pi_information matches 5.. run function large_number:ope_pi/different_steps/loop1
execute if score #temp1 lan.pi_information matches 4 run data modify storage large_number:pi_information temp_x1 prepend value 8000
execute if score #temp1 lan.pi_information matches 3 run data modify storage large_number:pi_information temp_x1 prepend value 800
execute if score #temp1 lan.pi_information matches 2 run data modify storage large_number:pi_information temp_x1 prepend value 80
execute if score #temp1 lan.pi_information matches 1 run data modify storage large_number:pi_information temp_x1 prepend value 8
data modify storage large_number:pi_information temp_s1 set from storage large_number:pi_information temp_x1

#生成x2
data modify storage large_number:pi_information temp_x2 set value []
execute if score #temp2 lan.pi_information matches 29.. run function large_number:ope_pi/different_steps/loop2
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
execute if score #large_list_div_const.divisor lan.pi_information matches 1.. run function large_number:ope_pi/different_steps/large_list_div_const/start
execute if score #large_list_div_const.divisor lan.pi_information matches 1.. run data modify storage large_number:pi_information temp_x2 set from storage large_number:pi_information sstemp2
data modify storage large_number:pi_information temp_s2 set from storage large_number:pi_information temp_x2

#算法核心，级数求和
scoreboard players operation #length lan.pi_information *= 2 const
scoreboard players remove #length lan.pi_information 1
scoreboard players operation #length lan.pi_information /= 2 const

scoreboard players set #loops lan.pi_information 1
data modify storage large_number:pi_information stemp_sum_list set value []

#切模式用的计数模块
scoreboard players set #pi.block2.times lan.pi_information 0

scoreboard players add #pi.different_steps.mode lan.pi_information 1
