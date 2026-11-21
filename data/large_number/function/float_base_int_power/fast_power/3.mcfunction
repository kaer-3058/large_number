data modify storage large_number:math temp_array_c_2 set from storage large_number:math temp_convert_deci[1]
execute store result score #float_mul.high_precision.input2.1 large_number.int run data get storage large_number:math temp_array_c_2.c_1
execute store result score #float_mul.high_precision.input2.2 large_number.int run data get storage large_number:math temp_array_c_2.c_2
execute store result score #float_mul.high_precision.input2.3 large_number.int run data get storage large_number:math temp_array_c_2.c_3
execute store result score #float_mul.high_precision.input2.4 large_number.int run data get storage large_number:math temp_array_c_2.c_4
execute store result score #float_mul.high_precision.input2.expon large_number.int run data get storage large_number:math temp_array_c_2.exp
#tellraw @a ["1：",{score:{name:"#double_to_int.1",objective:"large_number.int"}}," ",{score:{name:"#double_to_int.5",objective:"large_number.int"}}," ",{score:{name:"#double_to_int.9",objective:"large_number.int"}}," ",{score:{name:"#double_to_int.13",objective:"large_number.int"}}," ",]
#tellraw @a ["2：",{score:{name:"#float_mul.high_precision.input2.1",objective:"large_number.int"}}," ",{score:{name:"#float_mul.high_precision.input2.2",objective:"large_number.int"}}," ",{score:{name:"#float_mul.high_precision.input2.3",objective:"large_number.int"}}," ",{score:{name:"#float_mul.high_precision.input2.4",objective:"large_number.int"}}," ",]
function large_number:float_base_int_power/fast_power/float_mul.spe_start

data remove storage large_number:math temp_convert_deci[1]
execute if data storage large_number:math temp_convert_deci[1] run function large_number:float_base_int_power/fast_power/3
