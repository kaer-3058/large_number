#scoreboard players set #input1 int 77441156
#scoreboard players set #input2 int 22339017

execute store result storage large_number:math temp1 int 1 run scoreboard players get #input1 int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #input2 int
function large_number:int_mul2/macro1 with storage large_number:math
