#取出被减数的后最后两个数、减数的最后一个数，作减法后把差存结果列表里，把被减数的倒数第二个数存列表里。
#然后把被减数和减数都去掉一个数以继续递归，这就是递归减。
execute store result score #u1 lan.pi_information run data get storage large_number:pi_information temp1[-2]
execute store result score #u2 lan.pi_information run data get storage large_number:pi_information temp1[-1]
execute store result score #v2 lan.pi_information run data get storage large_number:pi_information temp2[-1]

execute if score #u2 lan.pi_information < #v2 lan.pi_information run scoreboard players remove #u1 lan.pi_information 1
execute if score #u2 lan.pi_information < #v2 lan.pi_information run scoreboard players add #u2 lan.pi_information 10000
execute store result storage large_number:pi_information stemp2 int 1 run scoreboard players operation #u2 lan.pi_information -= #v2 lan.pi_information
execute store result storage large_number:pi_information stemp1 int 1 run scoreboard players get #u1 lan.pi_information
data remove storage large_number:pi_information temp1[-1]
data remove storage large_number:pi_information temp1[-1]
data modify storage large_number:pi_information temp1 append from storage large_number:pi_information stemp1
data modify storage large_number:pi_information temp9 prepend from storage large_number:pi_information stemp2
data remove storage large_number:pi_information temp2[-1]
execute if data storage large_number:pi_information temp1[-2] run function large_number:ope_pi/loop_subra/loop3.1
