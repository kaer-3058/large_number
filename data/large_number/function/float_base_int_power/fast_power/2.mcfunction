##快速幂

#指数：#temp_float_base_int_power_temp1 int
#底数：storage large_number:math sstemp1

#快速幂算法原理：https://baike.baidu.com/item/%E5%BF%AB%E9%80%9F%E5%B9%82

#floor(log2(x))
execute store result score #stemp1 int run scoreboard players operation #temp int = #temp_float_base_int_power_temp1 int
scoreboard players reset #loop int
execute store result score #loop int run function large_number:float_base_int_power/fast_power/floor_log2x

#转二进制
data modify storage large_number:math temp_convert_deci set value [{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0,},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0},{c:0,a:0}]
execute if score #stemp1 int matches 1073741824.. store success storage large_number:math temp_convert_deci[0].a int 1 run scoreboard players remove #stemp1 int 1073741824
execute if score #stemp1 int matches 536870912.. store success storage large_number:math temp_convert_deci[1].a int 1 run scoreboard players remove #stemp1 int 536870912
execute if score #stemp1 int matches 268435456.. store success storage large_number:math temp_convert_deci[2].a int 1 run scoreboard players remove #stemp1 int 268435456
execute if score #stemp1 int matches 134217728.. store success storage large_number:math temp_convert_deci[3].a int 1 run scoreboard players remove #stemp1 int 134217728
execute if score #stemp1 int matches 67108864.. store success storage large_number:math temp_convert_deci[4].a int 1 run scoreboard players remove #stemp1 int 67108864
execute if score #stemp1 int matches 33554432.. store success storage large_number:math temp_convert_deci[5].a int 1 run scoreboard players remove #stemp1 int 33554432
execute if score #stemp1 int matches 16777216.. store success storage large_number:math temp_convert_deci[6].a int 1 run scoreboard players remove #stemp1 int 16777216
execute if score #stemp1 int matches 8388608.. store success storage large_number:math temp_convert_deci[7].a int 1 run scoreboard players remove #stemp1 int 8388608
execute if score #stemp1 int matches 4194304.. store success storage large_number:math temp_convert_deci[8].a int 1 run scoreboard players remove #stemp1 int 4194304
execute if score #stemp1 int matches 2097152.. store success storage large_number:math temp_convert_deci[9].a int 1 run scoreboard players remove #stemp1 int 2097152
execute if score #stemp1 int matches 1048576.. store success storage large_number:math temp_convert_deci[10].a int 1 run scoreboard players remove #stemp1 int 1048576
execute if score #stemp1 int matches 524288.. store success storage large_number:math temp_convert_deci[11].a int 1 run scoreboard players remove #stemp1 int 524288
execute if score #stemp1 int matches 262144.. store success storage large_number:math temp_convert_deci[12].a int 1 run scoreboard players remove #stemp1 int 262144
execute if score #stemp1 int matches 131072.. store success storage large_number:math temp_convert_deci[13].a int 1 run scoreboard players remove #stemp1 int 131072
execute if score #stemp1 int matches 65536.. store success storage large_number:math temp_convert_deci[14].a int 1 run scoreboard players remove #stemp1 int 65536
execute if score #stemp1 int matches 32768.. store success storage large_number:math temp_convert_deci[15].a int 1 run scoreboard players remove #stemp1 int 32768
execute if score #stemp1 int matches 16384.. store success storage large_number:math temp_convert_deci[16].a int 1 run scoreboard players remove #stemp1 int 16384
execute if score #stemp1 int matches 8192.. store success storage large_number:math temp_convert_deci[17].a int 1 run scoreboard players remove #stemp1 int 8192
execute if score #stemp1 int matches 4096.. store success storage large_number:math temp_convert_deci[18].a int 1 run scoreboard players remove #stemp1 int 4096
execute if score #stemp1 int matches 2048.. store success storage large_number:math temp_convert_deci[19].a int 1 run scoreboard players remove #stemp1 int 2048
execute if score #stemp1 int matches 1024.. store success storage large_number:math temp_convert_deci[20].a int 1 run scoreboard players remove #stemp1 int 1024
execute if score #stemp1 int matches 512.. store success storage large_number:math temp_convert_deci[21].a int 1 run scoreboard players remove #stemp1 int 512
execute if score #stemp1 int matches 256.. store success storage large_number:math temp_convert_deci[22].a int 1 run scoreboard players remove #stemp1 int 256
execute if score #stemp1 int matches 128.. store success storage large_number:math temp_convert_deci[23].a int 1 run scoreboard players remove #stemp1 int 128
execute if score #stemp1 int matches 64.. store success storage large_number:math temp_convert_deci[24].a int 1 run scoreboard players remove #stemp1 int 64
execute if score #stemp1 int matches 32.. store success storage large_number:math temp_convert_deci[25].a int 1 run scoreboard players remove #stemp1 int 32
execute if score #stemp1 int matches 16.. store success storage large_number:math temp_convert_deci[26].a int 1 run scoreboard players remove #stemp1 int 16
execute if score #stemp1 int matches 8.. store success storage large_number:math temp_convert_deci[27].a int 1 run scoreboard players remove #stemp1 int 8
execute if score #stemp1 int matches 4.. store success storage large_number:math temp_convert_deci[28].a int 1 run scoreboard players remove #stemp1 int 4
execute if score #stemp1 int matches 2.. store success storage large_number:math temp_convert_deci[29].a int 1 run scoreboard players remove #stemp1 int 2
execute if score #stemp1 int matches 1.. run data modify storage large_number:math temp_convert_deci[30].a set value 1

#从低位往高位把底数不断自我平方floor(log2(x))次，并存入该位的对应的列表项里

data modify storage large_number:math temp_convert_deci[30].c set from storage large_number:math sstemp1
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[30].c
execute if score #loop int matches 1.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 1.. run data modify storage large_number:math temp_convert_deci[29].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[29].c
execute if score #loop int matches 2.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 2.. run data modify storage large_number:math temp_convert_deci[28].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[28].c
execute if score #loop int matches 3.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 3.. run data modify storage large_number:math temp_convert_deci[27].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[27].c
execute if score #loop int matches 4.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 4.. run data modify storage large_number:math temp_convert_deci[26].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[26].c
execute if score #loop int matches 5.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 5.. run data modify storage large_number:math temp_convert_deci[25].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[25].c
execute if score #loop int matches 6.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 6.. run data modify storage large_number:math temp_convert_deci[24].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[24].c
execute if score #loop int matches 7.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 7.. run data modify storage large_number:math temp_convert_deci[23].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[23].c
execute if score #loop int matches 8.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 8.. run data modify storage large_number:math temp_convert_deci[22].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[22].c
execute if score #loop int matches 9.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 9.. run data modify storage large_number:math temp_convert_deci[21].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[21].c
execute if score #loop int matches 10.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 10.. run data modify storage large_number:math temp_convert_deci[20].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[20].c
execute if score #loop int matches 11.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 11.. run data modify storage large_number:math temp_convert_deci[19].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[19].c
execute if score #loop int matches 12.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 12.. run data modify storage large_number:math temp_convert_deci[18].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[18].c
execute if score #loop int matches 13.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 13.. run data modify storage large_number:math temp_convert_deci[17].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[17].c
execute if score #loop int matches 14.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 14.. run data modify storage large_number:math temp_convert_deci[16].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[16].c
execute if score #loop int matches 15.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 15.. run data modify storage large_number:math temp_convert_deci[15].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[15].c
execute if score #loop int matches 16.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 16.. run data modify storage large_number:math temp_convert_deci[14].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[14].c
execute if score #loop int matches 17.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 17.. run data modify storage large_number:math temp_convert_deci[13].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[13].c
execute if score #loop int matches 18.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 18.. run data modify storage large_number:math temp_convert_deci[12].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[12].c
execute if score #loop int matches 19.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 19.. run data modify storage large_number:math temp_convert_deci[11].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[11].c
execute if score #loop int matches 20.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 20.. run data modify storage large_number:math temp_convert_deci[10].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[10].c
execute if score #loop int matches 21.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 21.. run data modify storage large_number:math temp_convert_deci[9].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[9].c
execute if score #loop int matches 22.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 22.. run data modify storage large_number:math temp_convert_deci[8].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[8].c
execute if score #loop int matches 23.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 23.. run data modify storage large_number:math temp_convert_deci[7].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[7].c
execute if score #loop int matches 24.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 24.. run data modify storage large_number:math temp_convert_deci[6].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[6].c
execute if score #loop int matches 25.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 25.. run data modify storage large_number:math temp_convert_deci[5].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[5].c
execute if score #loop int matches 26.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 26.. run data modify storage large_number:math temp_convert_deci[4].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[4].c
execute if score #loop int matches 27.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 27.. run data modify storage large_number:math temp_convert_deci[3].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[3].c
execute if score #loop int matches 28.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 28.. run data modify storage large_number:math temp_convert_deci[2].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[2].c
execute if score #loop int matches 29.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 29.. run data modify storage large_number:math temp_convert_deci[1].c set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[1].c
execute if score #loop int matches 30.. run function large_number:float_mul.high_precision/squ/start
execute if score #loop int matches 30.. run data modify storage large_number:math temp_convert_deci[0].c set from storage large_number:math float_multiply.output

#忽略对应二进制位为0的项
data remove storage large_number:math temp_convert_deci[{a:0}]

#保留下来的列表各项的c就是把乘幂按指数的二进制位拆开了，把这些项再乘起来即可
execute if data storage large_number:math temp_convert_deci[1] run function large_number:float_base_int_power/fast_power/3
