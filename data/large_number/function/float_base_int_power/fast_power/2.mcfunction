##快速幂

#指数：#temp_float_base_int_power_temp1 large_number.int
#底数：storage large_number:math sstemp1

#快速幂算法原理：https://baike.baidu.com/item/%E5%BF%AB%E9%80%9F%E5%B9%82

#floor(log2(x))
execute store result score #stemp1 large_number.int run scoreboard players operation #temp large_number.int = #temp_float_base_int_power_temp1 large_number.int
scoreboard players reset #loop large_number.int
execute store result score #loop large_number.int run function large_number:float_base_int_power/fast_power/floor_log2x

#转二进制
data modify storage large_number:math temp_convert_deci set value [{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0},{a:0,c_1:0,c_2:0,c_3:0,c_4:0,exp:0}]
execute if score #stemp1 large_number.int matches 1073741824.. store success storage large_number:math temp_convert_deci[0].a int 1 run scoreboard players remove #stemp1 large_number.int 1073741824
execute if score #stemp1 large_number.int matches 536870912.. store success storage large_number:math temp_convert_deci[1].a int 1 run scoreboard players remove #stemp1 large_number.int 536870912
execute if score #stemp1 large_number.int matches 268435456.. store success storage large_number:math temp_convert_deci[2].a int 1 run scoreboard players remove #stemp1 large_number.int 268435456
execute if score #stemp1 large_number.int matches 134217728.. store success storage large_number:math temp_convert_deci[3].a int 1 run scoreboard players remove #stemp1 large_number.int 134217728
execute if score #stemp1 large_number.int matches 67108864.. store success storage large_number:math temp_convert_deci[4].a int 1 run scoreboard players remove #stemp1 large_number.int 67108864
execute if score #stemp1 large_number.int matches 33554432.. store success storage large_number:math temp_convert_deci[5].a int 1 run scoreboard players remove #stemp1 large_number.int 33554432
execute if score #stemp1 large_number.int matches 16777216.. store success storage large_number:math temp_convert_deci[6].a int 1 run scoreboard players remove #stemp1 large_number.int 16777216
execute if score #stemp1 large_number.int matches 8388608.. store success storage large_number:math temp_convert_deci[7].a int 1 run scoreboard players remove #stemp1 large_number.int 8388608
execute if score #stemp1 large_number.int matches 4194304.. store success storage large_number:math temp_convert_deci[8].a int 1 run scoreboard players remove #stemp1 large_number.int 4194304
execute if score #stemp1 large_number.int matches 2097152.. store success storage large_number:math temp_convert_deci[9].a int 1 run scoreboard players remove #stemp1 large_number.int 2097152
execute if score #stemp1 large_number.int matches 1048576.. store success storage large_number:math temp_convert_deci[10].a int 1 run scoreboard players remove #stemp1 large_number.int 1048576
execute if score #stemp1 large_number.int matches 524288.. store success storage large_number:math temp_convert_deci[11].a int 1 run scoreboard players remove #stemp1 large_number.int 524288
execute if score #stemp1 large_number.int matches 262144.. store success storage large_number:math temp_convert_deci[12].a int 1 run scoreboard players remove #stemp1 large_number.int 262144
execute if score #stemp1 large_number.int matches 131072.. store success storage large_number:math temp_convert_deci[13].a int 1 run scoreboard players remove #stemp1 large_number.int 131072
execute if score #stemp1 large_number.int matches 65536.. store success storage large_number:math temp_convert_deci[14].a int 1 run scoreboard players remove #stemp1 large_number.int 65536
execute if score #stemp1 large_number.int matches 32768.. store success storage large_number:math temp_convert_deci[15].a int 1 run scoreboard players remove #stemp1 large_number.int 32768
execute if score #stemp1 large_number.int matches 16384.. store success storage large_number:math temp_convert_deci[16].a int 1 run scoreboard players remove #stemp1 large_number.int 16384
execute if score #stemp1 large_number.int matches 8192.. store success storage large_number:math temp_convert_deci[17].a int 1 run scoreboard players remove #stemp1 large_number.int 8192
execute if score #stemp1 large_number.int matches 4096.. store success storage large_number:math temp_convert_deci[18].a int 1 run scoreboard players remove #stemp1 large_number.int 4096
execute if score #stemp1 large_number.int matches 2048.. store success storage large_number:math temp_convert_deci[19].a int 1 run scoreboard players remove #stemp1 large_number.int 2048
execute if score #stemp1 large_number.int matches 1024.. store success storage large_number:math temp_convert_deci[20].a int 1 run scoreboard players remove #stemp1 large_number.int 1024
execute if score #stemp1 large_number.int matches 512.. store success storage large_number:math temp_convert_deci[21].a int 1 run scoreboard players remove #stemp1 large_number.int 512
execute if score #stemp1 large_number.int matches 256.. store success storage large_number:math temp_convert_deci[22].a int 1 run scoreboard players remove #stemp1 large_number.int 256
execute if score #stemp1 large_number.int matches 128.. store success storage large_number:math temp_convert_deci[23].a int 1 run scoreboard players remove #stemp1 large_number.int 128
execute if score #stemp1 large_number.int matches 64.. store success storage large_number:math temp_convert_deci[24].a int 1 run scoreboard players remove #stemp1 large_number.int 64
execute if score #stemp1 large_number.int matches 32.. store success storage large_number:math temp_convert_deci[25].a int 1 run scoreboard players remove #stemp1 large_number.int 32
execute if score #stemp1 large_number.int matches 16.. store success storage large_number:math temp_convert_deci[26].a int 1 run scoreboard players remove #stemp1 large_number.int 16
execute if score #stemp1 large_number.int matches 8.. store success storage large_number:math temp_convert_deci[27].a int 1 run scoreboard players remove #stemp1 large_number.int 8
execute if score #stemp1 large_number.int matches 4.. store success storage large_number:math temp_convert_deci[28].a int 1 run scoreboard players remove #stemp1 large_number.int 4
execute if score #stemp1 large_number.int matches 2.. store success storage large_number:math temp_convert_deci[29].a int 1 run scoreboard players remove #stemp1 large_number.int 2
execute if score #stemp1 large_number.int matches 1.. run data modify storage large_number:math temp_convert_deci[30].a set value 1

#从低位往高位把底数不断自我平方floor(log2(x))次，并存入该位的对应的列表项里

data modify storage large_number:math temp_array_c set value {c_1:0,c_2:0,c_3:0,c_4:0,exp:0}
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sstemp1
function large_number:float_base_int_power/fast_power/float_mul.to_array
data modify storage large_number:math temp_convert_deci[30] merge from storage large_number:math temp_array_c
execute if score #loop large_number.int matches 1.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 1.. run data modify storage large_number:math temp_convert_deci[29] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 2.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 2.. run data modify storage large_number:math temp_convert_deci[28] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 3.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 3.. run data modify storage large_number:math temp_convert_deci[27] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 4.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 4.. run data modify storage large_number:math temp_convert_deci[26] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 5.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 5.. run data modify storage large_number:math temp_convert_deci[25] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 6.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 6.. run data modify storage large_number:math temp_convert_deci[24] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 7.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 7.. run data modify storage large_number:math temp_convert_deci[23] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 8.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 8.. run data modify storage large_number:math temp_convert_deci[22] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 9.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 9.. run data modify storage large_number:math temp_convert_deci[21] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 10.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 10.. run data modify storage large_number:math temp_convert_deci[20] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 11.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 11.. run data modify storage large_number:math temp_convert_deci[19] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 12.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 12.. run data modify storage large_number:math temp_convert_deci[18] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 13.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 13.. run data modify storage large_number:math temp_convert_deci[17] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 14.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 14.. run data modify storage large_number:math temp_convert_deci[16] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 15.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 15.. run data modify storage large_number:math temp_convert_deci[15] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 16.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 16.. run data modify storage large_number:math temp_convert_deci[14] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 17.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 17.. run data modify storage large_number:math temp_convert_deci[13] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 18.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 18.. run data modify storage large_number:math temp_convert_deci[12] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 19.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 19.. run data modify storage large_number:math temp_convert_deci[11] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 20.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 20.. run data modify storage large_number:math temp_convert_deci[10] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 21.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 21.. run data modify storage large_number:math temp_convert_deci[9] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 22.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 22.. run data modify storage large_number:math temp_convert_deci[8] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 23.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 23.. run data modify storage large_number:math temp_convert_deci[7] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 24.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 24.. run data modify storage large_number:math temp_convert_deci[6] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 25.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 25.. run data modify storage large_number:math temp_convert_deci[5] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 26.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 26.. run data modify storage large_number:math temp_convert_deci[4] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 27.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 27.. run data modify storage large_number:math temp_convert_deci[3] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 28.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 28.. run data modify storage large_number:math temp_convert_deci[2] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 29.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 29.. run data modify storage large_number:math temp_convert_deci[1] merge from storage large_number:math temp_array_c

execute if score #loop large_number.int matches 30.. run function large_number:float_base_int_power/fast_power/float_mul.spe_squ
execute if score #loop large_number.int matches 30.. run data modify storage large_number:math temp_convert_deci[0] merge from storage large_number:math temp_array_c

#忽略对应二进制位为0的项
data remove storage large_number:math temp_convert_deci[{a:0}]

#保留下来的列表各项的c就是把乘幂按指数的二进制位拆开了，把这些项再乘起来即可
data modify storage large_number:math temp_array_c_2 set from storage large_number:math temp_convert_deci[0]
execute store result score #double_to_int.1 large_number.int run data get storage large_number:math temp_array_c_2.c_1
execute store result score #double_to_int.5 large_number.int run data get storage large_number:math temp_array_c_2.c_2
execute store result score #double_to_int.9 large_number.int run data get storage large_number:math temp_array_c_2.c_3
execute store result score #double_to_int.13 large_number.int run data get storage large_number:math temp_array_c_2.c_4
execute store result score #double_to_int.expon.1 large_number.int run data get storage large_number:math temp_array_c_2.exp
execute if data storage large_number:math temp_convert_deci[1] run function large_number:float_base_int_power/fast_power/3

#把记分板数值输出为浮点数

execute store result storage large_number:math sstemp2 int 1 run scoreboard players get #double_to_int.expon.1 large_number.int
execute store result storage large_number:math temp1 int 1 run scoreboard players get #double_to_int.1 large_number.int
execute store result storage large_number:math temp2 int 1 run scoreboard players add #double_to_int.5 large_number.int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #double_to_int.9 large_number.int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #double_to_int.13 large_number.int 10000
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1

scoreboard players set #stempv large_number.int 0
function large_number:float_base_int_power/fast_power/macro1 with storage large_number:math
execute if score #stempv large_number.int matches 0 run scoreboard players set #temp_exp_out_so_large large_number.int 1

data modify storage large_number:math temp_convert_deci[0] set from storage large_number:math q0
