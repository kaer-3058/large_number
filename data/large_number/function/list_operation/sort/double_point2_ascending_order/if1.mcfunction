data modify storage large_number:math temp1 set from storage large_number:math stemp0[1]
data modify storage large_number:math stemp0[1] set from storage large_number:math stemp0[0]
data modify storage large_number:math stemp0[0] set from storage large_number:math temp1
scoreboard players set #temp_sorting int 1