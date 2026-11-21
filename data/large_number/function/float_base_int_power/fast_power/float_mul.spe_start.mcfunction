##16位数相乘

#    1234
# *  1234
#-----------
#    abcd
#   efgh
#  ijkl
# mnop

#double_to_int.1 large_number.int * #float_mul.high_precision.input2.1 large_number.int

scoreboard players operation #d large_number.int = #double_to_int.13 large_number.int
execute store result score #5.4 large_number.int run scoreboard players operation #d large_number.int *= #float_mul.high_precision.input2.4 large_number.int
scoreboard players operation #c large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #c large_number.int *= #float_mul.high_precision.input2.4 large_number.int
scoreboard players operation #b large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #b large_number.int *= #float_mul.high_precision.input2.4 large_number.int
scoreboard players operation #a large_number.int = #double_to_int.1 large_number.int
scoreboard players operation #a large_number.int *= #float_mul.high_precision.input2.4 large_number.int

scoreboard players operation #h large_number.int = #double_to_int.13 large_number.int
scoreboard players operation #h large_number.int *= #float_mul.high_precision.input2.3 large_number.int
scoreboard players operation #g large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #g large_number.int *= #float_mul.high_precision.input2.3 large_number.int
scoreboard players operation #f large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #f large_number.int *= #float_mul.high_precision.input2.3 large_number.int
scoreboard players operation #e large_number.int = #double_to_int.1 large_number.int
scoreboard players operation #e large_number.int *= #float_mul.high_precision.input2.3 large_number.int

scoreboard players operation #l large_number.int = #double_to_int.13 large_number.int
scoreboard players operation #l large_number.int *= #float_mul.high_precision.input2.2 large_number.int
scoreboard players operation #k large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #k large_number.int *= #float_mul.high_precision.input2.2 large_number.int
scoreboard players operation #j large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #j large_number.int *= #float_mul.high_precision.input2.2 large_number.int
scoreboard players operation #i large_number.int = #double_to_int.1 large_number.int
scoreboard players operation #i large_number.int *= #float_mul.high_precision.input2.2 large_number.int

scoreboard players operation #double_to_int.13 large_number.int *= #float_mul.high_precision.input2.1 large_number.int
scoreboard players operation #double_to_int.9 large_number.int *= #float_mul.high_precision.input2.1 large_number.int
scoreboard players operation #double_to_int.5 large_number.int *= #float_mul.high_precision.input2.1 large_number.int
scoreboard players operation #double_to_int.1 large_number.int *= #float_mul.high_precision.input2.1 large_number.int

scoreboard players operation #h large_number.int += #c large_number.int
scoreboard players operation #l large_number.int += #g large_number.int
scoreboard players operation #l large_number.int += #b large_number.int
scoreboard players operation #double_to_int.13 large_number.int += #k large_number.int
scoreboard players operation #double_to_int.13 large_number.int += #f large_number.int
scoreboard players operation #double_to_int.13 large_number.int += #a large_number.int
scoreboard players operation #double_to_int.9 large_number.int += #j large_number.int
scoreboard players operation #double_to_int.9 large_number.int += #e large_number.int
scoreboard players operation #double_to_int.5 large_number.int += #i large_number.int

scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #h large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #l large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #double_to_int.13 large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #double_to_int.9 large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #double_to_int.5 large_number.int += #5.4 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #z large_number.int run scoreboard players operation #double_to_int.1 large_number.int += #5.4 large_number.int

scoreboard players operation #z large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #double_to_int.1 large_number.int %= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #double_to_int.5 large_number.int %= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #double_to_int.9 large_number.int %= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #double_to_int.13 large_number.int %= 10000 const


##最终输出

scoreboard players operation #double_to_int.expon.1 large_number.int += #float_mul.high_precision.input2.expon large_number.int
execute if score #z large_number.int matches ..999 run function large_number:float_base_int_power/fast_power/float_mul.spe_squ.if_1

scoreboard players operation #double_to_int.13 large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #double_to_int.9 large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #double_to_int.5 large_number.int = #double_to_int.1 large_number.int
scoreboard players operation #double_to_int.1 large_number.int = #z large_number.int
