##整数转二进制

#scoreboard players set #convert_decimal_to_binary.input large_number.int 66359

#tellraw @a {"nbt":"convert_decimal_to_binary_out[]","storage":"large_number:math","separator":""}

data modify storage large_number:math convert_decimal_to_binary_out set value [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
scoreboard players operation #temp large_number.int = #convert_decimal_to_binary.input large_number.int
execute if score #temp large_number.int matches ..-1 store success storage large_number:math convert_decimal_to_binary_out[0] int 1 run scoreboard players operation #temp large_number.int -= -2147483648 const
execute if score #temp large_number.int matches 1073741824.. store success storage large_number:math convert_decimal_to_binary_out[1] int 1 run scoreboard players remove #temp large_number.int 1073741824
execute if score #temp large_number.int matches 536870912.. store success storage large_number:math convert_decimal_to_binary_out[2] int 1 run scoreboard players remove #temp large_number.int 536870912
execute if score #temp large_number.int matches 268435456.. store success storage large_number:math convert_decimal_to_binary_out[3] int 1 run scoreboard players remove #temp large_number.int 268435456
execute if score #temp large_number.int matches 134217728.. store success storage large_number:math convert_decimal_to_binary_out[4] int 1 run scoreboard players remove #temp large_number.int 134217728
execute if score #temp large_number.int matches 67108864.. store success storage large_number:math convert_decimal_to_binary_out[5] int 1 run scoreboard players remove #temp large_number.int 67108864
execute if score #temp large_number.int matches 33554432.. store success storage large_number:math convert_decimal_to_binary_out[6] int 1 run scoreboard players remove #temp large_number.int 33554432
execute if score #temp large_number.int matches 16777216.. store success storage large_number:math convert_decimal_to_binary_out[7] int 1 run scoreboard players remove #temp large_number.int 16777216
execute if score #temp large_number.int matches 8388608.. store success storage large_number:math convert_decimal_to_binary_out[8] int 1 run scoreboard players remove #temp large_number.int 8388608
execute if score #temp large_number.int matches 4194304.. store success storage large_number:math convert_decimal_to_binary_out[9] int 1 run scoreboard players remove #temp large_number.int 4194304
execute if score #temp large_number.int matches 2097152.. store success storage large_number:math convert_decimal_to_binary_out[10] int 1 run scoreboard players remove #temp large_number.int 2097152
execute if score #temp large_number.int matches 1048576.. store success storage large_number:math convert_decimal_to_binary_out[11] int 1 run scoreboard players remove #temp large_number.int 1048576
execute if score #temp large_number.int matches 524288.. store success storage large_number:math convert_decimal_to_binary_out[12] int 1 run scoreboard players remove #temp large_number.int 524288
execute if score #temp large_number.int matches 262144.. store success storage large_number:math convert_decimal_to_binary_out[13] int 1 run scoreboard players remove #temp large_number.int 262144
execute if score #temp large_number.int matches 131072.. store success storage large_number:math convert_decimal_to_binary_out[14] int 1 run scoreboard players remove #temp large_number.int 131072
execute if score #temp large_number.int matches 65536.. store success storage large_number:math convert_decimal_to_binary_out[15] int 1 run scoreboard players remove #temp large_number.int 65536
execute if score #temp large_number.int matches 32768.. store success storage large_number:math convert_decimal_to_binary_out[16] int 1 run scoreboard players remove #temp large_number.int 32768
execute if score #temp large_number.int matches 16384.. store success storage large_number:math convert_decimal_to_binary_out[17] int 1 run scoreboard players remove #temp large_number.int 16384
execute if score #temp large_number.int matches 8192.. store success storage large_number:math convert_decimal_to_binary_out[18] int 1 run scoreboard players remove #temp large_number.int 8192
execute if score #temp large_number.int matches 4096.. store success storage large_number:math convert_decimal_to_binary_out[19] int 1 run scoreboard players remove #temp large_number.int 4096
execute if score #temp large_number.int matches 2048.. store success storage large_number:math convert_decimal_to_binary_out[20] int 1 run scoreboard players remove #temp large_number.int 2048
execute if score #temp large_number.int matches 1024.. store success storage large_number:math convert_decimal_to_binary_out[21] int 1 run scoreboard players remove #temp large_number.int 1024
execute if score #temp large_number.int matches 512.. store success storage large_number:math convert_decimal_to_binary_out[22] int 1 run scoreboard players remove #temp large_number.int 512
execute if score #temp large_number.int matches 256.. store success storage large_number:math convert_decimal_to_binary_out[23] int 1 run scoreboard players remove #temp large_number.int 256
execute if score #temp large_number.int matches 128.. store success storage large_number:math convert_decimal_to_binary_out[24] int 1 run scoreboard players remove #temp large_number.int 128
execute if score #temp large_number.int matches 64.. store success storage large_number:math convert_decimal_to_binary_out[25] int 1 run scoreboard players remove #temp large_number.int 64
execute if score #temp large_number.int matches 32.. store success storage large_number:math convert_decimal_to_binary_out[26] int 1 run scoreboard players remove #temp large_number.int 32
execute if score #temp large_number.int matches 16.. store success storage large_number:math convert_decimal_to_binary_out[27] int 1 run scoreboard players remove #temp large_number.int 16
execute if score #temp large_number.int matches 8.. store success storage large_number:math convert_decimal_to_binary_out[28] int 1 run scoreboard players remove #temp large_number.int 8
execute if score #temp large_number.int matches 4.. store success storage large_number:math convert_decimal_to_binary_out[29] int 1 run scoreboard players remove #temp large_number.int 4
execute if score #temp large_number.int matches 2.. store success storage large_number:math convert_decimal_to_binary_out[30] int 1 run scoreboard players remove #temp large_number.int 2
execute if score #temp large_number.int matches 1.. run data modify storage large_number:math convert_decimal_to_binary_out[31] set value 1
