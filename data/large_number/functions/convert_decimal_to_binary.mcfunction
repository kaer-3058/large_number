##整数转二进制

#scoreboard players set #convert_decimal_to_binary.input int 66359

#tellraw @a {"nbt":"convert_decimal_to_binary_out[]","storage":"large_number:math","separator":""}

data modify storage large_number:math convert_decimal_to_binary_out set value [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
scoreboard players operation #temp int = #convert_decimal_to_binary.input int
execute if score #temp int matches ..-1 run data modify storage large_number:math convert_decimal_to_binary_out[0] set value 1
execute if score #temp int matches ..-1 run scoreboard players operation #temp int -= -2147483648 const
execute if score #temp int matches 1073741824.. run data modify storage large_number:math convert_decimal_to_binary_out[1] set value 1
execute if score #temp int matches 1073741824.. run scoreboard players remove #temp int 1073741824
execute if score #temp int matches 536870912.. run data modify storage large_number:math convert_decimal_to_binary_out[2] set value 1
execute if score #temp int matches 536870912.. run scoreboard players remove #temp int 536870912
execute if score #temp int matches 268435456.. run data modify storage large_number:math convert_decimal_to_binary_out[3] set value 1
execute if score #temp int matches 268435456.. run scoreboard players remove #temp int 268435456
execute if score #temp int matches 134217728.. run data modify storage large_number:math convert_decimal_to_binary_out[4] set value 1
execute if score #temp int matches 134217728.. run scoreboard players remove #temp int 134217728
execute if score #temp int matches 67108864.. run data modify storage large_number:math convert_decimal_to_binary_out[5] set value 1
execute if score #temp int matches 67108864.. run scoreboard players remove #temp int 67108864
execute if score #temp int matches 33554432.. run data modify storage large_number:math convert_decimal_to_binary_out[6] set value 1
execute if score #temp int matches 33554432.. run scoreboard players remove #temp int 33554432
execute if score #temp int matches 16777216.. run data modify storage large_number:math convert_decimal_to_binary_out[7] set value 1
execute if score #temp int matches 16777216.. run scoreboard players remove #temp int 16777216
execute if score #temp int matches 8388608.. run data modify storage large_number:math convert_decimal_to_binary_out[8] set value 1
execute if score #temp int matches 8388608.. run scoreboard players remove #temp int 8388608
execute if score #temp int matches 4194304.. run data modify storage large_number:math convert_decimal_to_binary_out[9] set value 1
execute if score #temp int matches 4194304.. run scoreboard players remove #temp int 4194304
execute if score #temp int matches 2097152.. run data modify storage large_number:math convert_decimal_to_binary_out[10] set value 1
execute if score #temp int matches 2097152.. run scoreboard players remove #temp int 2097152
execute if score #temp int matches 1048576.. run data modify storage large_number:math convert_decimal_to_binary_out[11] set value 1
execute if score #temp int matches 1048576.. run scoreboard players remove #temp int 1048576
execute if score #temp int matches 524288.. run data modify storage large_number:math convert_decimal_to_binary_out[12] set value 1
execute if score #temp int matches 524288.. run scoreboard players remove #temp int 524288
execute if score #temp int matches 262144.. run data modify storage large_number:math convert_decimal_to_binary_out[13] set value 1
execute if score #temp int matches 262144.. run scoreboard players remove #temp int 262144
execute if score #temp int matches 131072.. run data modify storage large_number:math convert_decimal_to_binary_out[14] set value 1
execute if score #temp int matches 131072.. run scoreboard players remove #temp int 131072
execute if score #temp int matches 65536.. run data modify storage large_number:math convert_decimal_to_binary_out[15] set value 1
execute if score #temp int matches 65536.. run scoreboard players remove #temp int 65536
execute if score #temp int matches 32768.. run data modify storage large_number:math convert_decimal_to_binary_out[16] set value 1
execute if score #temp int matches 32768.. run scoreboard players remove #temp int 32768
execute if score #temp int matches 16384.. run data modify storage large_number:math convert_decimal_to_binary_out[17] set value 1
execute if score #temp int matches 16384.. run scoreboard players remove #temp int 16384
execute if score #temp int matches 8192.. run data modify storage large_number:math convert_decimal_to_binary_out[18] set value 1
execute if score #temp int matches 8192.. run scoreboard players remove #temp int 8192
execute if score #temp int matches 4096.. run data modify storage large_number:math convert_decimal_to_binary_out[19] set value 1
execute if score #temp int matches 4096.. run scoreboard players remove #temp int 4096
execute if score #temp int matches 2048.. run data modify storage large_number:math convert_decimal_to_binary_out[20] set value 1
execute if score #temp int matches 2048.. run scoreboard players remove #temp int 2048
execute if score #temp int matches 1024.. run data modify storage large_number:math convert_decimal_to_binary_out[21] set value 1
execute if score #temp int matches 1024.. run scoreboard players remove #temp int 1024
execute if score #temp int matches 512.. run data modify storage large_number:math convert_decimal_to_binary_out[22] set value 1
execute if score #temp int matches 512.. run scoreboard players remove #temp int 512
execute if score #temp int matches 256.. run data modify storage large_number:math convert_decimal_to_binary_out[23] set value 1
execute if score #temp int matches 256.. run scoreboard players remove #temp int 256
execute if score #temp int matches 128.. run data modify storage large_number:math convert_decimal_to_binary_out[24] set value 1
execute if score #temp int matches 128.. run scoreboard players remove #temp int 128
execute if score #temp int matches 64.. run data modify storage large_number:math convert_decimal_to_binary_out[25] set value 1
execute if score #temp int matches 64.. run scoreboard players remove #temp int 64
execute if score #temp int matches 32.. run data modify storage large_number:math convert_decimal_to_binary_out[26] set value 1
execute if score #temp int matches 32.. run scoreboard players remove #temp int 32
execute if score #temp int matches 16.. run data modify storage large_number:math convert_decimal_to_binary_out[27] set value 1
execute if score #temp int matches 16.. run scoreboard players remove #temp int 16
execute if score #temp int matches 8.. run data modify storage large_number:math convert_decimal_to_binary_out[28] set value 1
execute if score #temp int matches 8.. run scoreboard players remove #temp int 8
execute if score #temp int matches 4.. run data modify storage large_number:math convert_decimal_to_binary_out[29] set value 1
execute if score #temp int matches 4.. run scoreboard players remove #temp int 4
execute if score #temp int matches 2.. run data modify storage large_number:math convert_decimal_to_binary_out[30] set value 1
execute if score #temp int matches 2.. run scoreboard players remove #temp int 2
execute if score #temp int matches 1.. run data modify storage large_number:math convert_decimal_to_binary_out[31] set value 1
