#选主元
#对只有少量元素的double列表，找出其最大值所在的列编号
data modify storage large_number:math stempd set value [{a:0,b:0},{a:0,b:1},{a:0,b:2},{a:0,b:3},{a:0,b:4},{a:0,b:5},{a:0,b:6},{a:0,b:7},{a:0,b:8},{a:0,b:9}]
data modify storage large_number:math stempd[0].a set from storage large_number:math store_det_input[0][0]
data modify storage large_number:math stempd[1].a set from storage large_number:math store_det_input[1][0]
data modify storage large_number:math stempd[2].a set from storage large_number:math store_det_input[2][0]
data modify storage large_number:math stempd[3].a set from storage large_number:math store_det_input[3][0]
data modify storage large_number:math stempd[4].a set from storage large_number:math store_det_input[4][0]
data modify storage large_number:math stempd[5].a set from storage large_number:math store_det_input[5][0]
data modify storage large_number:math stempd[6].a set from storage large_number:math store_det_input[6][0]
data modify storage large_number:math stempd[7].a set from storage large_number:math store_det_input[7][0]
data modify storage large_number:math stempd[8].a set from storage large_number:math store_det_input[8][0]
data modify storage large_number:math stempd[9].a set from storage large_number:math store_det_input[9][0]

data remove storage large_number:math stempd[{a:0}]

##double列表的最大值/最小值
#data modify storage large_number:math stempd set from storage large_number:math double_extrema.input
data modify storage large_number:math float_comparison_sizes.B set from storage large_number:math stempd[0].a
scoreboard players set #stempd_order int 0
execute if data storage large_number:math stempd[1] run function large_number:linear_equations/double_extrema/loop1
#data modify storage large_number:math double_extrema.output set from storage large_number:math float_comparison_sizes.B

data modify storage large_number:math store_det_input[-1] append from storage large_number:math store_vecb[-1]
data modify storage large_number:math store_det_input[-2] append from storage large_number:math store_vecb[-2]
data modify storage large_number:math store_det_input[-3] append from storage large_number:math store_vecb[-3]
data modify storage large_number:math store_det_input[-4] append from storage large_number:math store_vecb[-4]
data modify storage large_number:math store_det_input[-5] append from storage large_number:math store_vecb[-5]
data modify storage large_number:math store_det_input[-6] append from storage large_number:math store_vecb[-6]
data modify storage large_number:math store_det_input[-7] append from storage large_number:math store_vecb[-7]
data modify storage large_number:math store_det_input[-8] append from storage large_number:math store_vecb[-8]
data modify storage large_number:math store_det_input[-9] append from storage large_number:math store_vecb[-9]
data modify storage large_number:math store_det_input[-10] append from storage large_number:math store_vecb[-10]

data modify storage large_number:math temp1 set from storage large_number:math store_det_input[1]
execute if score #stempd_order int matches 1 run data modify storage large_number:math store_det_input[1] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 1 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[2]
execute if score #stempd_order int matches 2 run data modify storage large_number:math store_det_input[2] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 2 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[3]
execute if score #stempd_order int matches 3 run data modify storage large_number:math store_det_input[3] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 3 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[4]
execute if score #stempd_order int matches 4 run data modify storage large_number:math store_det_input[4] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 4 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[5]
execute if score #stempd_order int matches 5 run data modify storage large_number:math store_det_input[5] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 5 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[6]
execute if score #stempd_order int matches 6 run data modify storage large_number:math store_det_input[6] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 6 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[7]
execute if score #stempd_order int matches 7 run data modify storage large_number:math store_det_input[7] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 7 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[8]
execute if score #stempd_order int matches 8 run data modify storage large_number:math store_det_input[8] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 8 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1
data modify storage large_number:math temp1 set from storage large_number:math store_det_input[9]
execute if score #stempd_order int matches 9 run data modify storage large_number:math store_det_input[9] set from storage large_number:math store_det_input[0]
execute if score #stempd_order int matches 9 run data modify storage large_number:math store_det_input[0] set from storage large_number:math temp1

execute if score #stempd_order int matches 1.. run scoreboard players operation #temp_det_sign int *= -1 const

data modify storage large_number:math store_vecb[-1] set from storage large_number:math store_det_input[-1][-1]
data modify storage large_number:math store_vecb[-2] set from storage large_number:math store_det_input[-2][-1]
data modify storage large_number:math store_vecb[-3] set from storage large_number:math store_det_input[-3][-1]
data modify storage large_number:math store_vecb[-4] set from storage large_number:math store_det_input[-4][-1]
data modify storage large_number:math store_vecb[-5] set from storage large_number:math store_det_input[-5][-1]
data modify storage large_number:math store_vecb[-6] set from storage large_number:math store_det_input[-6][-1]
data modify storage large_number:math store_vecb[-7] set from storage large_number:math store_det_input[-7][-1]
data modify storage large_number:math store_vecb[-8] set from storage large_number:math store_det_input[-8][-1]
data modify storage large_number:math store_vecb[-9] set from storage large_number:math store_det_input[-9][-1]
data modify storage large_number:math store_vecb[-10] set from storage large_number:math store_det_input[-10][-1]
data remove storage large_number:math store_det_input[-1][-1]
data remove storage large_number:math store_det_input[-2][-1]
data remove storage large_number:math store_det_input[-3][-1]
data remove storage large_number:math store_det_input[-4][-1]
data remove storage large_number:math store_det_input[-5][-1]
data remove storage large_number:math store_det_input[-6][-1]
data remove storage large_number:math store_det_input[-7][-1]
data remove storage large_number:math store_det_input[-8][-1]
data remove storage large_number:math store_det_input[-9][-1]
data remove storage large_number:math store_det_input[-10][-1]

#对取到的最大值取绝对值

data modify storage large_number:math temp1 set from storage large_number:math store_det_input[0][0]
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:linear_equations/macro1 with storage large_number:math

#判断其接近0的程度
scoreboard players set #max_precision int 1
execute store result score #temp1 int run data get storage large_number:math temp1
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int 0
execute store result score #temp1 int run data get storage large_number:math temp1 10
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int -1
execute store result score #temp1 int run data get storage large_number:math temp1 100
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int -2
execute store result score #temp1 int run data get storage large_number:math temp1 1000
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int -3
execute store result score #temp1 int run data get storage large_number:math temp1 10000
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int -4
execute store result score #temp1 int run data get storage large_number:math temp1 100000
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int -5
execute store result score #temp1 int run data get storage large_number:math temp1 1000000
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int -6
execute store result score #temp1 int run data get storage large_number:math temp1 10000000
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int -7
execute store result score #temp1 int run data get storage large_number:math temp1 100000000
execute if score #temp1 int matches 0 run scoreboard players set #max_precision int -8

execute if score #max_precision int <= #temp_min_approaching int run scoreboard players set #determinant.order int -2

execute store result storage large_number:math temp1 int 1 run scoreboard players get #max_precision int
data modify storage large_number:math temp_int_extrema_inp append from storage large_number:math temp1
