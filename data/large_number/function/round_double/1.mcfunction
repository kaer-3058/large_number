#data modify storage large_number:math round_double.input set value 38.6625
#向0取整：scoreboard players set #round_towards_zero large_number.int 1

function large_number:round_double/macro1 with storage large_number:math round_double
execute store result score #round_double.output large_number.int run data get storage large_number:math q1
data modify storage large_number:math q1 set string storage large_number:math q1 0 -1
function large_number:round_double/macro2 with storage large_number:math

data modify storage large_number:math round_double.output set from storage large_number:math q1

data modify storage large_number:math stemp4 set string storage large_number:math round_double.input 0 1
execute unless score #round_towards_zero large_number.int matches 1 if data storage large_number:math {stemp4:"-"} run function large_number:round_double/2
