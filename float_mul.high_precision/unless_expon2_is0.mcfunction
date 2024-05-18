execute store result score #input2_expon int run data get storage large_number:math temp_float_mul_input2_string

scoreboard players operation #input2_expon int *= -1 const
scoreboard players add #input2_expon int 1
scoreboard players operation #input2_expon int += #float_mul.high_precision.input2.expon int
