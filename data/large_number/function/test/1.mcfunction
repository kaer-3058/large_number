execute if score #stemp1 large_number.int matches 10001.. run return 0
#data modify storage large_number:math gamma_databse."10000" set value 1.000000000000000E00d
execute store result storage large_number:math temp1 int 1 run scoreboard players get #stemp1 large_number.int
function large_number:test/macro1 with storage large_number:math
function large_number:float_base_int_power/fast_mul/to_array
tellraw @a ["data modify storage large_number:math gamma_databse.\"",{score:{name:"#stemp1",objective:"large_number.int"}},"\" set value {\"a\":",{score:{name:"#double_to_int.1",objective:"large_number.int"}},",\"b\":",{score:{name:"#double_to_int.5",objective:"large_number.int"}},",\"c\":",{score:{name:"#double_to_int.9",objective:"large_number.int"}},",\"d\":",{score:{name:"#double_to_int.13",objective:"large_number.int"}},",\"e\":",{score:{name:"#double_to_int.expon.1",objective:"large_number.int"}},"}"]
scoreboard players add #stemp1 large_number.int 1

execute if score #stemp1 large_number.int matches 10001.. run return 0
#data modify storage large_number:math gamma_databse."10000" set value 1.000000000000000E00d
execute store result storage large_number:math temp1 int 1 run scoreboard players get #stemp1 large_number.int
function large_number:test/macro1 with storage large_number:math
function large_number:float_base_int_power/fast_mul/to_array
tellraw @a ["data modify storage large_number:math gamma_databse.\"",{score:{name:"#stemp1",objective:"large_number.int"}},"\" set value {\"a\":",{score:{name:"#double_to_int.1",objective:"large_number.int"}},",\"b\":",{score:{name:"#double_to_int.5",objective:"large_number.int"}},",\"c\":",{score:{name:"#double_to_int.9",objective:"large_number.int"}},",\"d\":",{score:{name:"#double_to_int.13",objective:"large_number.int"}},",\"e\":",{score:{name:"#double_to_int.expon.1",objective:"large_number.int"}},"}"]
scoreboard players add #stemp1 large_number.int 1
