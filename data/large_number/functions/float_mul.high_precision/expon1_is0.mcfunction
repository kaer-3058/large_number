execute store result score #input1_expon int run data get storage large_number:math temp_float_mul_input1_string

scoreboard players operation #input1_expon int *= -1 const
scoreboard players operation #input1_expon int += #float_mul.high_precision.input1.point int
scoreboard players remove #input1_expon int 1
