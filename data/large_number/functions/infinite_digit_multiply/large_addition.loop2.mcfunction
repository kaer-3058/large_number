data modify storage math temp1 set from storage math temp_addi_list[0]
data modify storage math temp1 append value 0
data modify storage math temp2 set from storage math temp_addi_list[1]

scoreboard players set #temp1 int 0
execute if data storage math temp1[0] run scoreboard players set #temp1 int 1
execute if data storage math temp2[0] run scoreboard players set #temp1 int 1
execute if score #temp1 int matches 1 run function large_number:infinite_digit_multiply/large_addition.loop

data remove storage math temp_addi_list[0]
data modify storage math temp_addi_list[0] set from storage math stemp3
data modify storage math stemp3 set value []
execute if data storage math temp_addi_list[1] run function large_number:infinite_digit_multiply/large_addition.loop2
