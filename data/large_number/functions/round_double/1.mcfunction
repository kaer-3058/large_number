data modify storage large_number:math temp2 set value ""
function large_number:round_double/macro1 with storage large_number:math round_double
data modify storage large_number:math sstemp2 set from storage large_number:math temp2

data modify storage large_number:math sstempf set value ""
data modify storage large_number:math sstempg set value ""
execute store result score #sstemp1 int run data get storage large_number:math temp2
execute if score #sstemp1 int matches 1.. run function large_number:round_double/loop1
execute if data storage large_number:math {temp1:"."} run data modify storage large_number:math temp2 set string storage large_number:math temp2 0 -1
execute if data storage large_number:math {temp1:"."} run data modify storage large_number:math sstempg set from storage large_number:math sstempf

function large_number:round_double/macro2 with storage large_number:math

data modify storage large_number:math sstemph set from storage large_number:math round_double.output
execute if data storage large_number:math round_double{output:"d"} run data modify storage large_number:math round_double.output set from storage large_number:math round_double.input
execute if data storage large_number:math round_double{output:"-d"} run data modify storage large_number:math round_double.output set from storage large_number:math round_double.input
data modify storage large_number:math temp2 set value ""
data modify storage large_number:math temp2 set string storage large_number:math sstemp2 0 1
data modify storage large_number:math temp3 set value ""
data modify storage large_number:math temp3 set string storage large_number:math sstemp2 0 2
execute if data storage large_number:math {temp2:"."} run data modify storage large_number:math round_double.output set value 0.0
execute if data storage large_number:math {temp3:"-."} run data modify storage large_number:math round_double.output set value 0.0

data modify storage large_number:math temp2 set value ""
data modify storage large_number:math temp2 set string storage large_number:math round_double.input 0 1
execute unless score #round_towards_zero int matches 1 unless data storage large_number:math {sstempg:""} if data storage large_number:math {temp2:"-"} run function large_number:round_double/rouding
